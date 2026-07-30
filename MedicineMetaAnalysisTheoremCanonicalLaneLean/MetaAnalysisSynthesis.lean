import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure MetaAnalysisModel where
  effectSizes : Type u
  heterogeneity : Prop
  publicationBias : Prop
  overallEffect : Prop
  forestPlot : Type v

structure MetaAnalysisSynthesisEvidence (M : MetaAnalysisModel) where
  heterogeneityClosed : M.heterogeneity
  publicationBiasClosed : M.publicationBias
  overallEffectClosed : M.overallEffect

def MetaAnalysisSynthesisClosed (M : MetaAnalysisModel) : Prop :=
  M.heterogeneity ∧ M.publicationBias ∧ M.overallEffect

theorem meta_analysis_synthesis_closed_from_evidence (M : MetaAnalysisModel)
    (E : MetaAnalysisSynthesisEvidence M) : MetaAnalysisSynthesisClosed M := by
  exact And.intro E.heterogeneityClosed (And.intro E.publicationBiasClosed E.overallEffectClosed)

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse