import luxe.Input;
import luxe.States;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture;
import phoenix.Texture.FilterType;
import luxe.tilemaps.Ortho;
import luxe.tilemaps.Tilemap;
import luxe.importers.tiled.TiledMap;

class MenuState extends State {

    var enemy : Sprite;
    var enemy_texture : Texture;
    var map1 : TiledMap;

    public function new( _name:String ) {
        super({ name:_name });
    } //new

    override function init() {


    } //init

    override function onenter<T>( _value:T ) {

        var tilemap = Luxe.resources.text('assets/tilemap.tmx');
        map1 = new TiledMap({
            tiled_file_data : tilemap.asset.text,
            format : 'tmx',
            pos : new Vector(0,0)
        }); //map1

        map1.display({
            scale : 1,
            depth : 0,
            grid : false
            // filter : FilterType.nearest
        });

        var test_sprite = new Sprite({
            size : new Vector(64, 64),
            pos : new Vector(64, 64),
            depth : 1
        }); //test_sprite

        if(enemy_texture == null) enemy_texture = Luxe.resources.texture('assets/enemy.png');
        enemy = new Sprite({
            texture : enemy_texture,
            pos : new Vector(128, 128),
            depth : 1
        }); //enemy

    } //onenter

    override function onleave<T>( _value:T ) {


    } //onleave

} //MenuState

class PlayState extends State {

    public function new( _name:String ) {
        super({ name:_name });
    } //new

    override function init() {


    } //init

    override function onenter<T>( _value:T ) {


    } //onenter

    override function onleave<T>( _value:T ) {


    } //onleave

} //PlayState

class Main extends luxe.Game {

    var machine : States;

    override function config(config:luxe.AppConfig) {

        config.preload.textures.push({ id:'assets/enemy.png' });
        config.preload.textures.push({ id:'assets/tiles.png' });
        config.preload.texts.push({ id:'assets/tilemap.tmx' });
        return config;

    } //config

    override function ready() {

        connect_input();
        machine = new States({ name:'statemachine' });
        machine.add(new MenuState('menu_state'));
        machine.add(new PlayState('play_state'));
        machine.set('menu_state');

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

    } //update

    function connect_input() {

        Luxe.input.bind_key('up', Key.up);
        Luxe.input.bind_key('up', Key.key_w);
        Luxe.input.bind_key('right', Key.right);
        Luxe.input.bind_key('right', Key.key_d);
        Luxe.input.bind_key('down', Key.down);
        Luxe.input.bind_key('down', Key.key_s);
        Luxe.input.bind_key('left', Key.left);
        Luxe.input.bind_key('left', Key.key_a);
        Luxe.input.bind_key('attack', Key.space);

    } //connect_input


} //Main
