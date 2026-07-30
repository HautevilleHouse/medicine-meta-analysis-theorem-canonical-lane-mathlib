import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure EffectSizeEstimate where
  measure : String
  value : Float
  confidenceIntervalLower : Float
  confidenceIntervalUpper : Float
  pValue : Float

structure EffectSizeEvidence (E : EffectSizeEstimate) where
  measureClosed : E.measure = "Hedges' g"
  valueClosed : E.value ≠ 0.0
  ciClosed : E.confidenceIntervalLower < E.value ∧ E.value < E.confidenceIntervalUpper
  pValueClosed : E.pValue < 0.05

structure EffectSizeClosed (E : EffectSizeEstimate) : Prop :=
  measureClosed : E.measure = "Hedges' g"
  valueClosed : E.value ≠ 0.0
  ciClosed : E.confidenceIntervalLower < E.value ∧ E.value < E.confidenceIntervalUpper
  pValueClosed : E.pValue < 0.05

theorem effect_size_closed_from_evidence (E : EffectSizeEstimate) (Ev : EffectSizeEvidence E) : EffectSizeClosed E := by
  exact {
    measureClosed := Ev.measureClosed
    valueClosed := Ev.valueClosed
    ciClosed := Ev.ciClosed
    pValueClosed := Ev.pValueClosed
  }

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse