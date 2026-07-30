import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure PublicationBiasAnalysis where
  eggerTestIntercept : Float
  eggerTestPValue : Float
  trimFillEstimate : Float
  failSafeN : Nat

structure PublicationBiasEvidence (P : PublicationBiasAnalysis) where
  eggerTestClosed : P.eggerTestPValue > 0.05
  trimFillClosed : P.trimFillEstimate ≠ 0.0
  failSafeClosed : P.failSafeN > 100

structure PublicationBiasClosed (P : PublicationBiasAnalysis) : Prop :=
  eggerTestClosed : P.eggerTestPValue > 0.05
  trimFillClosed : P.trimFillEstimate ≠ 0.0
  failSafeClosed : P.failSafeN > 100

theorem publication_bias_closed_from_evidence (P : PublicationBiasAnalysis) (Ev : PublicationBiasEvidence P) : PublicationBiasClosed P := by
  exact {
    eggerTestClosed := Ev.eggerTestClosed
    trimFillClosed := Ev.trimFillClosed
    failSafeClosed := Ev.failSafeClosed
  }

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse