package js.three;

@:native("THREE.Camera")
extern class Camera extends Object3D {
    public function new() : Void;
    public var matrixWorldInverse : Matrix4;
    public var projectionMatrix : Matrix4;
    public function update(parentMatrixWorld:Matrix4, forceUpdate:Bool, camera:Camera) : Void;
    public function lookAt(target:Vector3) : Void;
}

@:native("THREE.PerspectiveCamera")
extern class PerspectiveCamera extends Camera {
    public function new(fov:Float, aspect:Float, near:Float, far:Float) : Void;
    public var fov : Float;
    public var aspect : Float;
    public var near : Float;
    public var far : Float;
    public function updateProjectionMatrix() : Void;
}

extern class OrthographicCamera extends Camera {
    public function new(left:Float, right:Float, top:Float, bottom:Float, near:Float, far:Float) : Void;
    public var left : Float;
    public var right : Float;
    public var top : Float;
    public var bottom : Float;
    public var near : Float;
    public var far : Float;
    public function updateProjectionMatrix():Void;
}

extern class TrackballCamera extends Camera {
    public function new(params:Dynamic) : Void; // (documented in extras/cameras/TrackballCamera.js)
}

extern class Color {
    public function new(hex:Float) : Void;
    public var r : Float;
    public var g : Float;
    public var b : Float;
    public function copy(color:Color) : Void;
    public function setRGB(r:Float, g:Float, b:Float) : Void;
    public function setHSV(h:Float, s:Float, v:Float) : Void;
    public function setHex(hex:Int) : Void;
    public function getHex() : Int;
    public function getContextStyle() : Dynamic; //?
    public function clone() : Color;
}

extern class Edge {
    public var vertices : Array<Vertex>;
    public var vertexIndices : Array<Int>;
    public var faces : Array<Face3>;
    public var faceIndices : Array<Int>;
    public function new(v1:Vertex, v2:Vertex, vi1:Int, vi2:Int) : Void;
}

extern class Face3 {
    public var a : Float;
    public var b : Float;
    public var c : Float;
    public var normal : Vector3;
    public var vertexNormals : Array<Vector3>; // [ <THREE.Vector3>, <THREE.Vector3>, <THREE.Vector3> ];
    public var color : Color;
    public var vertexColors : Array<Color>; // [ :Color, :Color, :Color ];
    public var vertexTangents : Array<Vector3>;
    public var materials : Array<Material>;
    public var centroid : Vector3;
    public function new(a:Float, b:Float, c:Float, normal:Vector3, color:Color, materials:Array<Material>) : Void;
}

extern class Face4 {
    public var a : Float;
    public var b : Float;
    public var c : Float;
    public var d : Float;
    public var vertexNormals : Array<Vector3>; // [ <THREE.Vector3>, <THREE.Vector3>, <THREE.Vector3>, <THREE.Vector3> ];
    public var color : Color;
    public var vertexColors : Array<Color>; // [ :Color, :Color, :Color, :Color ];
    public var vertexTangents : Array<Vector3>;
    public var materials : Array<Material>;
    public var centroid : Vector3;
    public function new(a:Float, b:Float, c:Float, d:Float, normal:Vector3, color:Color, materials:Array<Material>) : Void;
}

extern class Geometry {
    public var id : String;
    public var vertices : Array<Vertex>;
    public var colors : Array<Color>;
    public var faces : Array<Face4>;
    public var faceUvs : Array<Array<UV>>;
    public var faceVertexUvs : Array<Array<UV>>;
    public var morphTargets : Array<{name:String, vertices:Array<Vertex>}>;
    public var skinWeights : Array<Vector4>;
    public var skinIndices : Array<Vector4>;
    public var boundingBox : { x:Array<Float>, y:Array<Float>, z:Array<Float> };
    public var boundingSphere : { radius:Float };
    public var hasTangents : Bool;
    public function new() : Void;
    public function computeCentroids() : Void;
    public function computeFaceNormals(userVertexNormals:Bool) : Void;
    public function computeVertexNormals() : Void;
    public function computeTangents() : Void;
    public function computeBoundingBox() : Void;
    public function computeBoundingSphere() : Void;
}

extern class Matrix3 {
    public var m : Array<Float>;
    public function new() : Void;
    public function transpose() : Matrix3;
    public function transposeIntoArray(dest:Array<Float>) : Matrix3;
}

extern class Matrix4 {
    public var n11 : Float;
    public var n12 : Float;
    public var n13 : Float;
    public var n14 : Float;
    public var n21 : Float;
    public var n22 : Float;
    public var n23 : Float;
    public var n24 : Float;
    public var n31 : Float;
    public var n32 : Float;
    public var n33 : Float;
    public var n34 : Float;
    public var n41 : Float;
    public var n42 : Float;
    public var n43 : Float;
    public var n44 : Float;
    public var flat : Array<Float>;
    public var m33 : Matrix3;
    public function new(n11:Float, n12:Float, n13:Float, n14:Float, n21:Float, n22:Float, n23:Float, n24:Float, n31:Float, n32:Float, n33:Float, n34:Float, n41:Float, n42:Float, n43:Float, n44:Float) : Void;
    public function set(n11:Float, n12:Float, n13:Float, n14:Float, n21:Float, n22:Float, n23:Float, n24:Float, n31:Float, n32:Float, n33:Float, n34:Float, n41:Float, n42:Float, n43:Float, n44:Float) : Matrix4;
    public function identity() : Matrix4;
    public function copy(m:Matrix4) : Matrix4;
    public function lookAt(eye:Vector3, center:Vector3, up:Vector3) : Matrix4;
    public function multiplyVector3(v:Vector3) : Vector3;
    public function multiplyVector4(v:Vector4) : Vector4;
    public function rotateAxis(v:Vector3) : Vector3;
    public function crossVector(a:Vector4) : Vector4;
    public function multiply(a:Matrix4, b:Matrix4) : Matrix4;
    public function multiplyToArray(a:Matrix4, b:Matrix4, r:Array<Float>) : Matrix4;
    public function multiplySelf(m:Matrix4) : Matrix4;
    public function multiplyScalar(s:Float) : Matrix4;
    public function determinant() : Float;
    public function transpose() : Matrix4;
    public function clone() : Matrix4;
    public function flatten() : Array<Float>;
    public function flattenToArray(flat:Array<Float>) : Array<Float>;
    public function flattenToArrayOffset(flat:Array<Float>, offset:Float) : Array<Float>;
    public function setTranslation(x:Float, y:Float, z:Float) : Matrix4;
    public function setScale(x:Float, y:Float, z:Float) : Matrix4;
    public function setRotationX(theta:Float) : Matrix4;
    public function setRotationY(theta:Float) : Matrix4;
    public function setRotationZ(theta:Float) : Matrix4;
    public function setRotationAxis(axis:Vector3, angle:Float) : Matrix4;
    public function setPosition(v:Vector3) : Matrix4;
    public function setRotationFromEuler(v:Vector3) : Matrix4;
    public function setRotationFromQuaternion(v:Quaternion) : Matrix4;
    public function scale(v:Vector3) : Matrix4;
    public function extractPosition(m:Matrix4) : Matrix4;
    public function extractRotation(m:Matrix4, s:Float) : Matrix4;
    //public static function makeInvert(m1:Matrix4, m2:Matrix4);
    public static function makeInvert3x3(m1:Matrix4) : Matrix3;
    public static function makeFrustum(left:Float, right:Float, bottom:Float, top:Float, near:Float, far:Float) : Matrix4;
    public static function makePerspective(fov:Float, aspect:Float, near:Float, far:Float) : Matrix4;
    public static function makeOrtho(left:Float, right:Float, bottom:Float, top:Float, near:Float, far:Float) : Matrix4;
}

extern class Object3D {
    public var name : String;
    public var id : Float;
    public var parent : Object3D;
    public var children : Object3D;
    public var up : Vector3;
    public var position : Vector3;
    public var rotation : Vector3;
    public var eulerOrder : String;
    public var scale : Vector3;
    //TODO: public var dynamic : Bool;
    public var doubleSided : Bool;
    public var flipSided : Bool;
    public var renderDepth : Float;
    public var matrix : Matrix4;
    public var matrixWorld : Matrix4;
    public var matrixRotationWorld : Matrix4;
    public var matrixAutoUpdate : Bool;
    public var matrixWorldNeedsUpdate : Bool;
    public var quaternion : Quaternion;
    public var useQuaternion : Bool;
    public var boundRadius : Float;
    public var boundRadiusScale : Float;
    public var visible : Bool;
    public function add(o:Object3D) : Void;
    public function remove(o:Object3D) : Void;
    public function updateMatrix() : Void;
}

extern class Quaternion {
    public var x : Float;
    public var y : Float;
    public var z : Float;
    public var w : Float;
    public function set(x:Float, y:Float, z:Float, w:Float) : Quaternion;
    public function setFromEuler(v:Vector3) : Quaternion;
    public function calculateW() : Quaternion;
    public function inverse() : Quaternion;
    public function length() : Float;
    public function normalize() : Quaternion;
    public function multiplySelf(q:Quaternion) : Quaternion;
    public function multiplyVector3(vec:Vector3, dest:Vector3) : Vector3;
    public static function slerp(qa:Quaternion, qb:Quaternion, qm:Quaternion, t:Float) : Quaternion;
}

extern class Ray {
    public var origin : Vector3;
    public var direction : Vector3;
    public function intersectScene(scene:Scene) : Array<Object3D>;
    public function intersectObjects(objects:Array<Object3D>) : Array<Object3D>;
    public function intersectObject(object:Object3D) : Array<Object3D>;
}

extern class Rectangle {
    public function resize() : Void;
    public function getX() : Float;
    public function getY() : Float;
    public function getWidth() : Float;
    public function getHeight() : Float;
    public function getLeft() : Float;
    public function getTop() : Float;
    public function getRight() : Float;
    public function getBottom() : Float;
    public function set(left:Float, top:Float, right:Float, bottom:Float) : Void;
    public function addPoint() : Void;
    public function add3Points() : Void;
    public function addRectangle(r:Rectangle) : Void;
    public function inflate(v:Float) : Void;
    public function minSelf(r:Rectangle) : Void;
    public function intersects(r:Rectangle) : Bool;
    public function empty() : Void;
    public function isEmpty() : Bool;
}

extern class UV {
    public var u : Float;
    public var v : Float;
    public function set(u:Float, v:Float) : UV;
    public function copy(uv:UV) : UV;
    public function clone() : UV;
}

extern class Vector2 {
    public var x : Float;
    public var y : Float;
    public function new(x:Float, y:Float) : Void;
    public function set(x:Float, y:Float) : Vector2;
    public function copy(v:Vector2) : Vector2;
    public function addSelf(v:Vector2) : Vector2;
    public function add(v1:Vector2, v2:Vector2) : Vector2;
    public function subSelf(v:Vector2) : Vector2;
    public function sub(v1:Vector2, v2:Vector2) : Vector2;
    public function multiplyScalar(s:Float) : Vector2;
    public function divideScalar(s:Float) : Vector2;
    public function negate() : Vector2;
    public function dot(v:Vector2) : Float;
    public function lengthSq() : Float;
    public function length() : Float;
    public function distanceTo(v:Vector2) : Float;
    public function distanceToSquared(v:Vector2) : Float;
    public function setLength(l:Float) : Float;
    public function equals(v:Vector2) : Bool;
    public function clone() : Vector2;
    public function normalize() : Vector2;
}

extern class Vector3 {
    public var x : Float;
    public var y : Float;
    public var z : Float;
    public function new(x:Float, y:Float, z:Float) : Void;
    public function set(x:Float, y:Float, z:Float) : Vector3;
    public function setX(x:Float) : Vector3;
    public function setY(y:Float) : Vector3;
    public function setZ(z:Float) : Vector3;
    public function copy(v:Vector3) : Vector3;
    public function clone() : Vector3;
    public function add(v1:Vector3, v2:Vector3) : Vector3;
    public function addSelf(v:Vector3) : Vector3;
    public function addScalar(s:Float) : Vector3;
    public function sub(v1:Vector3, v2:Vector3) : Vector3;
    public function subSelf(v:Vector3) : Vector3;
    public function multiply(a:Vector3, b:Vector3) : Vector3;
    public function multiplySelf(v:Vector3) : Vector3;
    public function multiplyScalar(s:Float) : Vector3;
    public function divideSelf(v:Vector3) : Vector3;
    public function divideScalar(s:Float) : Vector3;
    public function negate() : Vector3;
    public function dot(v:Vector3) : Float;
    public function lengthSq() : Float;
    public function length() : Float;
    public function lengthManhattan() : Float;
    public function normalize() : Vector3;
    public function setLength(l:Float) : Vector3;
    public function cross(a:Vector3, b:Vector3) : Vector3;
    public function crossSelf(v:Vector3) : Vector3;
    public function distanceTo(v:Vector3) : Float;
    public function distanceToSquared(v:Vector3) : Float;
    public function setPositionFromMatrix(m:Matrix4) : Void;
    public function setRotationFromMatrix(m:Matrix4) : Void;
    public function isZero() : Bool;
}

extern class Vector4 {
    public var x : Float;
    public var y : Float;
    public var z : Float;
    public var w : Float;
    public function new(x:Float, y:Float, z:Float, w:Float) : Void;
    public function set(x:Float, y:Float, z:Float, w:Float) : Void;
    public function copy(v:Vector4) : Vector4;
    public function clone() : Vector4;
    public function add(v1:Vector4, v2:Vector4) : Vector4;
    public function addSelf(v:Vector4) : Vector4;
    public function sub(v1:Vector4, v2:Vector4) : Vector4;
    public function subSelf(v:Vector4) : Vector4;
    public function multiplyScalar(s:Float) : Vector4;
    public function divideScalar(s:Float) : Vector4;
    public function negate() : Vector4;
    public function dot(v:Vector4) : Float;
    public function lengthSq() : Float;
    public function length() : Float;
    public function normalize() : Vector4;
    public function setLength(s:Float) : Vector4;
    public function lerpSelf(v:Vector4, alpha:Float) : Vector4;
}

extern class Vertex {
    public var position : Vector3;
    public function new(p:Vector3) : Void;
}

extern class Light extends Object3D {
    public var color : Color;
    public function new(hex:Int) : Void;
}

extern class AmbientLight extends Light {
}

extern class DirectionalLight extends Light {
    public var intensity : Float;
    public var distance : Float;
    public function new(hex:Int, intensity:Float, distance:Float) : Void;
}

extern class PointLight extends Light {
    public var intensity : Float;
    public var distance : Float;
    public function new(hex:Int, intensity:Float, distance:Float) : Void;
}

extern class Material {
    public var name : String;
    public var id : Int;
    public var opacity : Float;
    public var transparent : Float;
    public var blending : Int;
    public var depthTest : Bool;
    public var depthWrite : Bool;
    public var polygonOffset : Bool;
    public var polygonOffsetFactor : Float;
    public var polygonOffsetUnits : Float;
    public var alphaTest : Float;
    public var overdraw : Bool; // Boolean for fixing antialiasing gaps in CanvasRenderer
    public function new(parameters:Dynamic) : Void;
}

/*
THREE.NoShading = 0;
THREE.FlatShading = 1;
THREE.SmoothShading = 2;

THREE.NoColors = 0;
THREE.FaceColors = 1;
THREE.VertexColors = 2;

THREE.NormalBlending = 0;
THREE.AdditiveBlending = 1;
THREE.SubtractiveBlending = 2;
THREE.MultiplyBlending = 3;
THREE.AdditiveAlphaBlending = 4;
*/

extern class LineBasicMaterial extends Material {
    public var color : Color;
    public var linewidth : Float;
    public var linecap : String; /* 'round', … */
    public var linejoin : String; /* 'round', … */
    public var vertexColors : Bool;
    public var fog : Bool;
    /**
     * @author mr.doob / http://mrdoob.com/
     * @author alteredq / http://alteredqualia.com/
     *
     * parameters = {
     *  color: <hex>,
     *  opacity: <float>,
     *
     *  blending: THREE.NormalBlending,
     *  depthTest: <bool>,
     *
     *  linewidth: <float>,
     *  linecap: "round",
     *  linejoin: "round",
     *
     *  vertexColors: <bool>
     *
     *  fog: <bool>
     * }
     */
    public function new(parameters:Dynamic) : Void;
}

extern class MeshBasicMaterial extends Material {
    public var color : Color;
    public var map : Texture;
    public var lightMap : Texture;
    public var envMap : Texture; // TextureCube?
    public var combine : Int; // THREE.Multiply
    public var reflectivity : Float;
    public var refractionRatio : Float;
    public var fog : Bool;
    public var shading : Int; // THREE.SmoothShading
    public var wireframe : Bool;
    public var wireframeLinewidth : Float;
    public var wireframeLinecap : String;
    public var wireframeLinejoin : String;
    public var vertexColors : Bool; // false, THREE.VertexColors, THREE.FaceColors
    public var skinning : Bool;
    /**
     * @author mr.doob / http://mrdoob.com/
     * @author alteredq / http://alteredqualia.com/
     *
     * parameters = {
     *  color: <hex>,
     *  opacity: <float>,
     *  map: new THREE.Texture( <Image> ),
     *
     *  lightMap: new THREE.Texture( <Image> ),
     *
     *  envMap: new THREE.TextureCube( [posx, negx, posy, negy, posz, negz] ),
     *  combine: THREE.Multiply,
     *  reflectivity: <float>,
     *  refractionRatio: <float>,
     *
     *  shading: THREE.SmoothShading,
     *  blending: THREE.NormalBlending,
     *  depthTest: <bool>,
     *
     *  wireframe: <boolean>,
     *  wireframeLinewidth: <float>,
     *
     *  vertexColors: false / THREE.VertexColors / THREE.FaceColors,
     *  skinning: <bool>,
     *
     *      fog: <bool>
     * }
     */
    public function new(parameters:Dynamic) : Void;
}

extern class MeshDepthMaterial extends Material {
    public var shading : Int;
    public var wireframe : Bool;
    public var wireframeLinewidth : Float;
}

@:native("THREE.MeshFaceMaterial")
extern class MeshFaceMaterial extends Material {
    public function new() : Void;
}

@:native("THREE.MeshLambertMaterial")
extern class MeshLambertMaterial extends Material {
    public var color : Color;
    public var map : Texture;
    public var lightMap : Texture;
    public var envMap : Texture; // TextureCube?
    public var combine : Int; // THREE.Multiply
    public var reflectivity : Float;
    public var refractionRatio : Float;
    public var fog : Bool;
    public var shading : Int;
    public var wireframe : Bool;
    public var wireframeLinewidth : Float;
    public var wireframeLinecap : String; // 'round'
    public var wireframeLinejoin : String; // 'round'
    public var vertexColors : Bool;
    public var skinning : Bool;
    public var morphTargets : Array<{name:String, vertices:Array<Vertex>}>;
    /**
     * @author mr.doob / http://mrdoob.com/
     * @author alteredq / http://alteredqualia.com/
     *
     * parameters = {
     *  color: <hex>,
     *  ambient: <hex>,
     *  opacity: <float>,
     *
     *  map: new THREE.Texture( <Image> ),
     *
     *  lightMap: new THREE.Texture( <Image> ),
     *
     *  envMap: new THREE.TextureCube( [posx, negx, posy, negy, posz, negz] ),
     *  combine: THREE.Multiply,
     *  reflectivity: <float>,
     *  refractionRatio: <float>,
     *
     *  shading: THREE.SmoothShading,
     *  blending: THREE.NormalBlending,
     *  depthTest: <bool>,
     *
     *  wireframe: <boolean>,
     *  wireframeLinewidth: <float>,
     *
     *  vertexColors: false / THREE.VertexColors / THREE.FaceColors,
     *  skinning: <bool>,
     *
     *      fog: <bool>
     * }
     */
    public function new(parameters:Dynamic) : Void;
}

extern class MeshNormalMaterial extends Material {
    public var shading : Int;
    public var wireframe : Bool;
    public var wireframeLinewidth : Float;
    /**
     * @author mr.doob / http://mrdoob.com/
     *
     * parameters = {
     *  opacity: <float>,

     *  shading: THREE.FlatShading,
     *  blending: THREE.NormalBlending,
     *  depthTest: <bool>,

     *  wireframe: <boolean>,
     *  wireframeLinewidth: <float>
     * }
     */
    public function new(parameters:Dynamic) : Void;
}

extern class MeshPhongMaterial extends Material {
    public var color : Color;
    public var ambient : Color;
    public var specular : Color;
    public var shininess : Float;
    public var map : Texture;
    public var lightMap : Texture;
    public var envMap : Texture; // TextureCube?
    public var combine : Int; // THREE.Multiply
    public var reflectivity : Float;
    public var refractionRatio : Float;
    public var fog : Bool;
    public var shading : Int;
    public var skinning : Bool;
    /**
     * @author mr.doob / http://mrdoob.com/
     * @author alteredq / http://alteredqualia.com/
     *
     * parameters = {
     *  color: <hex>,
     *  ambient: <hex>,
     *  specular: <hex>,
     *  shininess: <float>,
     *  opacity: <float>,
     *
     *  map: new THREE.Texture( <Image> ),
     *
     *  lightMap: new THREE.Texture( <Image> ),
     *
     *  envMap: new THREE.TextureCube( [posx, negx, posy, negy, posz, negz] ),
     *  combine: THREE.Multiply,
     *  reflectivity: <float>,
     *  refractionRatio: <float>,
     *
     *  shading: THREE.SmoothShading,
     *  blending: THREE.NormalBlending,
     *  depthTest: <bool>,
     *
     *  wireframe: <boolean>,
     *  wireframeLinewidth: <float>,
     *
     *  vertexColors: false / THREE.VertexColors / THREE.FaceColors,
     *  skinning: <bool>,
     *
     *      fog: <bool>
     * }
     */
    public function new(parameters:Dynamic) : Void;
}

extern class ShaderMaterial extends Material {
    public var fragmentShader : String;
    public var vertexShader : String;
    public var uniforms : Dynamic;
    public var shading : Int;
    public var wireframe : Bool;
    public var wireframeLinewidth : Float;
    public var wireframeLinecap : String;
    public var wireframeLinejoin : String;
    public var vertexColors : Bool;
    public var skinning : Bool;
    public var morphTargets : Bool;
    public var fog : Bool;
    public var lights : Bool;
    /**
     * @author alteredq / http://alteredqualia.com/
     *
     * parameters = {
     *  fragmentShader: <string>,
     *  vertexShader: <string>,

     *  uniforms: { "parameter1": { type: "f", value: 1.0 }, "parameter2": { type: "i" value2: 2 } },

     *  shading: THREE.SmoothShading,
     *  blending: THREE.NormalBlending,
     *  depthTest: <bool>,

     *  wireframe: <boolean>,
     *  wireframeLinewidth: <float>,

     *  lights: <bool>,
     *  vertexColors: <bool>,
     *  skinning: <bool>,
     *  morphTargets: <bool>,
     * }
     */
    public function new(parameters:Dynamic) : Void;
}

extern class ParticleBasicMaterial extends Material {
    public var color : Color;
    public var map : Texture;
    public var size : Float;
    public var sizeAttenuation : Bool;
    public var vertexColors : Bool;
    public var fog : Bool;
    public function new(parameters:Dynamic) : Void;
}

extern class ParticleCanvasMaterial extends Material {
    public var color : Color;
    public var program : Dynamic->Color->Void;
    /**
     * @author mr.doob / http://mrdoob.com/
     *
     * parameters = {
     *  color: <hex>,
     *  program: <function>,
     *  opacity: <float>,
     *  blending: THREE.NormalBlending
     * }
     */
    public function new(parameters:Dynamic) : Void;
}

extern class ParticleDOMMaterial extends Material {
    public var domElement : js.Dom.HtmlDom;
    public function new(el:js.Dom.HtmlDom) : Void;
}

interface Mapping {}
extern class CubeReflectionMapping implements Mapping {}
extern class CubeRefractionMapping implements Mapping  {}
extern class LatitudeReflectionMapping implements Mapping  {}
extern class LatitudeRefractionMapping implements Mapping  {}
extern class SphericalReflectionMapping implements Mapping  {}
extern class SphericalRefractionMapping implements Mapping  {}
extern class UVMapping implements Mapping  {}

extern class UniformsUtils {
    public static function merge(a:Array<UniformsUtils>) : Dynamic ;
    public static function clone(a:Dynamic) : Dynamic;
}

extern class Texture {
    public var image : js.Dom.Image;
    public var mapping : Mapping;
    public var wrapS : Int; // Wrapping
    public var wrapT : Int; // Wrapping
    public var magFilter : Int; // Filter
    public var minFilter : Int; // Filter
    public var needsUpdate : Bool;
    public var offset : Vector2;
    public var repeat : Vector2;
    public function new(image:js.Dom.Image, mapping:Mapping, wrapS:Int, wrapT:Int, magFilter:Int, minFilter:Int) : Void;
    public function clone() : Texture;
}

extern class ImageUtils {
    public static function loadTexture(path:String, mapping:Int, cb:js.Dom.Image->Void) : Texture;
    public static function loadTextureCube(array:Array<String>, mapping:Int, cb:js.Dom.Image->Void) : Texture;
}

extern class MultiplyOperation {} // = 0
extern class MixOperation {} // = 1

extern class RepeatWrapping {} // = 0
extern class ClampToEdgeWrapping {} // = 1
extern class MirroredRepeatWrapping {} // = 2

extern class NearestFilter {} // = 3
extern class NearestMipMapNearestFilter {} // = 4
extern class NearestMipMapLineaFilter {} // = 5
extern class LinearFilter {} // = 6
extern class LinearMipMapNearestFilter {} // = 7
extern class LinearMipMapLinearFilter {} // = 8

extern class ByteType {} // 9
extern class UnsignedByteType {} // 10
extern class ShortType {} // 11
extern class UnsignedShortType {} // 12
extern class IntType {} // 13
extern class UnsignedIntType {} // 14
extern class FloatType {} // 15

extern class AlphaFormat {} // 16
extern class RGBFormat {} // 17
extern class RGBAFormat {} // 18
extern class LuminanceFormat {} // 19
extern class LuminanceAlphaFormat {} // 20

extern class Bone extends Object3D {
    public var skin : Bool;
    public var skinMatrix : Matrix4;
    public function new(belongToSkin:Bool) : Void;
    public function update(parentSkinMatrix:Matrix4, forceUpdate:Bool) : Void;
}

extern class Line extends Object3D {
    public var geometry : Geometry;
    public var materials : Material;
    public var type : Int;
    public function new(geometry:Geometry, material:Material, type:Int) : Void;
}
extern class LineStrip {} // 0
extern class Pieces {} // 1

extern class LOD extends Object3D {
    public var LODs : Array<{ visibleAtDistance:Float, object3D:Object3D }>;
    public function addLevel(o:Object3D, visibleAtDistance:Float=0.0) : Void;
    public function update(camera:Camera) : Void;
}

@:native("THREE.Mesh")
extern class Mesh extends Object3D {
    public var geometry : Geometry;
    public var material : Material;
    public function new(geometry:Geometry, material:Material) : Void;
    public function getMorphTargetIndexByName(name:String) : Int;
}

extern class MorphAnimMesh extends Mesh {
    public var duration : Float; // millis
    public var mirroredLoop : Bool;
    public var time : Float;
    public function updateAnimation(delta:Float) : Void;
}

extern class Particle extends Object3D {
    public var material : Material;
    public function new(material:Material) : Void;
}

extern class ParticleSystem extends Object3D {
    public var geometry : Geometry;
    public var material : Material;
    public var sortParticles : Bool;
    public function new(geometry:Geometry, material:Material) : Void;
}

extern class Ribbon extends Object3D {
    public var geometry : Geometry;
    public var material : Material;
    public function new(geometry:Geometry, material:Material) : Void;
}

extern class SkinnedMesh extends Mesh {
    public var identityMatrix : Matrix4;
    public var bones : Array<Bone>;
    //public var bonesMatrices : Float32Array;
    public function addBone(bone:Bone) : Bone;
    public function pose() : Void;
    public function updateMatrixWorld(force:Bool) : Void;
}

@:native("THREE.Scene")
extern class Scene extends Object3D {
    public var objects : Array<Object3D>;
    public var lights : Array<Light>;
    public var fog : Fog;
    public function new() : Void;
    public function addObject(o:Object3D) : Void;
    public function removeObject(o:Object3D) : Void;
}

extern class Fog {
    public var color : Color;
    public var near : Float;
    public var far : Float;
    public function new(hex:Int, near:Float, far:Float) : Void;
}

extern class FogExp2 {
    public var color : Color;
    public var density : Float;
    public function new(hex:Int, density:Float) : Void;
}

extern class Projector {
    public function new() : Void;
    public function computeFrustum(m:Matrix4) : Void;
    public function projectVector(vector:Vector3, camera:Camera) : Void;
    public function unprojectVector(vector:Vector3, camera:Camera) : Vector3;
    public function pickingRay(vector:Vector3, camera:Camera) : Ray;
    public function projectGraph(root:Object3D, sort:Bool) : Dynamic; // returns _renderData
    public function projectScene(scene:Scene, camera:Camera, sort:Bool) : Dynamic; // returns _renderData
    public function isInFrustum(o:Object3D) : Bool;
}

extern class CanvasRenderer {
    public var domElement : js.Dom.HtmlDom;
    public var autoClear : Bool;
    public var sortObjects : Bool;
    public var sortElements : Bool;
    public function new(params:Dynamic) : Void;
    public function setSize(width:Int, height:Int) : Void;
    public function setClearColor(color:Color, opacity:Float) : Void;
    public function setClearColorHex(hex:Int, opacity:Float) : Void;
    public function clear() : Void;
    public function render(scene:Scene, camera:Camera) : Void;
}

extern class DOMRenderer {
    public var domElement : js.Dom.HtmlDom;
    public function new() : Void;
    public function setSize(width:Int, height:Int) : Void;
    public function render(scene:Scene, camera:Camera) : Void;
}

extern class SVGRenderer {
    public var domElement : js.Dom.HtmlDom;
    public var autoClear : Bool;
    public var sortObjects : Bool;
    public var sortElements : Bool;
    public function new() : Void;
    public function setQuality(q:String) : Void; // high / low
    public function setSize(width:Int, height:Int) : Void;
    public function clear() : Void;
    public function render(scene:Scene, camera:Camera) : Void;
}

extern class WebGLContext {}

@:native("THREE.WebGLRenderer")
extern class WebGLRenderer {
    public var domElement : js.Dom.HtmlDom;
    public var autoClear : Bool;
    public var autoClearColor : Bool;
    public var autoClearDepth : Bool;
    public var autoClearStencil : Bool;
    public var sortObjects : Bool;
    public var context : WebGLContext;
    public function new(parameters:Dynamic) : Void;
    public function clear(color:Bool, depth:Bool, stencil:Bool) : Void;
    public function render(scene:Scene, camera:Camera, renderTarget:WebGLRenderTarget, forceClear:Bool) : Void;
    public function setSize(width:Float, height:Float) : Void;
    public function setScissor(x:Float, y:Float, width:Float, height:Float) : Void;
    public function setViewport(x:Float, y:Float, width:Float, height:Float) : Void;
    public function setClearColorHex(hexColor:Float, opacity:Float) : Void;
    public function setClearColor(color:Color, opacity:Float) : Void;
    public function setFaceCulling(cullFace:String /*[ "front" / "back" ]*/, frontFace:String /*[ "cw" / "ccw" ]*/ ) : Void;
    public function initMaterial(material:Material, lights:Array<Light>, fog:Fog) : Void;
    public function initWebGLObjects(scene:Scene) : Void;
    public function enableScissorTest(enable:Bool) : Void;
    public function enableDepthBufferWrite(enable:Bool) : Void;
    public function supportsVertexTextures() : Void;
    public function deallocateObject(object:Object3D) : Void;
    public function deallocateTexture(texture:Texture) : Void;
}

extern class WebGLRenderTarget {
    public var width : Int;
    public var height : Int;
    public var wrapS : Int; // Wrapping;
    public var wrapT : Int; // Wrapping;
    public var magFilter : Int; // Filter;
    public var minFilter : Int; // Filter;
    public var offset : Vector2;
    public var repeat : Vector2;
    public var format : Int; // RGBAFormat
    public var type : Int; // UnsignedByteType
    public var depthBuffer : Bool;
    public var stencilBuffer : Bool;
    public function new(width:Float, height:Float, options:Dynamic) : Void;
    public function clone() : WebGLRenderTarget;
}

extern class Animation {
    public function new(root:Mesh, data:String, interpolationType:Int /* AnimationHandler statics vars */, jitCompile:Bool) : Void;
    public function play(loop:Bool, startTimeMS:Float) : Void;
    public function pause() : Void;
    public function stop() : Void;
    public function update(deltaTimeMS: Float) : Void;
}

extern class AnimationHandler {
    public static var LINEAR = 0;
    public static var CATMULLROM = 1;
    public static var CATMULLROM_FORWARD = 2;

    public static function update(deltaTimeMS:Float) : Void;
    public static function addToUpdate(animation:Animation) : Void;
    public static function removeFromUpdate(animation:Animation) : Void;
    public static function add(data:Dynamic) : Void; // data = { name:String, initialized:Bool, hierarchy:Array<Bone>, length:Float, fps:Float }
    public static function get(name:String) : Dynamic; // data
    public static function parse(root:Mesh) : Dynamic; // hierarchie = Array<Bone> ?
}

/*
  extern class AnimationMorphTarget {
    var root ;
    var data ;
    var hierarchy ;
    var currentTime : Float;
    var timeScale : Float;
    var isPlaying : Bool;
    var isPaused : Bool;
    var loop : Bool;
    var influence : Float;
    public function new(root, data) : Void;
    public function play(loop:Bool, startTimeMS:Float) : Void;
    public function pause() : Void;
    public function stop() : Void;
    public function update(deltaTimeMS:Float) : Void;
}
*/

@:native("THREE.CubeGeometry")
extern class CubeGeometry extends Geometry {
    @:overload(function(width: Float, height: Float, depth: Float, segmentsWidth: Float, segmentsHeight: Float, segmentsDepth: Float, material: Material, sides: Dynamic):Void {})
    public function new(width: Float, height: Float, depth: Float, segmentsWidth: Float, segmentsHeight: Float, segmentsDepth: Float, materials: Array<Material>, sides: Dynamic) : Void;
}

extern class CylinderGeometry extends Geometry {
    public function new(radiusTop: Float, radiusBottom: Float, height: Float, segmentsRadius: Float, segmentsHeight: Float, openEnded: Bool) : Void;
}

extern class CurvePath {
    // TODO
}

extern class Path extends CurvePath {
    public function new(points:Array<Vector2>) : Void;
    public function moveTo(x:Float, y:Float) : Void;
    public function lineTo(x:Float, y:Float) : Void;
    public function quadraticCurveTo(aCPx:Float, aCPy:Float, aX:Float, aY:Float) : Void;
    public function bezierCurveTo(aCP1x:Float, aCP1y:Float, aCP2x:Float, aCP2y:Float, aX:Float, aY:Float) : Void;
    public function splineThru(pts:Array<Vector2>) : Void;
    public function arc(aX:Float, aY:Float, aRadius:Float, aStartAngle:Float, aEndAngle:Float, aClockWise:Bool) : Void;
    public function getSpacedPoints(divisions:Int, closedPath:Bool) : Void;
    public function getPoints(divisions:Int, closedPath:Bool) : Void;
    public function toShapes() : Array<Shape>;
}

extern class Shape extends Path {
    public function new() : Void;
    public function extrude() : ExtrudeGeometry;
}

extern class ExtrudeGeometry extends Geometry {
    public function new(shapes:Array<Shape>, options:Dynamic) : Void;
}

extern class IcosahedronGeometry extends Geometry {
    public function new(subdivisions: Float) : Void;
}

extern class LatheGeometry extends Geometry {
    public function new(points: Array<Vector3>, steps: Float, angle: Float) : Void;
}

extern class OctahedronGeometry extends Geometry {
    public function new(radius: Float, detail: Float) : Void;
}

extern class PlaneGeometry extends Geometry {
    public function new(width:Float, height: Float, segmentsWidth: Float, segmentsHeight: Float) : Void;
}

extern class SphereGeometry extends Geometry {
    public function new(radius:Float, segmentsWidth:Float, segmentsHeight:Float) : Void;
}

extern class TextGeometry extends Geometry {
    public function new(text:String, parameters:Dynamic) : Void;
}

extern class TorusGeometry extends Geometry {
    public function new(radius: Float, tube: Float, segmentsR: Float, segmentsT: Float, arc: Float) : Void;
}

extern class TorusKnotGeometry extends Geometry {
    public function new(radius: Float, tube: Float, segmentsR: Float, segmentsT: Float, p: Float, q: Float, heightScale: Float) : Void;
}