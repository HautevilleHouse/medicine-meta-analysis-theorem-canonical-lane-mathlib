import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure PublicationBiasEvaluationPackage where
  funnelPlotSymmetry : Prop
  eggerTestIntercept : ℚ
  eggerTestPValue : ℚ
  trimAndFillAdjusted : ℚ
  selectionModelFit : Prop

def PublicationBiasClosed (P : PublicationBiasEvaluationPackage) : Prop :=
  P.funnelPlotSymmetry ∧ P.selectionModelFit

structure PublicationBiasEvaluationEvidence (P : PublicationBiasEvaluationPackage) where
  funnelPlotSymmetryClosed : P.funnelPlotSymmetry
  selectionModelFitClosed : P.selectionModelFit

theorem publication_bias_closed_from_evidence (P : PublicationBiasEvaluationPackage) (E : PublicationBiasEvaluationEvidence P) :
    PublicationBiasClosed P := by
  exact And.intro E.funnelPlotSymmetryClosed E.selectionModelFitClosed

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse