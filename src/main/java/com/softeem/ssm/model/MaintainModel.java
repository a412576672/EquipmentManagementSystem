package com.softeem.ssm.model;

import com.softeem.ssm.entity.Maintain;
import com.softeem.ssm.entity.Repairman;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class MaintainModel extends Maintain {
    private FaultModel faultModel;
    private Repairman repairman;

    @Override
    public String toString() {
        return "MaintainModel{" +super.toString()+
                "faultModel=" + faultModel +
                ", repairman=" + repairman +
                '}';
    }
}
