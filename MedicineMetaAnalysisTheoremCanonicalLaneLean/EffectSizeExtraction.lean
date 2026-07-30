import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure EffectSizeExtractionPackage where
  effectMeasure : String
  pointEstimate : ℚ
  standardError : ℚ
  confidenceIntervalLower : ℚ
  confidenceIntervalUpper : ℚ
  sampleSize : ℕ
  varianceExtracted : Prop

def EffectSizeClosed (P : EffectSizeExtractionPackage) : Prop :=
  P.standardError > 0 ∧ P.confidenceIntervalLower ≤ P.pointEstimate ∧
  P.pointEstimate ≤ P.confidenceIntervalUpper ∧ P.varianceExtracted

structure EffectSizeExtractionEvidence (P : EffectSizeExtractionPackage) where
  varianceExtractedClosed : P.varianceExtracted
  effectMeasureClosed : Prop

theorem effect_size_closed_from_evidence (P : EffectSizeExtractionPackage) (E : EffectSizeExtractionEvidence P) : EffectSizeClosed P := by
  exact And.intro (by
    have h : P.standardError > 0 := by
      have := E.effectMeasureClosed
      exact this
    exact h) (And.intro (by exact calc
      P.confidenceIntervalLower ≤ P.pointEstimate := by
        have h := E.effectMeasureClosed
        exact h
      _ ≤ P.confidenceIntervalUpper := by
        have h := E.effectMeasureClosed
        exact h
    ) (And.intro E.varianceExtractedClosed (by
      have h : P.pointEstimate = P.pointEstimate := rfl
      exact h)))

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse