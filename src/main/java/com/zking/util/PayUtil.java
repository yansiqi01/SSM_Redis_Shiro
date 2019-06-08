package com.zking.util;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.zking.model.PayModel;

public class PayUtil {

    private static Logger logger = LogManager.getLogger();

    public static String BASE_URL = "http://api.6688pay.com";

    public static String APP_ID = "10896";	//见后台
    public static String APP_SECRET = "63d9cdb03bc14ce49955a6af1d5d966e";	//见后台

    public static Map<String, Object> payOrder(Map<String, Object> remoteMap) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.putAll(remoteMap);
        paramMap.put("sign", getSign(remoteMap));
        return paramMap;
    }

    public static String getSign(Map<String, Object> remoteMap) {
        String key = "";

        key += "order_no=" + remoteMap.get("order_no");
        key += "&subject=" + remoteMap.get("subject");
        key += "&pay_type=" + remoteMap.get("pay_type");
        key += "&money=" + remoteMap.get("money");
        key += "&app_id=" + remoteMap.get("app_id");
        key += "&extra=" + remoteMap.get("extra");
        key += "&" + APP_SECRET;

        return MD5Util.encryption(key).toUpperCase();
    }

    public static boolean checkSign(PayModel payModel) {
        String key = "";
        key += "order_no=" + payModel.getOrder_no();
        key += "&subject=" + payModel.getSubject();
        key += "&pay_type=" + payModel.getPay_type();
        key += "&money=" + payModel.getMoney();
        key += "&realmoney=" + payModel.getRealmoney();
        key += "&result=" + payModel.getResult();
        key += "&xddpay_order=" + payModel.getXddpay_order();
        key += "&app_id=" + payModel.getApp_id();
        key += "&extra=" + payModel.getExtra();
        key += "&" + APP_SECRET;
        logger.info("支付回来的Key：" + payModel.getSign());
        logger.info("我们自己拼接的Key：" + MD5Util.encryption(key));

        return payModel.getSign().equals(MD5Util.encryption(key));
    }

    public static String getOrderIdByUUId() {
        int machineId = 1;// 最大支持1-9个集群机器部署
        int hashCodeV = UUID.randomUUID().toString().hashCode();
        if (hashCodeV < 0) {// 有可能是负数
            hashCodeV = -hashCodeV;
        }
        // 0 代表前面补充0;d 代表参数为正数型
        return machineId + String.format("%01d", hashCodeV);
    }

}
