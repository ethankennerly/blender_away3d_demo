package 
{
    import away3d.core.base.Object3D;
    import away3d.loaders.Collada;
    import away3d.test.SimpleView;

    /**
     * Away3d 3.6 (compatible with Flash 10 that some people still depend on).
     */
    public class Intermediate_ColladaAnimation extends SimpleView
    {
        [Embed(source="./box.dae", mimeType="application/octet-stream")]
        private const boxClass:Class;
        private var box:Object3D;

        override protected function create():void
        {
            box = Collada.parse(boxClass, {scaling:100.0});
            //+ box.animationLibrary.getAnimation("default").animator.play();
            view.scene.addChild(box);
            start();
        }
    }
}
