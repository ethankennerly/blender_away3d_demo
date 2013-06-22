package 
{
    import flash.utils.getTimer;

    import away3d.animators.Animator;
    import away3d.core.base.Object3D;
    import away3d.loaders.Collada;
    import away3d.test.SimpleView;

    /**
     * Away3d 3.6 (compatible with Flash 10 that some people still depend on).
     * Triangulate the mesh.
     * Set the material.
     * Parent mesh to the armature.
     * In Pose Mode, in action editor, animate the bone.
     * http://wiki.blender.org/index.php/Doc:2.4/Books/GameKit_2/10.Character_Animation
     * Sequence the animations into one NLA track.
     * http://gamedev.stackexchange.com/questions/43221/blender-multiple-animations-and-collada-export
     * Select bone. Pose. Animation. Bake animation. Step 1.
     * http://wiki.blender.org/index.php/Doc:2.6/Manual/Data_System/Files/Import/COLLADA
     * http://wiki.blender.org/index.php/Dev:2.4/Source/Animation/AnimationBaking
     */
    public class Intermediate_ColladaAnimation extends SimpleView
    {
        [Embed(source=
            "./box.dae",
            // "./box_bake_action.dae",
            // Demo from Blender 2.4 Book:
            // "../../../Users/Ethan/Downloads/GK2-Files/gk2-files/Tutorials/CharacterAnimation/characteranim14.dae",
            mimeType="application/octet-stream")]
        private const boxClass:Class;
        private var box:Object3D;
        private var animator:Animator;

        override protected function create():void
        {
            box = Collada.parse(boxClass, {scaling: 100.0});
            animator = box.animationLibrary.getAnimation("default").animator;
            animator.interpolate = true;
            animator.play();
            view.scene.addChild(box);
            start();
        }

        /*  
        // redundant to play.
        override protected function draw():void
        {
              animator.update(0.001 * getTimer());
        }
        */
    }
}
