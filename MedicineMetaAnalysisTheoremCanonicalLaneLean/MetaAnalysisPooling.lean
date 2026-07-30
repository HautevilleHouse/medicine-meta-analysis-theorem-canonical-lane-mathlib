import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure MetaAnalysisPooling where
  studies : List (Type u)
  heterogeneityMeasure : Prop
  fixedEffectsModel : Prop
  randomEffectsModel : Prop
  pooledEffectEstimate : Prop
  forestPlot : Prop
  publicationBiasAssessment : Prop

structure MetaAnalysisPoolingEvidence (M : MetaAnalysisPooling) where
  heterogeneityMeasureClosed : M.heterogeneityMeasure
  fixedEffectsModelClosed : M.fixedEffectsModel
  randomEffectsModelClosed : M.randomEffectsModel
  pooledEffectEstimateClosed : M.pooledEffectEstimate
  forestPlotClosed : M.forestPlot
  publicationBiasAssessmentClosed : M.publicationBiasAssessment

def MetaAnalysisPoolingClosed (M : MetaAnalysisPooling) : Prop :=
  M.heterogeneityMeasure ∧ M.fixedEffectsModel ∧ M.randomEffectsModel ∧ M.pooledEffectEstimate ∧ M.forestPlot ∧ M.publicationBiasAssessment

theorem meta_analysis_pooling_closed_from_evidence (M : MetaAnalysisPooling) (E : MetaAnalysisPoolingEvidence M) :
    MetaAnalysisPoolingClosed M := by
  exact And.intro E.heterogeneityMeasureClosed
    (And.intro E.fixedEffectsModelClosed
      (And.intro E.randomEffectsModelClosed
        (And.intro E.pooledEffectEstimateClosed
          (And.intro E.forestPlotClosed E.publicationBiasAssessmentClosed))))

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse