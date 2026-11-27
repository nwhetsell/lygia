import wgsl_test::{expectNearVec2, expectNearVec4};
import lygia::color::vibrance::{vibrance3, vibrance4};

@test
fn vibranceZeroKeepsColor() {
  let color = vec4f(0.9, 0.55, 0.15, 0.4);
  expectNearVec4(vibrance4(color, 0.0), color);
}

@test
fn vibranceNearZeroChangesChromaInTheRequestedDirection() {
  let color = vec3f(0.9, 0.55, 0.15);
  let lower = vibrance3(color, -0.01);
  let upper = vibrance3(color, 0.01);
  // The input chroma is 0.75. The two adjustments scale it by 0.9825 and 1.0025.
  expectNearVec2(vec2f(lower.r - lower.b, upper.r - upper.b), vec2f(0.736875, 0.751875));
}
