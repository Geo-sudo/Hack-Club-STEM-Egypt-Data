using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UIElements;

enum Direction{
Right,
Left,
None
};
public class TouchBtns : MonoBehaviour, IPointerDownHandler ,IPointerUpHandler
{
    [SerializeField] private Direction BtnDirection = Direction.None;

    public void OnPointerDown(PointerEventData eventData)
    {
        if (BtnDirection == Direction.Left)
        {
            Player.direction = Direction.Left;
        }
        else if (BtnDirection == Direction.Right)
        {
            Player.direction = Direction.Right;
        }
    }
    public void OnPointerUp(PointerEventData eventData)
    {
        if (BtnDirection == Direction.Left)
        {
            Player.direction = Direction.None;
        }
        else if (BtnDirection == Direction.Right)
        {
            Player.direction = Direction.None;
        }
    }
}
