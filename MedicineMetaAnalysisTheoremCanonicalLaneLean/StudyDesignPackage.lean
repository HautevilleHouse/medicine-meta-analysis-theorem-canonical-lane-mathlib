import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMetaAnalysisTheoremCanonicalLaneLean

structure StudyDesignPackage where
  studyType : String
  randomSequenceGeneration : Prop
  allocationConcealment : Prop
  blindingParticipants : Prop
  blindingOutcomeAssessment : Prop
  incompleteOutcomeData : Prop
  selectiveReporting : Prop
  otherBias : Prop

structure StudyDesignEvidence (P : StudyDesignPackage) where
  randomSequenceGenerationClosed : P.randomSequenceGeneration
  allocationConcealmentClosed : P.allocationConcealment
  blindingParticipantsClosed : P.blindingParticipants
  blindingOutcomeAssessmentClosed : P.blindingOutcomeAssessment
  incompleteOutcomeDataClosed : P.incompleteOutcomeData
  selectiveReportingClosed : P.selectiveReporting
  otherBiasClosed : P.otherBias

def StudyDesignClosed (P : StudyDesignPackage) : Prop :=
  P.randomSequenceGeneration ∧ P.allocationConcealment ∧
  P.blindingParticipants ∧ P.blindingOutcomeAssessment ∧
  P.incompleteOutcomeData ∧ P.selectiveReporting ∧ P.otherBias

theorem study_design_closed_from_evidence (P : StudyDesignPackage) (E : StudyDesignEvidence P) :
    StudyDesignClosed P := by
  exact And.intro E.randomSequenceGenerationClosed
    (And.intro E.allocationConcealmentClosed
      (And.intro E.blindingParticipantsClosed
        (And.intro E.blindingOutcomeAssessmentClosed
          (And.intro E.incompleteOutcomeDataClosed
            (And.intro E.selectiveReportingClosed E.otherBiasClosed)))))

end MedicineMetaAnalysisTheoremCanonicalLaneLean
end HautevilleHouse