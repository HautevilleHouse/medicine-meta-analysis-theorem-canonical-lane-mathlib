import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure BayesianMetaAnalysisModel where
  priorDistribution : Type u
  likelihood : Type v
  posteriorDistribution : Type w
  credibleInterval : Prop
  bayesFactor : Prop

structure BayesianMetaAnalysisEvidence (B : BayesianMetaAnalysisModel) where
  credibleIntervalClosed : B.credibleInterval
  bayesFactorClosed : B.bayesFactor

def BayesianMetaAnalysisClosed (B : BayesianMetaAnalysisModel) : Prop :=
  B.credibleInterval ∧ B.bayesFactor

theorem bayesian_meta_analysis_closed_from_evidence (B : BayesianMetaAnalysisModel)
    (E : BayesianMetaAnalysisEvidence B) : BayesianMetaAnalysisClosed B := by
  exact And.intro E.credibleIntervalClosed E.bayesFactorClosed

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse