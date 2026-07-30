import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure HeterogeneityAssessmentPackage where
  qStatistic : ℚ
  degreesOfFreedom : ℕ
  iSquared : ℚ
  tauSquared : ℚ
  pValueHeterogeneity : ℚ

def HeterogeneityClosed (P : HeterogeneityAssessmentPackage) : Prop :=
  P.qStatistic ≥ 0 ∧ P.iSquared ≥ 0 ∧ P.iSquared ≤ 1 ∧ P.tauSquared ≥ 0

structure HeterogeneityAssessmentEvidence (P : HeterogeneityAssessmentPackage) where
  qStatisticComputed : P.qStatistic ≥ 0
  iSquaredComputed : P.iSquared ≥ 0 ∧ P.iSquared ≤ 1
  tauSquaredNonnegative : P.tauSquared ≥ 0

theorem heterogeneity_closed_from_evidence (P : HeterogeneityAssessmentPackage) (E : HeterogeneityAssessmentEvidence P) :
    HeterogeneityClosed P := by
  exact And.intro E.qStatisticComputed
    (And.intro E.iSquaredComputed.1 (And.intro E.iSquaredComputed.2 E.tauSquaredNonnegative))

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse