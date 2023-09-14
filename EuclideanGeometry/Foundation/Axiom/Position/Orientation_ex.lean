import EuclideanGeometry.Foundation.Axiom.Linear.Ray_ex
import EuclideanGeometry.Foundation.Axiom.Position.Orientation
import EuclideanGeometry.Foundation.Axiom.Position.Angle_ex

/- This file discuss the relative positions of points and rays on a plane. -/
noncomputable section
namespace EuclidGeom

variable {P : Type _} [EuclideanPlane P] 

theorem pts_are_distinct_of_two_rays_of_oangle (oang : OAngle P) (nontriv : oang.is_nd) (A B : P) (ha : A LiesInt oang.start_ray) (hb : B LiesInt oang.end_ray) : A ≠ B := by sorry


/- Position of three (distinct) points.  Giving to colinear (futher classification) -/
-- `see line_ex`

-- If a point does not lie on the line associated to the ray, then it is either on the left or the right of the ray

theorem Ray.left_iff_not_right_of_not_lies_on {a : P} {l : Ray P} (h : ¬ (a LiesOn l)) : (a LiesOnLeft l) ↔ ¬ (a LiesOnRight l) := sorry

theorem Ray.not_lies_on_iff_left_or_right (a : P) (l : Ray P) : (¬ (a LiesOn l)) ↔ (a LiesOnLeft l) ∨ (a LiesOnRight l) := sorry


section midpoint

-- midpoint of a segment

namespace Seg

def midpoint (l : Seg P) : P := (l.target -ᵥ l.source) /2 +ᵥ l.source

-- The midpoint of a segment lies on the segment 

theorem midpt_lies_on (l : Seg P) : l.midpoint LiesOn l := by sorry

theorem midpt_lies_on_int_of_nontriv (l : Seg P) (nontriv : l.is_nd) : l.midpoint LiesInt l := by sorry

-- A point is the mid opint of a segment if and only it defines the same vector to the source and the target of the segment

theorem midpt_iff_same_vector_to_source_and_target (p : P) (l : Seg P) : p = l.midpoint ↔ (SEG l.source p).toVec = (SEG p l.target).toVec := by sorry

-- The midpoint has same distance to the two end points of the segment

theorem same_distance_of_midpt_of_seg (l : Seg P) : (SEG l.source l.midpoint).length = (SEG l.midpoint l.target).length := by sorry

-- A point is the mid-point of a nontrivial segment if and only if it lines on the segment and 

theorem is_midpoint_iff_lieson_and_same_distance_of_nontriv (p : P) (l : Seg P) (nontriv : l.is_nd) : p = l.midpoint ↔ p LiesOn l ∧ (SEG l.source p).length = (SEG p l.target).length := by sorry

end Seg

end midpoint

end EuclidGeom