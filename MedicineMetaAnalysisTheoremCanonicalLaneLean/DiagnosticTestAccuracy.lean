import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure DiagnosticAccuracyStudy where
  testResults : Type u
  goldStandard : Type v
  truePositives : Nat
  falsePositives : Nat
  trueNegatives : Nat
  falseNegatives : Nat
  sensitivity : Prop
  specificity : Prop
  positiveLikelihoodRatio : Prop
  negativeLikelihoodRatio : Prop
  diagnosticOddsRatio : Prop

structure DiagnosticAccuracyEvidence (S : DiagnosticAccuracyStudy) where
  sensitivityClosed : S.sensitivity
  specificityClosed : S.specificity
  positiveLikelihoodRatioClosed : S.positiveLikelihoodRatio
  negativeLikelihoodRatioClosed : S.negativeLikelihoodRatio
  diagnosticOddsRatioClosed : S.diagnosticOddsRatio

def DiagnosticAccuracyClosed (S : DiagnosticAccuracyStudy) : Prop :=
  S.sensitivity ∧ S.specificity ∧ S.positiveLikelihoodRatio ∧ S.negativeLikelihoodRatio ∧ S.diagnosticOddsRatio

theorem diagnostic_accuracy_closed_from_evidence (S : DiagnosticAccuracyStudy) (E : DiagnosticAccuracyEvidence S) :
    DiagnosticAccuracyClosed S := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.positiveLikelihoodRatioClosed
        (And.intro E.negativeLikelihoodRatioClosed E.diagnosticOddsRatioClosed)))

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse