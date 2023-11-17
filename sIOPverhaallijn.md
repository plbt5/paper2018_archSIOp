---
# Standard Scrivener+Pandoc Project YAML metadata
# IMPORTANT: YAML configuration files use SPACES for indentation to define structure, remember to straighten any smart quotes, and don't capitalise metadata keys like "author" or "title", they must be lowercase!

# Select which templates pandocomatic will use
# you can enter overrides to the templates here as well
pandocomatic_:
  use-template:
    - elsarticle  
title: "understanding precedes use: Consolidating semantic interoperability in software architectures"
author:
  - name: Paul Brandt
    orcid: 0000-0002-2353-967X  
    affiliation: 1
    correspondence: p.brandt@tue.nl 
  - name: Eric Grandry
    orcid: 0000-0003-3553-8460  
    affiliation: 2
    email: egrandry@gmail.com  
  - name: Marten van Sinderen   
    orcid: 0000-0001-7118-1353  
    affiliation: 4        
    email: m.j.vansinderen@utwente.nl   
  - name: Twan Basten     
    orcid: 0000-0002-2274-7274  
    affiliation: [1,3]  
    email: a.a.basten@tue.nl  
institute:
  - 1: Eindhoven University of Technology (TU/e), Eindhoven, The Netherlands
  - 2: Ministry of Mobility and Public Works, Luxembourg, Luxembourg
  - 4: University of Twente (UT), Enschede, The Netherlands
  - 3: ESI (TNO), Eindhoven, The Netherlands
keywords:
  - semantic interoperability
  - software architectures
  - semantics
  - interoperability
  - design principles
journalname: Information and Software Technology  
version-incr: commit # major, minor or commit
compiled: 02/11/2023
date: Thursday, 2 November 2023
ack: “”
   
  
---



# sIOP concerns #

	Created:	6 April 2023 at 17:02
	Modified:	7 June 2023 at 10:08
	Status:	Done
	Voortgang:	Revised draft

Present the problem of sIOP, show that it is an interesting/relevant problem, describe our contributions to solving the problem, and present the applied method / structure. of paper. As follows:

*Purpose of sIOP*

When agents collaborate, data are being exchanged. Data carry semantic meaning, implicitly. Semantic meaning is to be understood as referring to a particular SoA in the DoA. Semantic interoperability refers to the capability of collaborating software agents that allows the DSC to comprehend what SoA the DSP is referring to with the exchanged data. This is necessary for the DSC in order to use that data faithfully: understanding precedes use. 

*Problem of sIOP*

When collaborating agents share the same semantic representation, denoted as semantic homogeneity, they share equivalent semantic meaning, allowing for an immediate data understanding that are ready to use. The more successful this semantic standard, the more it will be used, the larger the community of use, and the more it evolves to support alternative or extended collaborative use cases. This requires stricter and more extensive governance of the standard that soon impedes the demands of the business to allow for dynamic collaborations with quick response to business opportunities. 

This decline in the purposeful application of semantic standards is a general characteristic, which can be observed independently from the domain or advances in support to governance of semantic standards.

*Purpose of paper*

We take an alternative approach, away from semantic homogeneity and investigate sIOP from the perspective of semantic heterogeneity. With the latter we refer to a situation where no prior agreements are made by the community towards the representation of domain semantics. This is an interesting and relevant approach since a successful outcome will evade the aforementioned problems and provide support to dynamic business collaboration. The purpose of this paper is to identify the architectural concerns about sIOP that are caused by semantic heterogeneity, find design principles to their resolution, and consolidate these in the view-based architecture paradigm.

*Overview of paper*

 ![Story board in terms of Concerns and Design Principles.][def:sIOPcore]

We identify four sets of concerns in relation to semantic interoperability, three of which are of functional nature and one of extra-functional nature. The first three main sections address the functional concerns (semantic concerns, reconciliation concerns, and mediation concerns); the fourth main section addresses extra-functional concerns about semantic scalability. For each of the identified concern, one or more design principles are defined. Finally, we present how these DPs can be operationalised by their inclusion in a method in support of view-based architectures. 

# Semantic concerns #

	Created:	6 April 2023 at 17:07
	Modified:	1 June 2023 at 17:39
	Status:	Done
	Voortgang:	Revised draft

We set the scene for semantic interoperability, and identify three pivotal aspects to consider.

First, we use the term *semantics* to refer to real-world semantics as used and interpreted by humans. Since software is incapable of genuine understanding, RWS cannot exist in software. Nevertheless, software agents exchange data that carry semantic meaning and with that refer to states of affairs in the domain. When processing such data, they must be processed isomorphic to reality in order to remain faithful to reality. This has been described in [@Brandt2021a], and we summarise our position towards semantics in software.

Second, we investigate the dynamic business collaboration concern, and argue that its *dynamic* characteristic will be difficult to achieve on the basis of semantic homogeneity, which is the current approach to achieve sIOP through (syntactic) standards that consolidate semantics. Therefore, we consider semantic heterogeneity a necessary condition in order to achieve sIOP in dynamic environments. 

Third, a conversation between two human agents that share a mutual purpose brings about a natural responsibility for both of them in order to achieve that purpose. We cannot find an argument that suggests that these responsibilities do not apply for collaborating software agents as well. Hence, it is necessary to surface semantic concerns that follow from the responsibilities that apply between communicating agents. 

These three aspects set the environment in which sIOP for dynamic business collaboration must thrive. We address the latter two concerns only, since we consider the former concern to represent the software engineering reality that cannot be changed.

## Semantics in software ##

	Created:	6 April 2023 at 17:07
	Modified:	25 May 2023 at 15:52
	Status:	Done
	Voortgang:	Revised draft

We summarise our position towards semantics in software from [@Brandt2021a]. Main points that serve as foundation for this paper are:

* Data carry semantic meaning, i.e., the notion of something by referring to that something as it appears in reality of the DoA.
* Data processing carries pragmatic meaning, i.e., data produced through a mathematical process, warranted by its premises (the semantic meaning). Pragmatic meaning is contextual, purposeful, and refers to SoA in the DoA.
* The Domain Model (DM) is allocated to address the semantic concerns. To that end, it contains semantic and pragmatic meaning, and by doing so represents the agent’s (subjective) reflection of the SoAs that are relevant to it.
* The System Model (SM) is allocated to address the concerns about fulfilling he agents purpose. It implements specific agent behaviour and contains agent internal system states. The SM has the potential to change SoAs.
* The DM and the SM are disjoint, although the SM is semantically grounded in the DM.
* Separate comprehensive behaviour from telic behaviour: comprehension leads to pragmatic meaning, telic behaviour leads to predefined, designed effects.




## Dynamic business concern ##

	Created:	6 April 2023 at 17:07
	Modified:	1 June 2023 at 18:30
	Status:	Incomplete
	Voortgang:	Revised draft

Business collaboration is driven by a mutual interest of different stakeholders, where software agents act on behalf of the stakeholder by exchanging semantic meaning about the DoA. Business collaboration requires agreements to be made between stakeholders about the semantic meaning that is carried by the data that the software agents exchange. *Dynamic* business collaboration is not different from that, except for the fact that variations occur over time about the mutual interests, or new or evolving business demands, involved stakeholders, and more. The nature of the dynamics in business collaboration can be strategical, tactical or ad-hoc, but almost always imply changes in the current semantic agreements that affect few or many involved stakeholders. A sudden increase in semantic heterogeneity will occur, and with it sIOP will be impeded on precisely the collaboration of interest. The IT must be aligned with the business again, and moreover, turn into effect almost immediately. Equally important, standing business collaboration must continue. 

\begin{mmconcern}[Dynamic collaboration concern]\label{cncrn:dynamic-collaboration}
This concern reflects the tension that exists in dynamic business collaborations between the business desire to immediately engage in business collaboration, particularly on new business opportunities, and the community-wide distributed IT efforts required to achieve sIOP. The latter involves reconciling semantic differences, implementing the newly established semantics, and coordinating its deployment to all involved software agents. The concern deepens due to the distribution of responsibilities involved: the business/domain is responsible for the semantics, whereas the local IT is responsible for consolidating the alignment of the exchange of data and their processing by their software agents with the specified semantics.
\end{mmconcern}

Applied DPs: (INCOMPLETE with respect to concern)

* DP1: Semantic Heterogeneity Principle
* DP5: Separate data syntax from semantics syntax principle

## Cooperative concern ##

	Created:	6 April 2023 at 17:07
	Modified:	25 May 2023 at 17:20
	Status:	In Review
	Voortgang:	Revised draft

### Semantic sufficiency ###

	Created:	6 April 2023 at 17:07
	Modified:	15 June 2023 at 09:41
	Status:	In Review
	Voortgang:	1st draft

What precise information is sufficient to provide to whom for the latter to proceed?

The ability to establish what can be considered *sufficient* information depends on:

* Purpose of conversation, deferred to \cref{conversation-purpose}
* Knowledge about what information is already available, what has been provided already, inferring what is missing
* Individual agents in the conversation and their capabilities
* Minimal  

Maxim 1, the quantity maxim (“Make your contributions as informative as is required (for the current purpose of the exchange), and not more than is required”), refers to the purpose of the conversation, which we investigate in \cref{conversation-purpose}. It also refers to the semantic meaning that is exchanged with the data. Assume the DSP agent to exchange that “Mrs. McNabb has got two sons”. The DSC can now comprehend from this that Mrs. McNabb has got exactly two sons. Without application of this maxim, an ambiguity emerges because the DSC can then also comprehend that Mrs. McNabb has got at least two sons. 
Another reason for the application of this maxim is about enabling the DSP to know what the DSC agent knows about the SoAs. Based on this knowledge, the scope of the conversation, viz what semantic meaning is sufficient for the DSP to exchange, can be minimised to what it considers unknown to the DSC. An efficient conversation [@Diggelen:2007vd] with the potential for agents to digress into subdialogues about the SoAs [@Engelmann2023] will emerge from that. 




\begin{mmconcern}[Semantic sufficiency concern]\label{cncrn:qtymc}
An efficient and unambiguous agent discourse requires agents to be aware of each other and each other’s purposes and knowledge. Similarly, collaborative, task-related discourses require composition of knowledge about each other’s capabilities and individual knowledge about the SoAs that apply in the shared domain. This is a distributed capability that requires clear scoping and timing to prevent an overload of reasoning and irrelevant data exchange.
\end{mmconcern}

Applied DP:

* DPy: Support multi-agent belief model

### Semantic faithfulness ###

	Created:	6 April 2023 at 17:07
	Modified:	29 May 2023 at 11:39
	Status:	In Review
	Voortgang:	1st draft

What do we deem necessary in order to maintain faithfulness to reality when exchanging data, and how can we assure that the data exchange does not introduce *phantom semantics*? In this reading, Maxim 2 (Quality) states that the DSP must assure to only exchange data that are faithful to reality, i.e., reflect the current SoA properly; on her turn, the DSC must assure to comprehend the exchanged data into semantic meaning in a way that reflects the intended SoA. This is about semantic accuracy, semantic validity, and being informed in good time. We assume software agents to not break this maxim on purpose, but that does not mean that the conversation does not introduce quality issues. Quality issues can emerge from the so-called false-agreement problem (FAP) [@Guarino:1998wq, Sec.2.4], resulting in collaborating agents to falsely belief that they agree.

\begin{mmconcern}[Semantic faithfulness concern]\label{cncrn:qlymc}
When two or more actors communicate, phantom semantics, and notably the false-agreement problem can easily emerge. It is essential that the semantic meaning that is comprehended by the DSC matches the semantic meaning that is intended by the DSP.
\end{mmconcern}

Applied DP:

* DP3: Minimise FAP principle

### Conversation purpose ###

	Created:	6 April 2023 at 17:07
	Modified:	7 June 2023 at 16:03
	Status:	In Review
	Voortgang:	1st draft

In our sIOP interpretation of Maxim 3 (Relation), it demands that agents need to communicate purposefully, relevant to the actual situation.

We distinguish at least different levels in agent comprehension:

* Comprehension about the communication protocols in order to engage in data exchange;
* Comprehension about the semantic protocols in order to engage in exchanging semantic meaning;
* Comprehension about the business collaboration in order to enable agent coordination towards the shared objective.

Apart from these levels in comprehension, two main distinctions in the domain of discourse exist:

* Discourse in terms of the core of the domain, viz the SoAs that apply in the DoA;
* Discourse *about* the DoA, viz the meta-domain:
    * provenance of the domain things, e.g., when and where did it originate, why was it registered (privacy regulations such as GDPR, CCPA) and when and by whom was it modified / addressed;
    * reliability of the statements made about the domain;
    * authorisation about the SoA that apply, i.e., who what authorised to access what SoA, by whom and on the bases of what criteria;
    * administration involved with the domain, e.g., required certificates or regulatory demands;
    * and many more
 
From an agent communication perspective, these meta-domains can be considered domains of their own since the discourse will address a particular meta-domain purpose to achieve. In such discourse, SoAs that apply in the core domain are simple facts that are plugged as object clause into the meta-domain discourse. These meta-domains require vocabularies of their own which can be defined, or have been already; PROV-O being an perfect example. This requires agents to ask or answer questions about the purpose of the interaction with any other agent. 

\begin{mmconcern}[Conversation purpose concern]\label{cncrn:rmc}
An agent needs to have the capability to engage in a meta-conversation -with one or more collaborating agents- with the single purpose to establish agreement on what to achieve with the conversation that they engage in. This capability can be considered a very fundamental capability when we consider the many different situations a group of agents can encounter, each requiring their own capabilities.
\end{mmconcern}

Applied DPs:

* DP X: Pragmatic protocol principle

So what? Based on this capability, any agent can engage in a conversation -on behalf of a stakeholder- with any other agent and:

* requests to engage in a conversation to establish a particular purpose;
* establish what it takes to establish that purpose
* achieve that purpose, providing the conditions are satisfied



### Semantic representation ###

	Created:	6 April 2023 at 17:07
	Modified:	29 May 2023 at 13:53
	Status:	In Review
	Voortgang:	1st draft

How can we understand each other(’s data)?

* Data are representations, and carry semantic meaning implicitly. 
* Without (agreement on) a universal representation on semantic meaning, i.e., semantic homogeneity, agreements on the relation between each other’s semantic representations must be established at runtime.
* Since a representation is subsequent to a conceptualisation, an agreement on semantic representation implies compatibility between conceptualisations, viz similar OCs

\begin{mmconcern}[Semantic representation concern]\label{cncrn:mmc}
Collaborating agents in a semantic heterogeneous environment need to possess the capability to achieve a mutual understanding of how the SoAs of the DoA are being represented by their data.  
\end{mmconcern}

We consider the overall objective of sIOP as to exchange semantic meaning about the DoA in order to progress towards the shared objective of the collaboration. This represents one of the purposes that can be vocalised by DP X, being the semantic purpose, viz to establish sIOP. Such requires a semantic universe of discourse of its own. In order to exchange semantic meaning, first, agreement must be reached whether the required level of semantic compatibility can be achieved, based on what OC and how. Second, agents must establish agreements on the vocabularies and ontologies in use and the necessary alignments between them, or, in absence of the latter, agents must engage in a reconciliation process [@Diggelen:2007vd]. Only then both agents are prepared to engage in exchanging semantic meaning.

Applied DPs:

* DP2: Semantic responsibility principle
* DP4: Semantic protocol principle

So what? Based on this capability, and from a semantic perspective, agents can achieve interoperability at the semantic level, viz making preparations to *engage* in exchanging semantic meaning, and to actively contribute to *consolidate* such capability, subsequently. In terms of DP X, the pragmatic protocol principle, this means that any agent can engage in a conversation -on behalf of a stakeholder- with any other agent and:

* requests to talk about the semantic level
* establish what it takes to establish sIOP
* establish sIOP, providing the conditions are satisfied


# Reconciliation concerns #

	Created:	6 April 2023 at 17:07
	Modified:	29 June 2023 at 15:47
	Status:	In Progress
	Voortgang:	1st draft

Semantic interoperability is about at least two software agents, in their roles as DSP and DSC, that share a particular DoA and exchange data that refer to a certain SoA in their shared reality. Since semantic heterogeneity is assumed, achieving semantic reconciliation becomes a necessary condition for sIOP. 

\begin{mmdef}[Semantic reconciliation]\label{def:semantic-reconciliation}
Semantic reconciliation aligns (establishing correspondence and consistency) and harmonizes (resolving conflicts and achieving unity) differences in software agents' conceptualizations and representations of a shared domain. Its goal is to foster effective communication by establishing semantic homogeneity among agents' diverse ontological models. Semantic reconciliation relies on genuine understanding, which necessitates human involvement.
\end{mmdef} 

The architectural concerns revolve around the tension that exists between semantic reconciliation with its required human involvement and its inevitable impact on the “access-and-play” business demand, i.e., minimising human effort to the highest extent possible.



## Semantic coherence ##

	Created:	6 April 2023 at 17:07
	Modified:	29 June 2023 at 21:18
	Status:	In Progress
	Voortgang:	1st draft

In \cref{semantics-in-software}, we defend the central disposition of reciprocity between data and data processing, emerging as an Atomic Semantic Monolith (ASM), with the explicit purpose to guarantee the coherence between the data (semantic meaning) and their processing code (pragmatic meaning). 

Data exchange implies the DSP to tear down the ASM, separating the semantic meaning from its pragmatic meaning. Since data comprehension precedes its faithful use, the DSC must establish a valid reciprocity between the DSP’s semantic meaning with its own pragmatic meaning, e.g., when exchanging temperature, assure that the DSP’s semantic meaning and the DSC’s pragmatic meaning apply similar background knowledge about scales and units and alike, and assure that the temperature applies to the same object, to name a few. Data exchange, thus, implies the DSC to receive semantic meaning only, losing every guarantee that reciprocity between the DSP’s data and the DSC’s data processing is coherent. Unless it can be guaranteed that this reciprocity is as coherent as necessary for a faithful comprehension by the DSC, it is impossible to establish sIOP without emergence of phantom semantics. We consider maintaining semantic coherence a necessary condition for sIOP to emerge, and formulate the third concern about sIOP as follows.

\begin{mmconcern}[Semantic coherence concern]\label{cncrn:re-establish-coherence}
The reciprocity between data and their processing is the carrier of RWS. By the nature of data exchange, this reciprocity is broken for the DSC on receipt of data. Without reciprocity, no faithful comprehension of the DSP’s semantic meaning can occur; absence of faithful comprehension by the DSC impedes its capability to establish sIOP with the DSP.
\end{mmconcern}

Applied DPs: 

* DP8: Alignment principle.  
* DP9: Correspondence relation principle




## Human involvement ##

	Created:	6 April 2023 at 17:07
	Modified:	29 June 2023 at 21:18
	Status:	In Progress
	Voortgang:	1st draft

The purpose of comprehension is to reconcile semantic differences, which remains a distinct concern. Its resolution will depend on the position that is taken on comprehension, and from our position its resolution requires human effort to understand and resolve the semantic differences between the interoperating agents. The architectural issue then becomes where to position the dependency on the human when considering \cref{cncrn:re-establish-coherence}, in order to minimise her effort. 


\begin{mmconcern}[Human involvement concern]\label{cncrn:hic}
Provided that the human capability to genuinely understand semantics is required to reconcile semantic differences in a heterogeneous semantic environment, what will be her responsibilities, how can the dependency on her become minimal, and what tools should be available to her support?
\end{mmconcern}

Applied DP:

* DP10: Human efficiency principle

## Business coordination ##

	Created:	6 April 2023 at 17:07
	Modified:	25 May 2023 at 17:44
	Status:	In Progress
	Voortgang:	1st draft

The objective of collaborating stakeholders is to establish, in concert, the projected SoA that represents the goal of the business collaboration. Due to its collaborative nature, each different stakeholder contributes to the projected SoA. Such an individual contribution is produced by agent’s individual telic behaviour, and is represented as an individual SoA. This brings about the following concern:


\begin{mmconcern}[Business coordination concern]\label{cncrn:bcc}
Due to its collaborative nature, the goal of business collaboration, viz the shared projected SoA, depends on the individual SoAs of each stakeholder, which on their turn might be dependent, physically and/or temporally, on other agents’ individual SoAs. Provided that an individual SoA represents the result of a particular telic behaviour of a specific agent, what semantic meaning do the contributing agents need to exchange in order to coordinate these individual telic behaviours in a dynamical business environment?
\end{mmconcern}

Applied DP:

* DP11: Business conversation protocol principle

Collaborating towards shared business objectives occur between agents, and their communication will proceed through different stages. Sometimes, these stages will follow a determined sequence, sometimes a stage change will emerge in an ad-hoc fashion to account for the occurrence of unexpected states of affairs (SoAs). In order to support a dynamic collaboration, it is necessary for agents to gain awareness of the purpose of the conversation, to consolidate an effective conversation and adapt their conversational contribution when necessary. 


These situations can differ hugely, when *engaging in* business collaboration or *adapting to* changes. Different stages of collaboration require different conversations with different conversation objectives, i.e., to recognise the stage of collaboration, to determine the objective of the cooperation at that stage, to know about the conversation that such stage will ensue and about the criteria for a transition to another stage.   



# Mediation concerns #

	Created:	6 April 2023 at 17:07
	Modified:	25 May 2023 at 20:46
	Status:	In Progress
	Voortgang:	1st draft

In the previous sections we identified the need for agents to exchange semantic meaning in their local representation of their own conceptualisation that only applies their locally adopted background knowledge. We identified several semantic reconciliation concerns and introduced alignments to their resolution, established how to minimise human involvement, and provided a mechanism to coordinate each agent’s telic behaviour into collaboration. These are all preparations in order to achieve the actual collaboration between agents, and it is in this reading that we again apply the cooperative principle from \cref{cooperative-concern}. This results in two distinct capabilities that 





 However, we als need to apply Maxim 3, relation, because each partners’ contribution must be appropriate to the immediate needs at each stage of the conversation. We define the agents’ cooperation in terms of the interaction between them, as follows.

\begin{mmdef}[Interaction coordination]\label{def:ic}
Interaction coordination is the process of directing the particular flows of conversation that occur in a collaboration, specifically about which agents need to cooperate by what semantic meaning in what order, initiating telic behaviour from the concerned agents, required to achieve the mutual objective of the collaboration.
\end{mmdef} 

Semantic mediation can now be defined as:

\begin{mmdef}[Semantic mediation]\label{def:sm}
Semantic mediation is a generic, run-time capability that transcribes data between the native DMs of the collaborating agents, and that directs the particular flows of conversation that occur in a collaboration.
\end{mmdef} 



 




## Data transcription ##

	Created:	20 April 2023 at 12:15
	Modified:	25 May 2023 at 20:46
	Status:	In Progress
	Voortgang:	Writing

In response to Maxim 1, the quantity maxim (“Make your contributions as informative as is required (for the current purpose of the exchange), and not more than is required”), transcription is a key process in establishing sIOP in heterogeneous environments. To assure that the DSP and DSC communicate as informative as is required, both must produce and consume data that comply to their own native conceptualisation and representation. Indeed, the DSP discloses with its semantic meaning only what it deems relevant and exactly as it fits in its own DM, \cref{quantity-maxim}. Receiving this from the DSP agent, it is quite incomprehensible for any DSC agent. To make the DSP’s contribution as informative as is required for the DSC, a transcription of semantic meaning is required.

Furthermore, Maxim 4, the manner maxim, demands that the data exchange must avoid obscurity of expression, ambiguity. We introduce *phantom semantics* as transcription-induced statements (data) that the DSC agent will interpret to reflect state of affairs that are not intended by the DSP agent. Then, occurrence of phantom semantics should be considered a communication failure.

Combining both maxims in this way, the following concern ensues:

\begin{mmconcern}[Data transcription concern]\label{cncrn:dtc}
    sIOP requires to transcribe the exchanged statements (data) between the native DMs of collaborating agents without introducing phantom semantics. 
\end{mmconcern}

Such transcription capability provides the operational capability to mediate all differences that occur in the conceptualisation and representation of semantic meaning that is carried by the data being exchanged between the DSP and the DSC. 

Applied DP: 

* DP12: Data transcription principle

## Interaction coordination ##

	Created:	6 April 2023 at 17:07
	Modified:	25 May 2023 at 20:46
	Status:	In Progress
	Voortgang:	Writing

A business collaboration between agents can become quite complex in terms of interactions that are required to achieve the shared business objective. It surfaces the equal demand from each agent to manage and control a multitude of semantic interactions in order to play its own part in all collaborations that it is engaged in. 

Individual agents don’t have a need to be intimately aware of each other; it is sufficient for the agents to deliver what is requested and to receive what they require. Controlling and coordinating the data streams depends on the conversation that applies, and although that conversation must be coordinated and managed, there is no reason for agents to take upon them that responsibility. They *do* have responsibility on behalf of their own, local pragmatic meaning; when they are in need of additional SoA’s in order to comprehend received data, to finalise a conversation or to achieve their own objective, they have the responsibility to address that demand, using either local or remote knowledge.

\begin{mmconcern}[Interaction coordination concern]\label{cncrn:icc}
To manage this complexity, it must be resolved in a way that administers justice to the shared and the individual responsibilities and to support to the changes that will occur in a dynamic business environment. The concern refers to coordinating the flow of interactions, i.e., data exchange, between collaborating agents that occur during their business conversations. 
\end{mmconcern}

We consider this concern related to but different from \cref{cncrn:scalability}, as it surfaces the complexity of the business collaboration process as another scalability dimension. 

The issue at hand is to untwine the responsibilities between those that can and can not be delegated to other agents or infrastructural service providers. And although its primary focus is on responsibilities in relation to business collaboration and their conversations, it is also relevant for responsibilities that come into play during the entrance of new agents and exit of existing agents. Clearly, the latter is driven by the scalability concern, and we will address those responsibilities in \cref{concern-sc1-emantic-scalability-concern}.

Applied DP:

* DP13:Interaction coordination principle

# Scalability concerns #

	Created:	6 April 2023 at 17:07
	Modified:	25 May 2023 at 17:24
	Status:	In Progress
	Voortgang:	Writing

Although they share semantic meaning, the resulting semantic monolith of the DSC must be allowed to differ from the DSP’s semantic monolith. In fact, collaboration is all about sharing data that carry similar semantic meaning but allowing for different pragmatic meaning in order to achieve different results that together fulfils the shared purpose. For example, by exchanging a heartbeat both agents share the semantic meaning about the number of beats per second. However, the pragmatic meaning can vary between an indication of health for a health-care application and an indication of performance potential in a sports application, with different pragmatic demands on semantic meaning, e.g., resolution or accuracy. Additionally, and as identified as \cref{cncrn:semantic-heterogeneity}, semantic meaning can be represented in many different ways. Both aspects bring about a further concern on semantic scalability, since semantics won’t be centrally coordinated anymore resulting in semantic definitions that are distributed all over the place (see \cref{dp:shp}). 

In our pursuit to formulate this scalability concern, we first provide for a definition that draws from the classical formulations on system scalability [@Bondi2000;@Steed2010;@Shivakumar2015]. In its classical interpretation, scalability is about increasing quantity while maintaining the quality of the system, in terms of performance, functionality or efficiency as perceived by the end users. In the same spirit, we address semantic scalability also in terms of quantity, where the number of perspectives on reality have the most impact on semantic diversity and representational variety, more than stakeholders alone. Furthermore, we formulate the quality to maintain not in terms of interoperability itself, but the effort that is required to consolidate sIOP between those many perspectives, notably since this addresses the main feature that sIOP is to support: business agility. This results in the following definition: 

\begin{mmdef}[Semantic scalability]\label{def:semantic-scalability}
Semantic scalability is the capability of a system of collaborating software agents to adopt and/or consolidate, with acceptable lead time and costs, additional perspectives on their shared reality without compromising sIOP between the interacting software agents. 
\end{mmdef}  



## Semantic scalability ##

	Created:	6 April 2023 at 18:09
	Modified:	25 May 2023 at 20:45
	Status:	In Progress
	Voortgang:	Writing

Pursuing business agility requires semantic scalability; pursuing business agility in an open world results in heterogeneity and, hence, requires to cope with semantic independence. We formulate the following concern to its effect:

\begin{mmconcern}[Semantic scalability]\label{cncrn:scalability}
  In an open world, semantic definitions are distributed and commit to different perspectives on the DoA while central coordination is not always available. Furthermore, computers lack the capability for genuine understanding. Consequently, semantic differences between collaborating agents must be explicitly reconciled and maintained, implying semantic agreements in support of sIOP. Agreements imply a relationship to exist between software agents, as well as institutionalising (the governance of) those relationships to manage them under continuing changes in business collaborations and the occurrence of semantic drift. At the same time, semantic scalability requires collaborative software agents to maximise their semantic independence.
\end{mmconcern}

Applied DP:

* DP14: Semantic scalability principle


## Loosely coupled semantic ##

	Created:	6 April 2023 at 17:07
	Modified:	25 May 2023 at 17:24
	Status:	In Progress
	Voortgang:	Writing


Finally, we consider the classical concern about loose coupling but in a semantic reading instead, in order to respond to consequences that follow from pursuing interoperability while insisting on a semantic heterogeneous environment. 

Finally, we consider the classical concern about loose coupling but in a semantic reading instead, in order to respond to consequences that follow from pursuing interoperability while insisting on a semantic heterogeneous environment. In software, how does data relate to real-world semantics? 

DEFINITIE VAN LCS TOEVOEGEN

By introducing semantic heterogeneity, we renounce to bind domain semantics to particular syntax upfront. Nevertheless, stakeholders must remain the capability to use exchanged data, hence, semantic coupling must be realised. Loose coupling is known as a strong architectural principle that brings about many advantages. This holds for its semantic reading as well: agents that are loosely coupled in their semantics (i) can communicate in their own native representations without the need to learn or integrate foreign representations; (ii) need to define semantics only once for a particular DoA, and use it in concert with every software agent that operates in that DoA; (iii) can define their semantic representations geared to fit their particular domain and application(s) in isolation from global semantics; and (iv) can re-use available, local semantics, improving the economic value of local semantics throughout their lifetime. Moreover, since re-use implies another confrontation with reality, (v) the quality and scope of the local semantics will improve and extend over time. 

In its classical sense, loose coupling is realised through the principles of separation of concerns and transparency. We investigate how to apply those principles at the semantic level in the next two subsections.

### Semantic transparency ###

	Created:	6 April 2023 at 17:07
	Modified:	25 May 2023 at 20:45
	Status:	In Progress
	Voortgang:	Writing

Definitie van semantic transparency toevoegen; het concern is daarvan afgeleid: “What is required to enforce semantic transparency?”

\begin{mmconcern}[Semantic transparency concern]\label{cncrn:stc}
TBD
\end{mmconcern}

Applied DP:

* DP7: Semantic transparent API principle

### Semantic separation of concerns ###

	Created:	6 April 2023 at 17:07
	Modified:	25 May 2023 at 20:45
	Status:	In Progress
	Voortgang:	Writing


\begin{mmconcern}[Semantic separation of concerns]\label{cncrn:ssoc}
TBD
\end{mmconcern}



Applied DPs:

* DP4: Semantic protocol principle
* DP5: Separate data syntax from semantics syntax principle
* DP6: Semantic modularity principle

# Operationalisation #

	Created:	1 June 2023 at 13:41
	Modified:	1 June 2023 at 14:46
	Status:	In Review
	Voortgang:	1st draft

To be done by Eric.

*PREPARATION*

Apply an architectural method, e.g., ArchiMate, to direct the operationalisation. From that method, identify those elements from the method (activities, phases, concepts, whatever) that apply to sIOP. For each of those elements, identify the DP that is relevant to it. This results in a matrix of relevant architectural elements versus DPs. Check that all DPs are categorised to at least one element; if one is missing, either the matrix is incomplete or there is something missing in the architectural method. Correct the matrix and/or set the unused DPs apart.

*WRITING*

* The structure of this main section follows from the elements of interest: each relevant element justifies a single section, and - if necessary - sections can be structured according to the containing phase or whatever from the method. 
* Introduce this main section by describing:
    * Purpose of the section, i.e., showing that it is possible to operationalise the DPs and that the agents’ sIOP capabilities will be extended;
    * Method that is followed, i.e., selection of a particular view-based architectural method, why this particular method is chosen, and that we integrate the DPs in it;
    * Present the matrix as overview of how the main section is broken down in its sections/subsections;
* In each section, answer:
    * Purpose: What is the purpose of this element in the architectural method?
    * Rationale: Why is it relevant for this element to address this DP(s)?
    * Application: What steps are involved in applying the DP(s)? The method should direct the steps as the baseline in which the DPs are to be merged. Focus on what the step achieves as opposed to how it is done or the technology involved.
    * Consequence: What sIOP capability is gained for the software agent that was not possible before?
* Finalise with a section - if necessary - that explains how the architectural method can be extended ot include the unaddressed DPs. 


# DPs #

	Created:	6 April 2023 at 17:02
	Modified:	6 April 2023 at 17:33
	Status:	No Status
	Voortgang:	No Label

## DP1:shp Semantic Heterogeneity Principle ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:13
	Status:	In Review
	Voortgang:	Revised draft

sIOP should strive to support multiple co-existing perspectives of use as opposed to enforcing one single perspective, and should be founded on the active reconciliation of semantic differences rather than on allowing one homogeneous semantic standard only.

## DP: Separate DM from SM ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:10
	Status:	No Status
	Voortgang:	1st draft

Gedefinieerd in paper 1 als een combinatie van:

* Semantic Coherence Principle: Establish explicit coherence between the data (S-model) and the data-processing (P-model).
* Semantic Grounding Principle: All models that are part of the System Model and refer to the DoA, are grounded in the Domain Model.

## DP: Separate comprehension from telic behaviour ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:11
	Status:	In Review
	Voortgang:	1st draft

Defined in paper 1 als: Make a distinction between comprehension operations that follow from the inferential model to establish pragmatic meaning (data-processing for comprehension) and telic operations that realise actions in order to achieve a certain goal of the application (data-processing to produce results).



## DP2:srp Semantic responsibility principle ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:13
	Status:	In Review
	Voortgang:	Revised draft

The software agent has the responsibility to explicate and disclose its OC, and, additionally, to disclose the semantic meaning of any exchanged data, to the extent necessary to allow comprehension of its data by the other involved agent(s).

## DP3:mfapp Minimise FAP principle ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:13
	Status:	In Review
	Voortgang:	Revised draft

In order to minimise the False-Agreement Problem, the software agent's domain model must be constrained to minimize the difference between the semantic meaning that it allows and those that it intends.

## DP4:spp Semantic protocol principle ##

	Created:	6 April 2023 at 17:07
	Modified:	5 May 2023 at 15:10
	Status:	In Review
	Voortgang:	Revised draft

The agent should provide the capability to respond to a semantic protocol that has the objective to prepare sIOP. First, agents must reach agreement whether the required level of semantic compatibility can be achieved, and how. Second, agents must establish agreements on the [vocabularies and ontologies | domain models] in use. Third, agreement must be reached about how they relate semantically to each other; this might include engaging in a reconciliation process (van Diggelen, 2007), and/or application of pre-determined alignments between them.

## DP5:sds-ss Separate data syntax from semantics syntax principle ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:14
	Status:	In Review
	Voortgang:	Revised draft

Separate syntax representing the data payload in the agent interoperation from syntax representing the semantic payload of the data.

## DP6:smp Semantic modularity principle ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:14
	Status:	In Review
	Voortgang:	Revised draft

When it is reasonable to expect that the domain model (DM) of the agent will grow throughout its lifetime, the DM should allow for modularisation methods that simplify and downsize the DM into manageable parts.

## DP7:stp Semantic transparent API principle ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:14
	Status:	In Review
	Voortgang:	Revised draft

The software agent must remain agnostic to the local conceptualisation(s) and representation(s) of the agent(s) it collaborates with by implementing APIs that access semantic functionalities without committing to the particular domain semantics. Standardise communication services and their parameters on the semantic metalevel only, and only allow domain semantics as payload to the API.

## DP8:ap Alignment principle ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:14
	Status:	In Review
	Voortgang:	Revised draft

Align semantic meanings, not data schemata or data syntax. 

## DP9:crp Correspondence relation principle ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:14
	Status:	In Review
	Voortgang:	Revised draft

A correspondence relation must preserve semantic meaning by addressing conceptual differences as well as convention-induced value-space differences. The alignment language must be expressive enough to represent those differences, the resolution of which is a necessary condition to achieve sIOP, providing faithful DMs from both collaborating agents.

## DP10:hep Human efficiency principle ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:14
	Status:	In Review
	Voortgang:	Revised draft

The human responsibility in semantic reconciliation should, to the extent possible, focus on auditing semantic alignments, and minimize their authoring. Maximise the use of reconciliation and auditing tools as well as the reuse of available alignment information.

## DP11:bcpp Business conversation protocol principle ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:14
	Status:	In Review
	Voortgang:	Revised draft

The agent should provide the capability to engage in a business conversation with participating agents, with the objective to jointly achieve a conversation state that is considered a(n intermediate,) necessary step towards the collaboration goal.

## DP12:dtp Data transcription principle ##

	Created:	6 April 2023 at 17:07
	Modified:	27 April 2023 at 12:45
	Status:	No Status
	Voortgang:	1st draft

Transcribe exchanged data between their local and remote conceptualisation and representation, without introducing phantom semantics. Apply for its implementation the mediation pattern to instantiate a business conversation based transcription component that is configured by semantic alignments. 

## DP13:icp Interaction coordination principle ##

	Created:	6 April 2023 at 17:07
	Modified:	27 April 2023 at 12:37
	Status:	No Status
	Voortgang:	1st draft

The coordination and control of business interactions that apply in the context of a particular business conversation. must either be encapsulated by the software agent or assumed as an infrastructural mediated service, preferring the latter. Both solutions should instantiate a an interaction coordination session at the start of a business conversation, configured either by a business choreography, a business orchestration or a business conversation specification. The session ends at achieving the projected SoA. The session is to maintain a cache of the SoAs that apply as they occur or change. Semantics and Interaction are assumed to remain stable over a single session, but can change between sessions.

## DP14:ssp Semantic scalability principle ##

	Created:	6 April 2023 at 17:07
	Modified:	23 April 2023 at 23:17
	Status:	To Do
	Voortgang:	Writing

TBD