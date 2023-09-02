Alias $ActorTypes = http://hl7.org/fhir/examplescenario-actor-type

Instance: ExampleScenario-DDCC-VS007
InstanceOf: ActorDefinition
Description: """Offline cryptographic verification: A Verifier verifies a DDCC:VS using digital cryptographic processes in an offline mode."""

* name = "Offline cryptographic verification"
* useContext = $UsageContexts#workflow
* publisher = "World Health Organization"
* status = $PublicationStatus#draft


* actor[+].key = "DDCCHolder"
* actor[=].title = "DDCC Holder"
* actor[=].type = $ActorTypes#person
* actor[=].description = """The person who has the Vaccinated Person's vaccination certificate or the Tested Person's test result certificate. The person is usually the Vaccinated or Tested Person but does not have to be. For example, a caregiver may hold the DDCC for a child or other dependant."""

* actor[+].key = "Verifier"
* actor[=].title = "Verifier"
* actor[=].type = $ActorTypes#person
* actor[=].description = """A natural person or legal person, either private or public, formally authorized (under national law, decree, regulation or other official act or order) to verify and validate the SARS-CoV-2 vaccination status or diagnostic test result presented on the DDCC."""

* actor[+].key = "VerifierApp"
* actor[=].title = "Verifier App"
* actor[=].type = $ActorTypes#system
* actor[=].description = """A system that performs cryptographic verification of digital health certificates."""


* actor[+].key = "TrustNetworkGateway"
* actor[=].title = "TrustNetworkGateway"
* actor[=].type = $ActorTypes#system
* actor[=].description = """A natural person or legal person, either private or public, formally authorized (under national law, decree, regulation or other official act or order) to verify and validate the SARS-CoV-2 vaccination status or diagnostic test result presented on the DDCC."""



* process[+].title="Offline cryptographic verification"

* step[+].number = "1"


* step[=].process[+].title = "Offline cyrptographic verfication"
* step[=].process[=].step[+].number = "1.0"
* step[=].process[=].step[=].operation.title = "Request verification public key material for DDCC Trust Domain"
* step[=].process[=].step[=].operation.initiator = "VerifierApp"
* step[=].process[=].step[=].operation.receivor = "TrustNetworkGateway"

* step[=].process[=].step[+].number = "1.1"
* step[=].process[=].step[=].operation.title = "Return verification public key material for DDCC Trust Domain"
* step[=].process[=].step[=].operation.receivor = "VerifierApp"
* step[=].process[=].step[=].operation.initiator = "TrustNetworkGateway"

* step[=].process[=].step[+].number = "1.2"
* step[=].process[=].step[=].operation.title = "Cache verification public key material for DDCC Trust Domain"
* step[=].process[=].step[=].operation.receivor = "VerifierApp"
* step[=].process[=].step[=].operation.initiator = "VerifierApp"

* step[=].process[=].step[+].number = "1.3"
* step[=].process[=].step[=].operation.title = "Shows or shares verifiable digital vaccination certificate"
* step[=].process[=].step[=].operation.initiator = "DDCCHolder"
* step[=].process[=].step[=].operation.receivor = "Verifier"

* step[=].process[=].step[+].number = "1.3"
* step[=].process[=].step[=].operation.title = "Begins verification process"
* step[=].process[=].step[=].operation.initiator = "Verifier"
* step[=].process[=].step[=].operation.receivor = "VerifierApp"

* step[=].process[=].step[+].number = "1.4"
* step[=].process[=].step[=].operation.title = "Retrieves digital signature from digial vaccination certificate"
* step[=].process[=].step[=].operation.initiator = "VerifierApp"
* step[=].process[=].step[=].operation.receivor = "VerifierApp"

* step[=].process[=].step[+].number = "1.5"
* step[=].process[=].step[=].operation.title = "Retrieves key id from digial vaccination certificate"
* step[=].process[=].step[=].operation.initiator = "VerifierApp"
* step[=].process[=].step[=].operation.receivor = "VerifierApp"

* step[=].process[=].step[+].number = "1.6"
* step[=].process[=].step[=].operation.title = "Retrieve verification public key for cache of verification public key material"
* step[=].process[=].step[=].operation.initiator = "VerifierApp"
* step[=].process[=].step[=].operation.receivor = "VerifierApp"


* step[=].process[=].step[+].number = "1.7"
* step[=].process[=].step[=].operation.title = "Validate digital signature and indicate result"
* step[=].process[=].step[=].operation.initiator = "VerifierApp"
* step[=].process[=].step[=].operation.receivor = "Verifier"


* step[=].process[=].step[+].number = "1.8"
* step[=].process[=].step[=].operation.title = "Execute jursidiction's business rule(s) and show results"
* step[=].process[=].step[=].operation.initiator = "VerifierApp"
* step[=].process[=].step[=].operation.receivor = "Verifier"

