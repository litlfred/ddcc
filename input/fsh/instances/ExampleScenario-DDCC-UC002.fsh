Alias $ActorTypes = http://hl7.org/fhir/examplescenario-actor-type

Instance: ExampleScenario-DDCC-UC001
InstanceOf: ActorDefinition
Description: """Paper First: A guideline-based vaccine administration is recorded on paper. After the vaccination event, data about it can be entered into a Digital Health Solution."""

* name = "Paper First: Vaccine Event record"
* useContext = $UsageContexts#workflow
* publisher = "World Health Organization"
* status = $PublicationStatus#draft

* actor[+].key = "DataEntryPersonnel"
* actor[=].title = "Data Entry Personnel"
* actor[=].description = """The person who enters the information about the Subject of Care, the Vaccinated Person, or the Tested Person (as outlined in the core data set) that was manually recorded at care sites or a sample collection site into a digital system. Health workers can also be the Data Entry Personnel if a point-of-care system is in place that allows health workers to digitally document a vaccination event right away. If a Digital Health Solution, such as a laboratory information system (LIS) is in place, lab technicians can also be considered Data Entry Personnel as they would be able to digitally document a lab result through the LIS right away"""
* actor[=].type = $ActorTypes#person


* actor[+].key = "DDCCHolder"
* actor[=].title = "DDCC Holder"
* actor[=].type = $ActorTypes#person
* actor[=].description = """The person who has the Vaccinated Person's vaccination certificate or the Tested Person's test result certificate. The person is usually the Vaccinated or Tested Person but does not have to be. For example, a caregiver may hold the DDCC for a child or other dependant."""

* actor[+].key = "SubjectOfCare"
* actor[=].title = "Subject of Care"
* actor[=].type = $ActorTypes#person
* actor[=].description = "The person who receives the vaccination."

* actor[+].key = "Vacinator"
* actor[=].title = "Vaccinator"
* actor[=].type = $ActorTypes#person
* actor[=].description = """The person who administers the vaccine. Depending on national policies, the person who administers the vaccine might not be a formal health-care provider. Examples include physicians, nurse practitioners, community health workers or volunteer vaccinators."""

* actor[+].key = "DigitalHealthSolution"
* actor[=].title = "Digital Health Solution"
* actor[=].type = $ActorTypes#system
* sctor[=].description = "A secure system that is used to capture and/or manage a digital record of the DDCC core data elements, such as an electronic immunization registry (EIR), an electronic medical record, a Laboratory Information System (LIS), or a shared health record (SHR)."


* process[+].title="Offline Recording of Vaccination Event"

* step[+].number = "1"
* step[=].process[+].title = "Record Paper Vaccination"
* step[=].process[=].step[+].number = "1.1"
* step[=].process[=].step[=].operation.title = "Perform vaccination"
* step[=].process[=].step[=].operation.initiator = "Vaccinator"
* step[=].process[=].step[=].operation.receivor = "SubjetOfCare"

* step[=].process[=].step[+].number = "1.2"
* step[=].process[=].step[=].operation.title = "Records vaccination event information"
* step[=].process[=].step[=].operation.initiator = "Vaccinator"
* step[=].process[=].step[=].operation.receivor = "DataEntryPersonnnel"



* step[=].process[=].step[+].number = "1.3"
* step[=].process[=].step[=].operation.title = "Uploads vaccination record"
* step[=].process[=].step[=].operation.initiator = "DataEntryClerk"
* step[=].process[=].step[=].operation.receivor = "DigitalHealthSolution"

* step[=].process[=].step[+].number = "1.4"
* step[=].process[=].step[=].operation.title = "Issues verifiable digital vaccination record"
* step[=].process[=].step[=].operation.receivor = "DataEntryClerk"
* step[=].process[=].step[=].operation.initiator = "DigitalHealthSolution"


* step[=].process[=].step[+].number = "1.5"
* step[=].process[=].step[=].operation.title = "Gives verifiable digital vaccination record"
* step[=].process[=].step[=].operation.initiator = "DataEntryPersonnnel"
* step[=].process[=].step[=].operation.receivor = "DDCCHolder"