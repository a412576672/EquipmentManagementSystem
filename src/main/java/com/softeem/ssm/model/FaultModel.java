package com.softeem.ssm.model;

import com.softeem.ssm.entity.Equipment;
import com.softeem.ssm.entity.Fault;
import com.softeem.ssm.entity.Maintain;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class FaultModel extends Fault {
    private Equipment equipment;
    private Maintain maintain;

    @Override
    public String toString() {
        return "faultModel{" +super.toString()+
                "equipment=" + equipment +
                ", maintain=" + maintain +
                '}';
    }
}
