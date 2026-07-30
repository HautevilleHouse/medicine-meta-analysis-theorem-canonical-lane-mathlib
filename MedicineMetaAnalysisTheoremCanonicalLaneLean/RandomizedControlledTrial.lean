import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure RandomizedControlledTrial where
  treatmentArm : Type u
  controlArm : Type v
  sampleSize : Nat
  primaryOutcome : Prop
  effectSize : Prop
  pValue : Prop
  confidenceInterval : Prop
  riskDifference : Prop
  relativeRisk : Prop

structure RandomizedControlledTrialEvidence (R : RandomizedControlledTrial) where
  primaryOutcomeClosed : R.primaryOutcome
  effectSizeClosed : R.effectSize
  pValueClosed : R.pValue
  confidenceIntervalClosed : R.confidenceInterval
  riskDifferenceClosed : R.riskDifference
  relativeRiskClosed : R.relativeRisk

def RandomizedControlledTrialClosed (R : RandomizedControlledTrial) : Prop :=
  R.primaryOutcome ∧ R.effectSize ∧ R.pValue ∧ R.confidenceInterval ∧ R.riskDifference ∧ R.relativeRisk

theorem randomized_controlled_trial_closed_from_evidence (R : RandomizedControlledTrial) (E : RandomizedControlledTrialEvidence R) :
    RandomizedControlledTrialClosed R := by
  exact And.intro E.primaryOutcomeClosed
    (And.intro E.effectSizeClosed
      (And.intro E.pValueClosed
        (And.intro E.confidenceIntervalClosed
          (And.intro E.riskDifferenceClosed E.relativeRiskClosed))))

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse