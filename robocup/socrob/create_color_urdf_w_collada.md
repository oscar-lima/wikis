create color urdf with collada and blender
==========================================

1. prepare a test_model.urdf file:

<?xml version="1.0"?>
<robot name="mbot">

  <link name="cube_link">
    <visual>
      <geometry>
        <mesh filename="package://name_of_your_valid_ros_package/meshes/name_of_your_collada_robot_model.dae"/>
      </geometry>
      <origin rpy="0 0 0" xyz="0.0 0.0 0.0"/>
    </visual>
    <collision>
      <origin xyz="0.0 0.0 1.0"/>
      <geometry>
        <box size="0.48 0.48 0.4"/>
      </geometry>
    </collision>
    <inertial>
      <mass value="10.0"/>
      <origin xyz="0.0 0.0 0.0"/>
      <inertia ixx="0.001" ixy="0.0" ixz="0.0" iyy="0.001" iyz="0.0" izz="0.001"/> <!-- just a small value for simplicity, TODO: investigate a proper value -->
    </inertial>
  </link>

</robot>

2. make the model in blender (tested on blender 2.76, 64 bit, ubuntu 14.04)

for simplicity we will use the blender default cube that appears every time you open blender

right click on the light and camera and press delete, eliminate both camera and lightning source

from the top right corner of the model view, drag with the mouse to the left os the screen to make two view windows

click on the smal icon at the left of view in the right window (now your window should be splitted in 2 because of the last step)

select U/V image editor

add a material to the mesh (by default the cube has already a material but your mesh probably not)

Add a texture to that material, and select image or movie

click image -> new image, untick alpha, change untitled for a name you want to give to the texture of your model

adjust width and height of your image to a smaller value perhaps if you like to 600 x 600 (optional step)

click on color and modify the default color for the image

generated type can be blank, click ok

select the model go to edit mode, select all faces, go on the left menu click on Shading /UV tab -> click unwrap

you can also (before next step) mark a seam (optional but very useful) just select edges on edit mode and click "Mark seam" on Shading /UV menu at the left

to paint the model expand with the plus symbol on the right window and on the bottom of the right window change from "view" to "paint"

now paint your model on the 2d window by using the brush and the tools pallet

now on the bottom of the right window click on image -> save as image and save in your prefered location

To see the changes reflected on your model, go to object mode and on the small icon at the right of object mode click on texture

3. Export the model to collada format

click file -> export -> collada (default) .dae

on the left side expand operators presets and select the option "SI + open Sim Static"

the go below to texture options and make sure all options are ticked, in particular the "Include Material Textures" option

Once you are ready click on export collada (first give a name and select location)

Now the blender part is over, save the model once more as .blend if you want to keep the source files (maybe in future you want to make modifications)

4. test your model in urdf and rviz

install urdf tutorials ros pkg

        sudo apt-get install ros-indigo-urdf-tutorial
        # (replace indigo with your ros distribution)

from within the same location where you saved the collada file and the image (both files must be in the same location 
and it has to be a proper ros pkg, which means you should be able to do roscd into there) launch the command:

        roslaunch urdf_tutorial display.launch model:=urdf_file_from_step_1.urdf
        
rviz should open automatically, set the fixed frame as "cube_link"

Done! now you should be able to see your cube on rviz in colors

5. fixing ambient light on the mesh

Somehow blender export materials with a null ambient lightning (see http://answers.ros.org/question/198860/rviz-ignores-collada-mesh-colours/)

so manually edit the line on the .dae file:

from:

        <ambient>
        <color sid="ambient">0 0 0 1</color>
        </ambient>

to:

        <ambient>
            <color sid="ambient">0.9 0.9 0.9 1</color>
        </ambient>

Done! Now the light on the model is fixed and looks bright!