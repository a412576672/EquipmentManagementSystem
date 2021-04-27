package com.softeem.ssm.model;

import com.softeem.ssm.entity.Classify;
import com.softeem.ssm.entity.Equipment;
import com.softeem.ssm.entity.Scrap;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class ScrapModel extends Scrap {
    private Equipment equipment;

    @Override
    public String toString() {
        return "ScrapModel{" + super.toString()+
                "equipment=" + equipment +
                '}';
    }
}
