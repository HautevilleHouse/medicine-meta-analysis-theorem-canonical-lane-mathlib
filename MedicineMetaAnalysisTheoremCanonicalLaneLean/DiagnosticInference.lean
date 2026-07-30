import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure DiagnosticInferencePackage where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  lrPositive : Prop
  lrNegative : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  lrPositiveClosed : D.lrPositive
  lrNegativeClosed : D.lrNegative

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.positivePredictiveValue ∧
  D.negativePredictiveValue ∧ D.lrPositive ∧ D.lrNegative

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.positivePredictiveValueClosed
        (And.intro E.negativePredictiveValueClosed
          (And.intro E.lrPositiveClosed E.lrNegativeClosed))))

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse
