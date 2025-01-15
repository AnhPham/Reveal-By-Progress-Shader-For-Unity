using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RevealByProgressDemo : MonoBehaviour
{
    [SerializeField] RevealByProgress reveal;

    bool increasing;

    void Update()
    {
        if (increasing)
        {
            reveal.progress += Time.deltaTime * 0.5f;
            if (reveal.progress >= 1)
            {
                increasing = false;
            }
        }
        else
        {
            reveal.progress -= Time.deltaTime * 0.5f;
            if (reveal.progress <= 0)
            {
                increasing = true;
            }
        }
    }
}
