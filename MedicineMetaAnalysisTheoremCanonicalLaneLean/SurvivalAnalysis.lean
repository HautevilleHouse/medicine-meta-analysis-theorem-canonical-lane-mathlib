import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure SurvivalAnalysisPackage where
  kaplanMeierEstimator : Prop
  logRankTest : Prop
  coxProportionalHazards : Prop
  hazardRatio : Prop
  confidenceInterval : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  logRankTestClosed : S.logRankTest
  coxProportionalHazardsClosed : S.coxProportionalHazards
  hazardRatioClosed : S.hazardRatio
  confidenceIntervalClosed : S.confidenceInterval

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.kaplanMeierEstimator ∧ S.logRankTest ∧ S.coxProportionalHazards ∧
  S.hazardRatio ∧ S.confidenceInterval

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.kaplanMeierEstimatorClosed
    (And.intro E.logRankTestClosed
      (And.intro E.coxProportionalHazardsClosed
        (And.intro E.hazardRatioClosed E.confidenceIntervalClosed)))

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse
