// uniform mat4 projectionMatrix;
// uniform mat4 viewMatrix;
// uniform mat4 modelMatrix;
uniform vec2 uFrequency;
uniform float uTime;

// attribute vec3 position;
// attribute vec2 uv;

// attribute float aRandom;
// varying float vRandom;

varying vec2 vUv;
varying float vElevation;

void main(){

  vec4 modelPostion = modelMatrix * vec4(position,1.0);

  float elevation = sin(modelPostion.x * uFrequency.x - uTime) * 0.1;
  elevation += sin(modelPostion.y * uFrequency.y - uTime) * 0.1;

  modelPostion.z += elevation;

  modelPostion.z += sin(modelPostion.x * uFrequency.x - uTime) * 0.1;
  modelPostion.z += sin(modelPostion.y * uFrequency.y - uTime) * 0.1;

  vec4 viewPosition = viewMatrix * modelPostion;
  vec4 projectedPosition = projectionMatrix * viewPosition;

  // modelPostion.z += aRandom * 0.1;
  // gl_Position = projectedPosition;
  // vRandom = aRandom;


  // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

  gl_Position = projectedPosition;

  vUv = uv;
  vElevation = elevation;
}