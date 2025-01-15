<h1>Reveal By Progress Shader for Unity</h1>

Reveal By Progress Shader is a custom shader that reveals an object based on a progress value. It features a clear boundary effect with a customizable color, separating the revealed area from the hidden area. Hidden sections can be filled with a specific color, and the effect is determined by the object’s Y-coordinate. Additional properties such as smoothness, metallic appearance, and boundary thickness allow for flexible customization.

<p align="center">
  <img width="500px" src="/learn/unity/shaders/demo.gif?raw=true" alt="Demo">
</p>

<h2>Basic Usage</h2>

<h3>1. Parameters</h3>

* <b>Hidden Color:</b> Color of the hidden area
* <b>Boundary Color:</b> Color of the boundary separating the revealed area from the hidden area
* <b>Boundary Thickness:</b> Thickness of the boundary.

<p align="center">
  <img width="500px" src="/learn/unity/shaders/shader.png?raw=true" alt="Demo">
</p>

<h3>2. Set Progress</h3>

Add the RevealByProgress component to the game object.

<p align="center">
  <img width="500px" src="/learn/unity/shaders/script?raw=true" alt="Demo">
</p>

```cs
public RevealByProgress reveal;
```

```cs
reveal.progress = 0.5f;
```

<h2>Render pipeline compatibility</h2>

:white_check_mark: Built-in<br>
:x: URP<br>
:x: HDRP<br>

<h2>Unity Version</h2>

2022.3.30 or higher.
In fact this shader can work on most versions of Unity because it is very simple.

<h2>License</h2>

This software is released under the MIT License.  
You are free to use it within the scope of the license.  
However, the following copyright and license notices are required for use.

https://github.com/AnhPham/Reveal-By-Progress-Shader-For-Unity?tab=MIT-1-ov-file
