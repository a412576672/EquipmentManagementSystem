package com.softeem.ssm.model;

import com.softeem.ssm.entity.Classify;
import com.softeem.ssm.entity.Equipment;
import com.softeem.ssm.entity.Fault;
import com.softeem.ssm.entity.Workshop;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class EquipmentModel extends Equipment {
    private Classify classify;
    private Workshop workshop;
    @Override
    public String toString() {
        return "EquipmentModel{" +super.toString()+
                "classify=" + classify +
                ", workshop=" + workshop +
                '}';
    }
}
