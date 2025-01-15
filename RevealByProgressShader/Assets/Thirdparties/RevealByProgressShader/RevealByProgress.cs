using UnityEngine;

public class RevealByProgress : MonoBehaviour
{
    Renderer objectRenderer;

    float _progress;

    public float progress
    {
        get
        {
            return _progress;
        }

        set
        {
            _progress = Mathf.Clamp01(value);

            if (objectRenderer != null && objectRenderer.material != null)
            {
                objectRenderer.material.SetFloat("_RevealProgress", _progress);
            }
        }
    }

    private void Awake()
    {
        objectRenderer = GetComponent<Renderer>();
    }

    private void Start()
    {
        RefreshPosition();
    }

    private void Update()
    {
        RefreshPosition();
    }

    private void RefreshPosition()
    {
        if (objectRenderer != null && objectRenderer.material != null)
        {
            Bounds bounds = objectRenderer.bounds;
            objectRenderer.material.SetFloat("_BoundsMinY", bounds.min.y);
            objectRenderer.material.SetFloat("_BoundsMaxY", bounds.max.y);
        }
    }
}