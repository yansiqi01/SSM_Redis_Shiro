package com.zking.model;

import lombok.Data;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Data
@Service
public class Linetaile  implements Serializable {
    private static final long serialVersionUID = 5747638914210708274L;
    private Integer LinetaileId;//线路详情ID
    private Line line;//外键(路线id)
    private Deliveryspot deliveryspot;//外键(配送点ID)
    private Integer LinetaileIndex;//线路索引

}
