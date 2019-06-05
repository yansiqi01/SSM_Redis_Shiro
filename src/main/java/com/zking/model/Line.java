package com.zking.model;

import lombok.Data;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Data
@Service
public class Line  implements Serializable {
    private static final long serialVersionUID = 7130972112675234277L;
    private Integer LineId;//路线Id
    private String LineName;//路线名称
    private Double LineTh;//线路里程
    private Linetaile linetaile;//基本信息

}
