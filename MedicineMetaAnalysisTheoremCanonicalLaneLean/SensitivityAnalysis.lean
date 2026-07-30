import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure SensitivityAnalysisPackage where
  leaveOneOutEstimates : List ℚ
  leaveOneOutCIs : List (ℚ × ℚ)
  influenceMeasure : List ℚ
  metaRegressionCoefficient : ℚ
  metaRegressionPValue : ℚ

def SensitivityAnalysisClosed (P : SensitivityAnalysisPackage) : Prop :=
  P.leaveOneOutEstimates.length = P.leaveOneOutCIs.length ∧
  P.leaveOneOutEstimates.length = P.influenceMeasure.length

structure SensitivityAnalysisEvidence (P : SensitivityAnalysisPackage) where
  leaveOneOutLengthMatch : P.leaveOneOutEstimates.length = P.leaveOneOutCIs.length
  influenceLengthMatch : P.leaveOneOutEstimates.length = P.influenceMeasure.length

theorem sensitivity_analysis_closed_from_evidence (P : SensitivityAnalysisPackage) (E : SensitivityAnalysisEvidence P) :
    SensitivityAnalysisClosed P := by
  exact And.intro E.leaveOneOutLengthMatch E.influenceLengthMatch

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse