using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Health_Bar : MonoBehaviour
{
    public Slider slider;
    public Gradient gradient;
    public Image fill;
    
    public void Set_Health(int health)
    {
        slider.value = health;

        fill.color = gradient.Evaluate(slider.normalizedValue);
    }

    public void Set_Max_Health(int health)
    {
        slider.value = health;
        slider.maxValue = health;

        fill.color = gradient.Evaluate(1f);
    }
}
