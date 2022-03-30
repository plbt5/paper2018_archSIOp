---
# Standard Scrivener+Pandoc Project YAML metadata
# IMPORTANT: YAML configuration files use SPACES for indentation to define structure, remember to straighten any smart quotes, and don't capitalise metadata keys like "author" or "title", they must be lowercase!

# Select which templates pandocomatic will use
# you can enter overrides to the templates here as well
pandocomatic_:
  use-template:
    - elsevier  
  preprocessors:
    - preprocessors/preludeGitVersion.py
title: "Consolidating semantic interoperability in contemporary software architectural paradigms"
tnote: 
  - "Tables & figures with 2-columns incorrectly placed; will be corrected when submitting."
author:
  - name: Paul Brandt
    orcid: 0000-0002-2353-967X  
    affiliation: 1
    correspondence: paul@brandt.name  
  - name: Eric Grandry
    affiliation: 2
    email: egrandry@gmail.com  
  - name: Marten van Sinderen   
    affiliation: 3        
    email: m.j.vansinderen@utwente.nl   
  - name: Twan Basten     
    affiliation: 1  
    email: a.a.basten@tue.nl  
institute:
  - 1: Eindhoven University of Technology (TU/e), Eindhoven, The Netherlands
  - 2: Ministry of Mobility and Public Works, Luxembourg, Luxembourg
  - 3: University of Twente (UT), Enschede, The Netherlands
keywords:
  - semantic interoperability
  - software architectures
  - semantics
  - interoperability
  - design principles
journalname: Information and Software Technology  
version-incr: major # major, minor or commit
compiled: 30/03/2022
date: Wednesday, 30 March 2022
thanks: Do we have acknowedgments to make?
abstract: |   
  
  *Background:* In today's increase of business digitalisation and system's distribution, absence of access-and-play semantic interoperability (sIOP) is a major hurdle to IT-based business collaboration. Current approaches towards sIOP not only impede access-and-play sIOP but also its progress towards a standard infrastructural semantic layer. Following [@Brandt2021a], semantics cannot exist in software and is reduced to the reciprocity between data and data processing. Data exchange breaks that reciprocity, failing sIOP. The main concern of sIOP is to re-establish a valid reciprocity between the data consumer's internal data processing and the data producer's external data, while maintaining loosely coupled semantics. The access-and-play concern for sIOP requires the effort of the inevitable human-in-the-loop to be reduced. Both concerns are a matter of software architecture.       
  
  *Objective:* The objective of our study is to identify and formulate the fundamental demands on access-and-play sIOP, to derive their supporting architectural principles, and their integration in contemporary architectural paradigms.    
  
  *Method:* We assume for each agent an explicit representation of their semantics. We assess the problem foundations, and identify six requirements on sIOP, two of which concerned with a genuine understanding of semantics demanding a human-in-the-loop. We develop design principles in support of interoperability between the agents' semantics. We evaluate these principles by designing an ISO-42010 Architecture Viewpoint and View on sIOP.   
  
  *Results:* We show that loosely coupled semantics, semantic alignments and accountability about the applied ontological commitment can be considered the cornerstones to achieve sIOP. The supporting principles are: (i) assume responsibility for your data semantics; (ii) maintain an explicit ontological commitment; (iii) abstract semantics from communication; (iv) align the internal and external semantics of exchanged data; (v) encapsulate how agents exchange semantics. The resulting ISO-42010 Architecture Viewpoint and View on sIOP, including a semantic mediation capability, represents a pattern that is capable of consolidating sIOP in contemporary architectural paradigms.  
  
  *Conclusions:* The major architectural shortcomings for an access-and-play sIOP capability are their negligence of a separation of concerns (i) between semantics and data, and between (ii) human-authored alignments and automated mediation. Establishing the conditions for their support in advance consolidates sIOP by loosely coupled semantics that are re-usable for every collaboration, even those that are not anticipated for. We conclude that loosely coupled semantics can be consolidated in contemporary architectural paradigms, stimulating access-and-play sIOP.   
     
  
---



# Introduction #

Never before, data were so ubiquitous, and managed access to external data was so easy. But *understanding precedes use*, and understanding the data requires a human-in-the-loop and, therefore, is time-consuming and hampers agility in business collaboration in all domains. For instance, consider the following (allegedly real) example of an interoperability failure.

> A German steel producer upgraded its industrial process robot. Since the majority of the steel production process is dependent on time, from a safety point of view the decision was made to not rely on their own internal clocks but to use the German *Braunschweig Funkuhr* time radio signal as source for the exact time instead. At the end of April 1993, when Germany went on summer time, the computer clock of the steel producer went from 1:59 AM to 3:00 AM in one minute. This resulted in a production line allowing molten ingots to cool for one hour less than normal. When the process controller asserted the cooling time had expired, its actions splattered still-molten steel, damaging part of the facility.[^fn1]

In this simple example a tiny difference in the meaning of `time` between the Data Service Consumer (DSC), i.e., steel manufacturer, and the Data Service Producer (DSP), i.e., the Braunschweig Funkuhr, hampered interoperability to the extend of damaging the steel facility. This tiny difference rooted in the assumption by the DSC that `time` expressed a continuous scale whilst for the DSP, `time` denoted instant clock time for the yearly season, representing a non-continuous scale. Data represents a certain state of affairs (SoA) in the domain of application (DoA), and the purpose of sIOP is to communicate that SoA such that the DSC can act on it. Unfortunately, between the DSP and the DSC variations may exist in terms, structures, dimensions and other background knowledge about the exchanged data. Consequentially, one datum might refer to two different SoAs, deceiving the DSC about its perceived SoA, leading to conclusions that cannot be substantiated in the DoA and, subsequently, incorrect behaviour. In order to achieve that DSCs can correctly *use* DSPs' data, the need exists to design and implement wrappers that restores any differences in SoAs that emerge from the data. Many such variations exist, leading to a range of failures in so-called *semantic interoperability* (sIOP). Unfortunately, it is fundamentally impossible to automate the production of wrappers, because we need a genuine *understanding* upfront, which computers still cannot do. When we accept the need for a human-in-the-loop, her place in architecture becomes a design choice. Like [@Kuhn2009], and as opposed to a philosophical or linguistic problem, we consider semantic interoperability an engineering problem that aims at constraining interpretations towards those that are intended, producing engineering artefacts that can carry sIOP.

The most disconcerting consequences of a lack of (automated) sIOP are time-to-deliver, flat interoperability failures, and as seen above, seemingly correct but quite invalid data comprehension that leads to faulty system behaviour. Current sIOP implementations are essentially based on the (time-consuming) process of establishing a shared convention on the semantics of the data that are exchanged, and require custom software solutions and collaboration-dependent software adaptations. Indeed, such conventions result in a pleasant semantic homogeneity, but also in huge semantic monoliths that resolve some but far from all interoperability problems [@Renner1996]. And it makes dealing with data that originated outside the monolith impossible, unless again a time consuming (months) semantic adoption process is applied. Moreover, these semantic conventions consider semantic heterogeneity a bug instead of a feature necessary to allow for different but equally valid perspectives as well as to achieve semantic accuracy. Nevertheless, this conventions-based approach towards sIOP is considered accepted folklore, even state of the art in ICT, e.g., [@Otto2019]. In view of the large uptake of the Internet, the Internet of Things (IoT), cloud computing and big data, and in view of economical pressure to intensify enterprise collaboration, we consider this approach insufficient. Automation is required to resolve these issues, and we place formal semantics at its core.

The main objective of our work is to achieve sIOP as quickly as possible, with as minimal human effort as possible, for collaborations that had not been foreseen and consequently could not be anticipated for during design time of the (two or more) software agents. Semantic heterogeneity must be allowed for, semantic scalability must become possible. We categorise our work in terms of the Framework for Enterprise Interoperability (FEI) [@Chen2017] as addressing the *conceptual* barrier, investigating the *data* and *process* concerns, and applying a *federated* approach.

In comparison, system scalability was a big architectural concern in the past, requiring custom solutions as well. In response to this concern, scalability was standardised in the form of architectural patterns, and finally totally embedded and hidden into the infrastructure. Similarly, sIOP can be considered the architectural concern of this decade. We first need to provide standardised solution patterns that address sIOP concerns before we can embed it in a technological infrastructure. Only then we can claim that sIOP becomes transparent to the developer, and only then we can take down the tight coupling between semantics and the syntax of the shared data scheme. Where system scalability resulted in a huge increase in performance-demanding applications against a fraction of the original costs and effort, business agility will emerge once their semantics are accessible and semantic services exist at the infrastructural level to address them. Then sIOP becomes an access-and-play operation that can be achieved in due time with data not anticipated for during software design, and at any point in their life cycle. Metaphorically speaking, we consider sIOP a bridge overarching a semantic gap: with *anchorages* (local, tangible semantics according to [@Brandt2021a]) on each side of the gap, with a *spanning* (semantic alignments) resting on them to structurally (semantically) support the interoperability bridge, and with a *roadway* (syntactic transcriptions) enabling the crossing of the (data) traffic. Finally, architectural *principles* provide the necessary guidance to the architect for the various design decisions that effectively result in a particular bridge over a particular semantic gap. This has been depicted in \cref{fig:semantic-concerns}.
\begin{figure}
  \centering
  \begin{subfigure}[b]{.75\textwidth}
    \centering
    \includegraphics[width=\textwidth]{src/images/3SemanticConcerns.png}
    \caption{}
    \label{fig:concernsa}
  \end{subfigure}
  \hfill
  \begin{subfigure}[b]{.15\textwidth}
    \centering
    \includegraphics[width=\textwidth]{src/images/3ConcernsLegend.png}
    \caption{}
    \label{fig:concernsb}
  \end{subfigure}
  \caption{Conceptual overview of the relationships in sIOP between the anchorage (conceptual modelling), its spanning 
(semantic reconciliation) and roadway (semantic mediation), (a), and a legend explaining the used constructs (b).}
  \label{fig:semantic-concerns}
\end{figure}
Our contributions to consolidating semantic interoperability in software architectures are fivefold, represented as architectural principles and concerns as follows:

* Semantic concerns (anchorage): We summarize our work in [@Brandt2021a] on how to achieve a semantic anchorage by abstracting semantics from a tacit software implication into a tangible, computational and distinct artifact. This creates the potential to connect to it, to make comparisons with the semantic artifact of the peer software agent. We then formulate the principle of assuming responsibility on the semantics on data, and conclude what preparations about semantics are required for an agent before being able to engage in semantic interoperability (\cref{anchorage-semantic-concerns});
* sIOP concerns (spanning): Since computers remain incapable of true understanding, sIOP remains in demand of human intervention in order to reconcile the semantic differences between collaborating software agents. However, human intervention is time consuming. We reduce the necessary human intervention to complement formal semantics to a task that suffices to achieve sIOP, viz authoring semantic alignments only (\cref{spanning-siop-concerns});
* Mediation concerns (roadway): We determine the demands for a generic component that allows for communication with the peer agent in one's native vocabulary only, by considering both ontological models and the alignment. Such approach applies the principle *connectivity without dependency* at the semantic level. This consolidates the agent's potential to collaborate to any unforeseen applications without the need to adopt external semantic definitions, and remain scalable in the process (\cref{roadway-mediation-concerns});
* *Evaluation of semantic principles*: In order to consistently address the above concerns, their founding architectural principles have been derived. It is a matter of architectural hygiene to evaluate how these principles support and consolidate the fundamental architectural demands about loose coupling and separation of concerns (notably semantic and communication concerns). We show how the necessary characteristics of semantics, i.e., semantic heterogeneity, semantic evolution and semantic scalability, are supplied by them (\cref{evaluation-of-siop-principles});
* ISO42010 Architecture Viewpoint: We verify the applicability of the above concerns and principles by formulating their architectural consequences as a specific ISO42010 sIOP Viewpoint that must consolidate their proper position in the total architecture as corresponding sIOP view. As ISO42010 is considered a set of best practises for architecture description, and therefore is used with architecture frameworks such as MoDAF, TOGAF, DoDAF, RM-ODP and more, we conclude that application of this sIOP Viewpoint to formulate the sIOP View can be considered to consolidate sIOP for contemporary architectural paradigms (\cref{iso42010-viewpoint-on-siop}).

The European Interoperability Framework (EIF)[@EuropeanCommissionDGInformatics-ISA2Programme2017] and the European Interoperability Reference Architecture (EIRA) [@EuropeanCommissionDGInformatics-ISA2Programme2019] address sIOP and recommend the separation of syntactical from semantic concerns. Indeed, a valid recommendation that we support. In itself, though, it renders insufficient as to the practice of how to achieve suchseparation. In this article, in conjunction with our previous article on software semantics [@Brandt2021a], we describe our proposal on achieving EIF's and EIRA's recommendation by turning semiotic fundamentals into architectural principles from which loosely coupled formal semantics emerge. We show how these principles can be consolidated in contemporary architectural paradigms. It is our intention with this paper to open the discussion on how to surface domain-independent and standard semantic services and API's that can be adopted to become embedded into the communication infrastructure. 

In \cref{anchorage-semantic-concerns,spanning-siop-concerns,roadway-mediation-concerns,evaluation-of-siop-principles} we derive ## Design Principles (DPs) to consolidate the three architectural concerns. We define them collectively as \cref{tab:dps} at the end of the paper, following the structure in [@Greefhorst2011].

<!-- Page additions -->

[^1]: as mentioned by Wikipedia, https://en.wikipedia.org/wiki/Casualties_of_the_September_11_attacks, accessed Dec 13, 2018



# Anchorage: Semantic concerns #

"The successful standardisation of protocols made us believe that we should also *standardise meaning* on the Web. This is a fundamental *misconception*." [@Janowicz:2013ui]. This believe can be witnessed by the many initiatives taken by standards developing organisations (SDO) to develop a myriad on data standards, from e.g., *Tradelens* in Transport & Logistics domain and *International Financial Reporting Standards* in Finance & Accounting to, e.g., *ICEN/EN 13606*, *SO/TC 215*, and *ISO/HL7 21731* in the Electronic Health Records domain and the *smartM2M* standard by the IoT European Platform Initiative [@ETSI2019], to name a few. This current viewpoint on semantics defies semantic heterogeneity and enforce semantic homogeneity: one single agreed domain convention on how the syntactic representation and structure of the data or messages shall be semantically interpreted. Indeed, semantics are a particular representation of some part of the world, viewed from a particular perspective of use, however, we don't acknowledge that the *particular* representation and *particular* perspective that the data standard enforces is universally shared by the domain users. And equally important, any particular perspective is just one out of many equally legitimate ones that our software are deemed to consider over the software's lifecycle. Some examples are given in \cref{tab:perspectives}.

-------------------------------------------------------------------------------------------------------------------
Reality to refer to          Perspective #1      Perspective #2       Perspective #3        ...  Perspective #n              
---------------------------- ------------------- -------------------- -------------------- ----- ------------------
Waves are                    *objects* that      *forces* exerted on  an *accumulation* of  ...  a *relation*      
                             I can point at      dikes, walls or      other waves                between water, 
                                                 oil rigs                                        current, wind and
                                                                                                 the seabed

$\;$

How many terrorist attacks   1, the number       2, the number        4, the number         ...  2996, the
can be counted on 9/11?      of involved         of collapsed         of involved                number of
                             terrorist groups    towers               aircraft                   casualties[^1] 

-------------------------------------------------------------------------------------------------------------------

   : Semantics follow many alternative but equally legitimate points of view on reality, implying that no single one true abstraction exists. Hence, semantic heterogeneity is a feature that should be preserved, as opposed to a bug that should be sought to correct. \label{tab:perspectives}

We consider semantic homogeneity only a solution for small scale domains, i.e., with a handfull of actors, and for a short lifespan. For larger domains and/or longer lifespans, it is not only an illusion, but striving for homogeneity brings about several important disadvantages: (i) implementation of semantic standards involves considerable expenses, and tends to solidify in software by implicit operations on data that are expensive to change, slowly setting the standard in stone; (ii) since semantic standards fix representation, semantics become conflated with syntax, making the semantic standard susceptible to variations in syntax that occur with increasing stakeholders or with contextual evolution over time; (iii) conflating semantics and syntax create dependencies of the semantic standard with the architectural paradigm, its particular implementation or applied technology; (iv) the previous three issues bring about a high impedance for the standard to change and to evolve; and they create a significant barrier (v) for new business opportunities, (vi) obstructing business agility, and (vii) disable a level playing field for newcomers that have to invest hugely to adopt the standard and reap its benefits. Essentially, it is sheer impossible to create for each particular domain, or part thereof, a semantic standard; even in the highly protocolised health domain that already addressed semantics in 1987 [@Spronk2014], adoption of its standards remains slow and cumbersome [REF]. This becomes all the more clear when comparing with the successful adoption of 2G GSM telecommunication standard, including its evolution to 2.5G, 3G, 3.5G, 4G and 5G standards during roughly the same era. Finally, these issues only worsen when extending sIOP to support inter-domain interoperability.

We formulate the first (semantic) concern on sIOP:

* *concern 1*: Acknowledge semantic heterogeneity as point of departure when establishing sIOP.

This immediately leads to the definition of \cref{dp:shf} in \cref{tab:dps} to its effect. We do not imply with this principle to abandon each and every use of semantic homogeneity. We consider shared semantic homogeneity a useful element to achieve sIOP. However, the principle encourages to not *assume* semantic homogeneity a necessary condition nor a point of departure when engineering sIOP.

It is clear that sIOP encompasses a communication between at least two agents. Communication between human agents brings about a natural responsibility for both, described by [@Grice:1991BT] in four *maxims* as the particular purpose of communication. We consider these maxims as relevant for software agents as for human agents, viz to serve:

1. Quantity: Make your contributions as informative as is required (for the current purpose of the exchange), and not more than is required;
2. Quality: Do not say what you believe to be false, or for which you lack evidence;
3. Relation: Be relevant (to the immediate needs);
4. Manner: Avoid obscurity of expression, ambiguity, and be brief and orderly.

Since we here talk about *semantic* interoperability, we first need to establish what is meant with semantics in software. With semantics, we refer to real world semantics, RWS for short, and we summarise our position towards semantics in software from [@Brandt2021a] as follows:

* Since software is incapable of genuine understanding, real world semantics cannot exist in software. Nevertheless, the software agent acts as transport medium for RWS between users. 
* The reciprocity between processing code and data does manifest itself to users as RWS. 
* Based on [@Grice:1991BT], we discern *semantic meaning*, i.e., what is said and carried by data, and the *pragmatic meaning*, i.e., to connect with our frame of reference and its context of use, implementing comprehension as an inference process from the semantic meaning. 
* The nature of software dictates that data and data processing code are always intimately connected, and since their reciprocity emerges as software behaviour, software malfunction originates (amongst others) from a broken reciprocity, i.e., inconsistencies between data and their processing code. Any incoherent reciprocity equates to unfaithfulness, viz semantics that are considered invalid in the application domain. 
* The Domain Model (DM), composed as the combination of the Semantic model (SM), representing the semantic meaning, with the Pragmatic Model (PM), representing the pragmatic meaning, provides the software agent with the level of comprehension necessary to decide upon its behaviour under the current state of affairs. 
* The central disposition of reciprocity in software semantics emerges as an *Atomic Semantic Monolith* (ASM) required for data comprehension: being a *semantic monolith* refers to the tight coupling between data and their processing code, which, together, describe the state of affairs in the application domain; Atomicity refers to the level of granularity at which the entity that is referred to by the data token is considered a non-dividable whole in the application domain. 

Based on this perspective on software semantics, we formulate the second (semantic) concern on sIOP and its elaboration in two subconcerns:

* *concern 2*: It is a natural responsibility for software agents that engage in collaboration to adhere to Grice's four maxims above
  * *concern 2.1*: explicitly representing the semantics of their data in their DM (maxims 1 and 4);
  * *concern 2.2*: ensuring the validity and accuracy of one's data and related semantics (maxim 2).

>Note: Maxim 3 relates at the one hand to the software agents' interoperation itself as opposed to the semantic concern of one of them; this will be addressed in \cref{spanning-siop-concerns}. At the other hand, maxim 3 relates to the purpose that the software agent is to achieve. Since we assume that any received data refers to the (possibly changed) SoA in the shared DoA, hence, relevance to the software agent is a matter of fact. 

Concern 2.1 immediately leads to the definition of \cref{dp:rfsm} to its effect.

Elaborating on concern 2.2: In [@Brandt2021a] we have identified that each modelling language carries its own ontological commitment, i.e., the differences that the language constructs characterise represent a commitment to what the language commits to about what exists in reality. The choice of modelling language, therefore, has major impact on the (accuracy of the) semantics that are modelled. This semantic concern is therefore influenced by the ontological commitment. We introduce a definition on *semantic compatibility* to its end. Merriam-Webster defines *compatibility* as "being a computer designed to operate in the same manner and use the same software as another computer"[^compatibility]. This leads to the following definition:

\begin{mmdef}[semantic compatibility]\label{def:semantic-compatibility}
Semantic compatibility reflects that a software agent is designed to interpretate data according to the same semantic principles, distinctions and rules, viz use the same ontological commitment, as another software agent. 
\end{mmdef}

We formulate \cref{dp:scp} in order to defend that it should be possible to investigate whether semantic compatibility exists before assessing the validity and applicability of the semantic meaning that is carried by data.

Where it is the objective of semantics to maximise and maintain the coherence of the ASM, it is the objective of sIOP to address this monolithic nature of the ASM, as we do in the next section.


<!-- page additions -->

[^compatibility]: Merriam-Webster, https://www.merriam-webster.com/dictionary/compatibility, accessed Jan 2021


# Spanning: sIOP concerns #

The FAIR data principles (Findability, Accessibility, Interoperability and Reuse)[^fair] describe "machine-actionable states" that "*enable the agent (...) to have the capacity, when faced with a digital object never encountered before, to: a) identify the type of object (with respect to both structure and intent), b) determine if it is useful within the context of the agent's current task (...), c) determine if it is usable, with respect to license, consent, or other accessibility or use constraints, and d) take appropriate action, in much the same manner that a human would. (...) [The] ultimate machine-actionability occurs when a machine can make a useful decision regarding data that it has not encountered before.*" [@Wilkinson2016]. These states resonate with our view on sIOP, although we consider state (c) out of scope for sIOP. We consider state (d) not a matter of sIOP per sé but one that addresses the design of a single software agent, which has already been addressed in [@Brandt2021a, DP 2] where we have made a clear separation between semantic comprehension at the one hand, and the behaviour of the software agent that is based on that comprehension at the other. Having scoped the FAIR principles in this way, the main concern for sIOP, then, is to identify the type of object that the exchanged data belongs to, position its values in the proper value space, and derive the conclusions based upon which the DSC will act. 

++++

Maxim 3 relates at the one hand to the software agents' interoperation itself as opposed to the semantic concern of one of them; this will be addressed

++++

From this, we establish the sIOP concerns in the first subsection, and address them in two subsequent subsections.

<!-- page additions -->

[^fair]: FAIR Principles, https://www.go-fair.org/fair-principles/, accessed Jan 2021
[^Answer]: \rotatebox{180}{Communicating the semantic monolith, although possible, results in a too narrow solution towards sIOP because this would require each agent to have an exactly equal perspective on reality. Although possible, this will rarely be the case.}


## Determination of sIOP concerns ##

Semantic interoperability is about at least two software agents, in their roles as DSP and DSC, that share a particular DoA and exchange data that represent a certain SoA in their shared reality. Subsequent to the exchange, the data will be processed by the receiving DSC. It stands to reason that understanding the data precedes their faithful use, which is supported by FAIR's state (a). However, we insist that comprehension in software is necessarily reduced to the reciprocity that exists between semantic meaning (data) and their pragmatic meaning (processing code) in the atomic semantic monolith. Moreover, the ASM has been established with the explicit purpose to guarantee the coherence between the data and their processing code [@Brandt2021a]. By exchanging data, the represented semantic meaning are necessarily separated from the ASM they belong to. (Why it is useless to exchange the complete semantic monolith in order to establish sIOP, is left as an exercises to the reader [^Answer].) The consequence on state (a) of exchanging the semantic meaning (data) only, therefore, is twofold: it loses its coherence with its original pragmatic meaning, and, the necessity emerges for establishing a new reciprocity with the pragmatic meaning that belongs to the DSC. Unless it can be guaranteed that the new reciprocity emerges as coherent as it needs to be, it's impossible to establish sIOP without emergence of phantom semantics. We repeat our definition on semantic coherence from [Brandt21a]:

\begin{mmdef}[Semantic coherence]\label{def:semantic-coherence}
Semantic coherence builds on the consistency with which the [semantic and pragmatic meanings] (...) commit to the same distinctions in their shared reality, and only require each other's knowledge in executing their reciprocity. 
\end{mmdef}  

With this in mind, we reformulate state (a) as our third concern about sIOP:

* *concern 3*: subsequent to data exchange, the DSC must have the capability to re-establish semantic coherence between the external (DSP's) semantic meaning and its own internal pragmatic meaning, and assure that the reciprocity between DSP's data and DSC's processing code remains truthful to the state of affairs in reality.

>Note: Although they share the same semantic meaning, the resulting semantic monolith of the DSC must be allowed to differ from the DSP's semantic monolith. For example, by exchanging a heartbeat both agents share the semantic meaning about the number of beats per second, however the pragmatic meaning can vary between an indication of health for an health-care application and an indication of performance potential in a sports application, with different pragmatic demands, e.g., resolution and accuracy. 

We discern the following subconcerns:

* *concern 3.1*: Re-establishing semantic coherence by the DSC applies to both the data it receives from the DSP as to the data that the DSC can infer from them;
* *concern 3.2*: Pursuing sIOP involves to ensure that the ASM's from both agents remain independent from each other, viz establishing a semantical loose coupling between both agents;
* *concern 3.3*: The human-in-the-loop remains a necessary condition for sIOP to reconcile semantic differences. Hence, the concern is achieving her most optimal position in architecture;
* *concern 3.4*: The primary concern to re-establish coherence with DSP's data is considered a recurring task when sIOP is to allow for semantic evolution which demands for continued maintainability and governance of sIOP;

Additionally, accepting semantic heterogeneity brings about an issue of scalability, since semantics won't be centrally coordinated anymore resulting in semantic definitions that are distributed all over the place, see \cref{dp:shf}. 

\begin{mmdef}[Semantic scalability]\label{def:semantic-scalability}
Semantic scalability is the capability of a system of collaborating actors to adopt and/or consolidate, with acceptable lead time and costs, increasing perspectives on -or more complex semantic heterogeneity about- their shared reality without compromising sIOP between any interacting software agents. 
\end{mmdef}  


We formulate this as the fourth concern about sIOP:

* *concern 4*: sIOP requires to allow for scalable semantics.

We conclude that from these concerns, only 3.1 (re-establish coherence) and 3.3 (reconcile semantics) are concerned with genuine understanding of real-world semantics and calls for a human-in-the-loop. The others are equally important in order to achieve sIOP, however, "only" refer to engineering challenges. We address concerns 3.1 and 3.3 in the next section, and then investigate the consequences of concerns 3.2, 3.3 and 4 in its subsequent section.   



## Positioning the human-in-the-loop ##

Access-and-play sIOP is the ultimate objective: ideally, sIOP between agents can be achieved instantaneously, particularly for unforeseen collaborations and without human intervention. Despite its conflict with our position, its business benefits are too significant not to continue to strive for it. Still, we maintain the position that computers lack the capability for genuine comprehension. Hence, to position the human-in-the-loop in the sIOP architecture is a necessary condition for understanding the semantic differences between the interoperating agents. 

This human is required for concern 3.1: re-establishing reciprocity. The two possible approaches for this task are, (i) to modify the own pragmatic meaning such that it can operate in a valid way on the external semantic meaning, or (ii) to modify the external semantic meaning such that it can be operated on by the existing pragmatic meaning in a manner faithful to the current state of affairs. The first approach allows external definitions to influence internal workings. This clearly breaks one of the fundamental principles of software engineering, *low coupling, high cohesion* [e.g., @Hitz1995], and should be considered a last resort. The second approach respects this fundamental principle, but assumes the semantic variations to be resolvable. We elaborate on this approach from the perspective of the software agent with a DSC role. The task is twofold: to convert the representation of the semantic meaning as provided by the DSP such that it becomes syntactically identical to the representation of the same semantic meaning as applied by the DSC. A prerequisite to this task is that DSP's ASM refers to a SoA that can be addressed by DSC's ASM when processing the received data. 

In order to achieve that, we first assume that the quality of DSC software agent is such that the internal semantic meaning is in coherence with its internal pragmatic meaning, i.e., that its concerning ASM is faithful to reality over the complete range of the internal semantic meaning, viz the data values that it is designed to process. Now assume that the semantic meaning that the DSP software agent is to exchange, is equivalent to some semantic meaning that is in scope with the DSC software agent. By virtue of the coherence that is in place with the DSC software agent, the reciprocity between the external semantic meaning with the internal pragmatic meaning can be guaranteed to be re-established since there is no semantic difference with the internal semantic meaning. The only difference to overcome is the differences in representation between the external and internal semantics meanings. This can be achieved by a transcription process that can be generic and only requires a specification of how the external semantic meaning relates to what internal semantic meaning. This specification is known as a semantic alignment. 

Unfortunately, we cannot assume full equivalence between the semantic meanings of the DSP and the DSC. Indeed, many variations in semantic meaning can exist. However, there is no reason to assume the existence of semantic variations for which no alignments can be specified. We reflect this with \cref{dp:alignment}.

A *correspondence* specifies as accurately as possible the semantic differences that exists between a pair of related concepts, i.e., it aligns between the semantic meanings of interoperating agents. By exhaustively addressing all semantic differences that exist between both agents, the set of correspondences collectively specify the *alignment* that holds between two agents. The purpose of the alignment is to establish how the truth of expressions that are formulated in terms of agent A, can be established by using formulations in terms of agent A', and to capture their potential difference as a relation. To that end we differentiate between two categories of semantic differences:

1. *Conceptual differences*: variations that can be specified as logical relation between (constructions of) concepts from both ontologies, e.g., naming conventions or variations in structure; 
1. *Value differences*: variations in conventions on how to represent values with or without magnitudes, e.g., differences in value scales, units of measure or nominal properties.

The language used to specify the correspondences must be expressive enough to identify the atomic elements of the ontologies, to combine them into logical combinations as well as to formulate the relationship that holds between them. In [@Euzenat2007;@Scharffe2011], an investigation has been reported towards the requirements for such an alignment language, summarised as follows. A *correspondence* denotes a single particular inter-ontological relation, prescribed, and assumed to represent a semantically valid relation between both concepts, as: 
\begin{equation*}\label{eq:correspondence}
\mu = \tuple{ e, e', \theta }
\end{equation*}
with:

* $\theta \in \set{=, \sqsubset, \sqsupset, \disj, \overlap }$ specifying the *correspondence relation* that holds between entity constructions from the source, $e$, and the target, $e'$. The basic correspondence relations denote $=$: semantic equivalence, $\sqsubset$: subsumption of, $\sqsupset$: subsumes, $\disj$: disjointness, and $\overlap$: overlap. Although more relations can be required to include for a particular use case, such does not invalidate the general principle. Further note the correspondence relation is a directed relationship. 
* The source and target *entity constructions*, $e$, are build on the atomic elements of the ontology language. An entity construction connects concepts by applying:
    * conceptual connectors:
        * logical connectors \token{AND}, \token{OR}, and \token{NOT};
        * a path connector as a sequence of zero or more Object Relations, \token{R}, optionally ending with an Object Property \token{P}, summarised as follows: \token{R^*\[P\]};
        * property construction operators (inverse, composition, reflexive, transitive and symmetric closures);
        * constraints (through domain, range, cardinality and value restrictions);
    * value functions:
        * mathematical calculations for, e.g., unit conversion, operating on one or more values having a magnitude in order to arrive on a value that fits the dimension(s) of use by the pragmatic meaning of the receiving agent;
        * transcriptors operating on one or more nominal values without magnitude, viz codes that identify or categorise a certain domain aspect, e.g., ISO3166-alpha2 two-letter codes that specify a particular country, or the blood type.

Without the conceptual connectors it is only possible to address a single concept or individual as defined by the ontology, representing an aggregation level that is relevant for the software agent but might not be relevant in terms of the interoperating agent, and hence, for their mutual sIOP. By application of conceptual connectors the architecture gains the capability to address a specific compound of individuals in either the source or target ontology that relate to the semantic difference at hand. Similarly, with the application of value functions, the architecture gains the capability to specify transformations between conventions on value representations and nominal properties.

Current solutions that standardise semantic solidify the understanding in the syntax of the data. In this way, semantics are carried by a data schema that is primarily designed to serialise data and to support data transfer by message construction and exchange. We consider this a significant neglect of the principle on separation of concerns, conflating the semantic interoperability concerns with the data communication concerns. The consequence of conflating these concerns is that source code which should concerned primarily with message construction, parsing, storage, and other data communication related tasks, becomes dependent on how semantics influence the syntax. In a message-oriented paradigm, for instance, any difference in structure in order to reflect the local perspective on semantic structure will have a significant impact on how to (de)compose the message. And any new data source to connect to will proliferate into a new software release. We thus observe that the current approach to data understanding results in an architecture which imposes a significant complication on interoperability (and other -ilities as well), impeding access-and-play. And despite the current limitations of AI-software to genuinely understand, a significant gain towards the software agent's access-and-play capabilities can be achieved by untangling the syntax and semantics through separation of the sIOP concerns from the data communication concerns. We propose \cref{dp:ssoc} to its effect.

Current sIOP practises already require humans-in-the-loop to reconcile the semantic differences that occur. Often, the subject of reconciliation is the differences in data schemata, and the result of the reconciliation is laid down as a canonical data model. By applying semantic reconciliation on the conceptual level, the dependency on the (data) syntax, and vice-versa, is minimised. Moreover, by representing the result of the reconciliation as an alignment (between ontologies) as opposed to a canonical semantic model (core ontology), the influence of the peer agent's semantics on one's own semantics is minimised as well. An alignment, thus, functions as an interface that enforces loosely coupled semantics by enabling semantic transparency between communicating peers. Reducing the human-in-the-loop to author an alignment only, (i) accelerates the deployment of sIOP by removing all human effort that is concerned with implementation activities, and (ii) decouples the sIOP scope to bilateral alignments only. This process has been depicted in \cref{fig:dt-reconciliation}.

![Semantic reconciliation results in an alignment between the semantic representations of two ontologies. We defend that semantic reconciliation is a computer-aided but ultimately human-authored task.][def:DTReconciliation]


++++++

Furthermore, the three FAIR principles that have been defined in relation to data being interoperable, are:

I1. (meta)data use a formal, accessible, shared, and broadly applicable language for knowledge representation:
    meaning that data should be readable for machines without the need for specialised or ad hoc algorithms, translators, or mappings. 
I2. (meta)data use vocabularies that follow FAIR principles
I3. (meta)data include qualified references to other (meta)data 

<!-- page additions -->
[def:DTReconciliation]: src\images\DesignTimeReconciliation.png {#fig:dt-reconciliation width=25%} 



## sIOP engineering principles ##

Address concerns 3.2, 3.3 and 4

* *concern 3*: subsequent to data exchange, the DSC must have the capability to re-establish coherence between the external (DSP's) semantic meaning and its own internal pragmatic meaning, and assure that the reciprocity between DSP's data and DSC's code remains truthful to the state of affairs in reality.



* *concern 3.2*: Pursuing sIOP involves to ensure that the ASM's from both agents remain independent from each other, viz establishing a semantical loose coupling between both agents;
* *concern 3.3*: Access-and-play sIOP is the ultimate objective: ideally, sIOP between agents can be achieved instantaneously, also for unforeseen collaborations. Despite its conflict with our position that software is incapable of genuine understanding, turning a human-in-the-loop a necessary condition for sIOP, its business benefits are too significant not to continue to strive for it;

concern 4 : sIOP requires to allow for scalable semantics.

# Roadway: Mediation concerns #

The mediation pattern has already been described in [@Gamma1994], albeit in the context of object-orientation as opposed to sIOP. It is described as "an object that encapsulates how a set of objects interact", and it promotes loose coupling "by keeping objects from referring to each other explicitly" and enables to "vary their interaction independently". In this way, the mediator turns a many-to-many interaction into a many-to-one interaction, each of which is easier to understand, maintain and evolve. The fundamental idea behind the pattern, viz trading the complexity of the interactions with the complexity in the mediator, can also be applied on a semantic level, and we formulate \cref{dp:mediation} to its effect.

In this reading a mediator encapsulates how a pair of agents represent their semantic meaning and provides for a generic transcription logic to mediate between native semantic representations. However, one paramount issue must be resolved by the transcription logic of the mediator, as follows.

![Semantic mediation encapsulates how agents exchange semantic meaning. It implements a generic transcription service between the particular representations of data between both agents. It depends only on the representations of the semantic meaning from both agents (ontologies) and the alignment that holds between them.][def:RTMediation]

We have seen in the previous sections that a correspondence assures the semantic validity between the different semantic meanings of both agents. It can do so by token of the broad correspondence relations that can be specified, both for the conceptual and the value differences that may exist between them. Unfortunately, this is in shear contrast with the fact that a transcription can only replace one term for another, which basically implies that an equivalence relation holds between both terms. As can be seen from the correspondence relation, this is not necessarily true. In [@Brandt2018b], we make a distinction between a naive transcription, which ignores this inconsistency, and a semantic valid transcription that can establish under what conditions this inconsistency does not yield phantom semantics. We show that these conditions rely on logical constructs only and, consequently, are independent on the actual ontologies that apply. We have formulated these logical constructs as rules that generically apply for any transcription. Unfortunately, a set of conditions remain for which a semantic valid transcription cannot be guaranteed, either due to an incomplete alignment or to (onto)logical incorrect correspondences. It follows that a semantic mediation service must provide for options about the resolution for these remaining issues. We suggest at least the following options: Firstly, as run-time options we consider (i) a means to fall-back to the application of naive transcriptions and continue the data exchange, or (ii) to raise a Transcription Error and refrain from data exchange. Both represent necessary service implementations that might satisfy scenarios that have either less or more stringent semantic demands. Secondly, as design-time option, it serves as a necessary tool to generate an exhaustive list of shortcomings of the transcription as a result of the current ontologies and alignment. Such list will provide the semantics engineer with sufficient information to adapt the alignment, or introduce modifications to one or both of the semantic anchorages in order to remove transcription issues that are considered vital to the business. Finally, the third option is to try to resolve the transcription issue by starting a dialogue-based semantic reconciliation process in run-time with the aim to improve upon the shortcomings of the current alignment. Despite our insistence on the need for a human to author the genuine understanding, it might still be worthwhile to have the system meticulously, consistently and methodologically negotiate logical and ontological constructs in order to find additional correspondences [@Diggelen:2007vd].


<!-- page additions -->
[def:RTMediation]: src\images\RunTimeMediation.png {#fig:rt-mediation width=75%} 


# Evaluation of sIOP principles #

The main (business) requirement is to achieve sIOP as quickly as possible, with as minimal effort as possible, for collaborations that had not been foreseen and consequently could not be anticipated for during design time of the (two or more) software agents. We have introduced some new principles to its support in the previous sections, and now evaluate their consequences on the objectives as elaborated in \cref{objectives-of-semantic-interoperability}, particularly those that refer to the engineering challenges: two (loose coupling at semantic level), three (allow for semantic heterogeneity), five (support to semantic evolution) and six (scalable semantics).

## Loosely coupled semantics ##

Consolidating sIOP demands the emergence of *loosely coupled semantics*. As analogy, consider a vehicle with its cargo. Logistics rely on external transfer services that allow the cargo to be transported over different vehicles, from a truck into an aircraft into ship into a truck again, without ruining the cargo. This requires the cargo to be firmly connected to the vehicle, but at the same time to be completely independent from any particular vehicle in order to complete the transport. "Connected but as independent as possible", also known as loosely coupled, is a need for sIOP as well. When software agents interact they exchange meaning. Loosely coupled semantics implies that the semantic meaning (the cargo) remains as independent from the representation of semantics (the vehicle) as possible. Similarly to logistics, sIOP should rely on infrastructural services that can transcribe the semantic representation from its native form into a foreign form without invalidating the semantics that it bears. Loose coupling is known as a strong characteristic which brings many advantages. This applies to its semantic variety as well: agents can now communicate in their own native representations without the need to learn or integrate foreign representations; define semantics once and achieve sIOP many times with many different peers; development of the agents' semantic representations can be locally isolated to fit their particular domain and application; and it enables local re-use which on its turn increases its quality.

Loose coupling in the classical sense is realised through the principles of separation of concerns and transparency. In its original reading separation of concerns turns complex functionalities into simple, atomic and complementary functional capabilities. In a semantic reading separation of concerns is not about maintaining complementary semantics; in fact, the domain of interest of the agents are required to overlap, since interoperation would be completely useless otherwise. Instead, semantic separation of concerns refer to enforce an explicit division between syntax and semantics, as discussed in \cref{explicit-siop-by-alignment}. Additionally, it refers to keeping each other's representations of the semantic meaning strictly separated. We described how this can be achieved in \cref{roadway-mediation}. The classical results of applying the principle is the emergence of unique functions that are implemented only once and used many times. In its semantic application this results in every software agent to maintain its own semantics. Collectively, all agents make that semantics become distributed all over the place which seems counterintuitive or even plain wrong. We come back to that intuition when we talk about scalability, \cref{scalable-siop}, but we can already see that this is an indirect consequence of the demand to enable sIOP with agents that were not anticipated for during software design; this, on its turn, requires that independent development of semantics shall be possible without disabling sIOP.

The classical reading on transparency separates access to the unique functions from the particular design and implementation of the functions. Remaining agnostic to *how* its function are achieved makes it possible to communicate with minimal mutual dependency. Semantic transparency, or terminology transparency, remains agnostic to how semantics are *represented*, which makes it possible to communicate with minimal syntactic dependency and without prior mutual agreements on semantic representation. In its classical reading, transparency requires the introduction of standards in the components' API. Semantic transparency, contradictory, requires the total absence of any standard on representation. In stead, semantic transparency, too, requires to separate semantics from syntax. Furthermore, a need emerges for a semantic oracle that knows how to align distinct representations and to translate between them accordingly. The latter has already been discussed in \cref{roadway-mediation} while the former is directly related to the human-in-the-loop as authoring authority as discussed in \cref{spanning-semantic-interoperability}.

From the above discussion we draw the conclusion that all demands necessary to allow for semantic separation of concerns and semantic transparency are met by the sIOP principles \cref{dp:ssoc,dp:alignment,dp:mediation}. Therefore, loosely coupled semantics should emerge between agents that comply to these principles. 



## Semantic heterogeneity ##

We have already determined that the principle to align semantics as opposed to data schemata, \cref{dp:ssoc}, breaks the conflation of semantics and syntax, enabling to consider semantics on its own terms^[Pun not intended]. Abstaining from a canonical model by introducing a semantic alignment between pairs of semantic meanings, \cref{dp:alignment} introduces the capability for each agent to develop its semantic representation in a way that fits its local perspective optimally. By also encapsulating the particular means to provide valid semantic transcriptions only and refrain from naive transcriptions between communicating agents, \cref{dp:mediation}, the necessary elements to support semantic heterogeneity are present.



## Semantic evolution ##

Consider an agent who's local semantics are in demand for a change. Assume that the agent has modified its internal pragmatic meaning to accommodate the evolved semantics. This implies a change in what we called the semantic anchorage, which acts as semantic interface to any sIOP concerns. The semantic change can be considered an altered or additional difference with the semantic anchorage from interoperating peer agents. In order to not destroy the sIOP that had been established before, it is necessary to reflect the new difference as modifications to the alignments that apply. By having performed the necessary modifications, and by relying on the semantic validity of the own ontology, the mediator is now capable of transcribing the data in accordance to the evolved semantics.

The consequence of allowing semantic heterogeneity is therefore a sufficient condition to also enable local semantic evolution and remaining semantic interoperable with existing counterparts in the process.



## Scalable sIOP ##

Many definitions exist to constrain the semantics of *scalability*, academic [e.g., @Neuman1994] and popular[^fn2] alike. Our summary refers to increasing the demand that is placed on a system, and/or adding resources to a system, without experiencing loss of performance or increase in management to an extent that defeats its primary objective. We consider scalable sIOP as the capability to allow for increase in number of communicating agents as well as in the level of semantic heterogeneity without degrading the agent's communication performance or its ability to manage and control the semantic differences with its interoperating peers. 

If we consider the agent's communicating performance degradation, we argue that since complexity of the connections have been traded with the complexity in the mediator (\cref{roadway-mediation}), the agent will only experience communication degradation when the mediator experiences transcription latencies that exceed communication parameters. In other words, the performance bottleneck is with the mediator, not with the agent. Transcription latency will result from the number of transcription requests that exceeds the capacity of a single mediator. No particular mechanism in a mediator impedes horizontal scaling to increase the collective processing capacity to match the transcription demands. 

Regarding the ability to manage and control the semantic differences with all interoperating peers, the root cause for potential alignment management issues are laid in the need to establish an alignment with each peer agent an agent collaborates with. This might become impractical due to our insistence on the need for a human-in-the-loop to author the alignment. We discern different solutions for different semantic topologies: 
 
i. Star alignments (core domain ontology, aligned to local ontologies) for relative stable and homogeneous domain semantics
    * Good: semantic governance remains controllable independent from the number of actors;
    * Bad: very big semantic monolith, hence, low agility in dynamic environments. Moreover, the more actors involved, the higher the need for semantic compromises, and the lower the overall semantic accuracy. 
i. Mesh alignments (bilateral alignments) for very dynamic and heterogeneous (domain) semantics, or low number of peers
    * Good: quickly established bilateral sIOP; granularity-on-demand, viz intricate where necessary, coarse-grained where possible;
    * Bad: semantic governance may become an issue to the level where it becomes impractical.
i. Mix-n-Match (coarse-grained star-alignment with intricate bilateral alignments as specialisations to the core domain ontology) for the 70% bulk
    * Good: controllable semantic governance; after central alignment, quickly established bilateral sIOP;
    * Bad: slightly more complicated mediation due to double alignment support.
i. Daisy-chained alignments (when A is aligned to B, and B is aligned to C, A and C are indirectly aligned as well)
    * Good: self-organised alignments emerge, and an instantaneous access-and-play becomes possible;
    * Bad: No guarantees can be given on the completeness of the indirect alignment. Furthermore, more intermediate alignments will increase the chance of impossible end-to-end transcriptions that would not occur with a direct alignment.

In conclusion, scalable sIOP can be guaranteed when considering the communication performance. With respect to the ability of a single agent to manage and control the number of alignments with increasing number of interoperating agents, several options exist to support scalable sIOP although ultimately no guarantees can be given. 
 


# ISO42010 viewpoint on sIOP  #

# Related work #

Discuss the following papers:

1. Pahl, C. (2007). Semantic model-driven architecting of service-based software systems. Information and Software Technology, 49(8), 838–850. https://doi.org/10.1016/J.INFSOF.2006.09.007 ---> Compare how they apply onto's for DM

1. Maybe discuss as agreement-based approach to sIOP: J.A. Mykkänen, M.P. Tuomainen, An evaluation and selection framework for interoperability standards, Information and Software Technology, Volume 50, Issue 3, 2008,Pages 176-197, ISSN 0950-5849, https://doi.org/10.1016/j.infsof.2006.12.001. (https://www.sciencedirect.com/science/article/pii/S0950584906001960)

Several works exist that focus on logical foundations of sIOP in search for automatic matching and merging of ontologies [@Euzenat:2013ie;@Benedikt2018a;@Scharffe2014], or for automatic detection and reconciliation of semantic inconsistencies between ontologies [@Fahad2012;@Diggelen:2007vd]. These works lay at the heart of ontology mediation, however, their embedding in the larger software environment is not addressed or only assumed at best. At the same time, several works exist that address the architectural foundations related to information analyses and interoperability, both in academic literature [@Karagiannis2006;@Raghupathi2008] and in industrial practices [@ObjectManagementGroupOMG2013]. Few literature exists on on the combination of foundations for architectural concerns and those for formal semantics, and these make use of ontological foundations to specify the semantics of the capabilities and resources of the architectural language as opposed to domain semantics [@Naudet2010;@Azevedo2015;@Carvalho2016]. 

The authors of [@Pagano2013a] present an abstract account of interoperability issues, research challenges and fundamental factors that apply in interoperability. In terms of these findings, our work can be considered on-topic, relevant, and in alignment with their research agenda. It distinguishes from theirs by addressing sIOP solutions to part of their broader and more abstract view on interoperability. 

In [@Horsch2020] the authors discuss the ongoing work on establishing a European Virtual Marketplace Framework, into which diverse platforms can be integrated. It addresses common challenges that arise when marketplace-level domain ontologies are combined with a top-level ontology like the European Materials and Modelling Ontology (EMMO) by ontology alignment. A multi-tier system of ontologies is established with the EMMO at the top and all others subsumed by it. The authors show that with such a setup the top-level ontology is crucial in the creation of the alignments between the (domain)ontologies that are subsumed by it. At the one hand this shows support to our conclusion that semantic compatibility can be considered foundational to semantic interoperability. At the other hand their particular approach is a centralised one that does not scale well in large distributed environments due to its dependency on one single ontological commitment. Moreover, the top-level ontology, here EMMO, necessarily conflates its function as ontological commitment with a function to construct alignments from. Although this is of great help to resolving the (automated) ontology matching problem, it creates a semantic monolith that extends to all communicating peers which, as we have seen in \cref{introduction}, impedes not only access-and-play sIOP but semantic scalability, evolvability, maintainability and other qualities as well. 

The automatic tabular document exchange (DocEx) framework proposed by \cite{Yang2017} divides semantic interoperability into two stages: *interpretation*, described as automatic unambiguous information understanding, and *employment*, understood as the capability to automatically operate on the information according to the interpreted semantics. The interpretation phase is dependent on a global vocabulary that "provides uniquely coded and unambiguous concepts across different domains". Essentially, this is a clear example of the *semantic standard fallacy* described by \cite{Janowicz:2013ui}: "The successful standardisation of protocols made us believe that we should also standardise meaning on the Web. This is a fundamental misconception", particularly since it defies semantic heterogeneity and different but equally legitimate perspectives on the same thing. The authors remind us of three limitations of the ontology alignment approach; firstly, it cannot guarantee complete semantic interoperability for situations where terms are not aligned; secondly, creating alignments are time consuming; thirdly, ontologies are often local and their point-to-point alignments limits the semantic consistency on a more global scheme. While we do not deny any of these we consider that (i) alignments exist to facilitate interoperability, hence, lacuna are to be (automatically) corrected; (ii) their creation, despite ontology matching algorithms and other automation, will take time but allow for local semantic qualities and independence that are impossible to achieve with a global semantic standard; (iii) local applications are not seeking for global interoperability but business network interoperability only. 

The DocEx framework can be considered a simplified version of the openEHR framework^[https://www.openehr.org/, accessed Jan 24, 2020] as introduced by \cite{Beale:2001vz}, further elaborated in [@Beale2007a;@Beale2008a;@Beale2007;@Beale2008;@Beale2007b;@Beale2007c] and incorporated into CEN 13606 as a European and ISO standard. Its founding key paradigm is to model generic knowledge apart from the specific information structures, and let the former constrain the latter: knowledge is expressed as "statements which say how instances of a reference model should be constrained to form a valid business entity of some kind". Those statements are embodied by *archetypes*. They introduce a Reference Model (RM) that can be semantically constrained by an Archetype Model (AM). The latter can be considered a meta-model or modelling language to express archetypes, i.e., a particular semantic model representing knowledge. The former is provided to each stakeholder as a unified software implementation ("the run-time platform"), providing invariant patterns of information structures. This separation makes what the RM is to the AM similar to what the JVM is to the java program. Any information item created by a user is registered as an instance of RM-specified invariant patterns. At the same time that information item is conforming to an archetype that expresses (constrains) its semantics in terms of the AM. Such approach follow \cref{dp:rfsm,dp:meoc} but the application of a central definition of archetypes maintain a tight coupling and thus defies semantic heterogeneity and truly independent semantic representations. 

The authors in [@Haller2005] propose the Web Service Execution Environment (WSMX) that enables the execution of Semantic Web Services based on a Web Service Modelling Ontology (WSMO), and consider it a reference implementation for WSMO. It is meant as a means for automated discovery, composition and execution of Web Services which are based on logical inference-mechanisms, and in this way similar to our objective. Another similarity is in their acceptance of semantic heterogeneity and the need for a generic data mediator to overcome semantic differences, thereby following \cref{dp:ssoc}. Despite these similarities, we consider two main differences with our approach. Firstly, the goals of WSMO are of another, broader, dimension than our goal to consolidate semantic interoperability and for which we have introduced details that are out of scope of WSMO. **_Secondly,_**

Recently the international data spaces (IDS) association^[https://www.internationaldataspaces.org/the-principles/#overview, accessed Jan 28, 2020] forms the basis for a data marketplace as a strategic link between the creation of data in the internet of things and applying this data in machine learning (ML) and artificial intelligence (AI) algorithms. The proposed architecture, [@Otto2019], is much alike the WSMX in the sense that a well-defined connector provides infrastructural services concerning security and trust, sovereignty, interoperability, ease of adoption and use, and more. In fact, if we conceive WSMX as an abstracted version of Web Services with a particular attention to semantics, IDS can be conceived as an abstracted version of the REST framework that considers data resources (spaces) the central assets in an ecosystem. IDS puts a particular attention to technology transparency when it comes to asset discovery and disclosure, identity, their secure, managed and accountable use, and interoperability. IDS considers data as assets, and provides many if not all necessary components for its managed exchange. Contrarily, we observe a clear absence of any considerations similar to those we bring forward in this paper towards the consolidation of sIOP. Still, and like WSMX's and our objectives, IDS clearly intends to put forward an architectural design with the aim to solve the concerns generically into a transparent infrastructure. In conclusions, we consider IDS' data technology transparency an interesting complement to our data semantic transparency.

[@Greefhorst2011] provides for a Principles Catalogue in their appendix which presents almost sixty design principles. Principle A.20 of them reads *Data that are exchanged adhere to a canonical data model*, and one of its rationals states that *A Canonical Data Model standardises the definitions of data that are exchanged (...)*. Indeed, principle A.20 reflects the current practises to achieve interoperability. Although it conflicts with \cref{dp:ssoc}, it is not necessarily wrong, since following it results in achieving interoperability as justified by the many if not all interoperable systems that exist today. However, its application impedes access-and-play interoperability as well as semantic heterogeneity, as we have shown in \cref{waar-precies}.

In support of EU's single digital market, the new European Interoperability Framework (EIF) [@EU-ISA2Program2019] gives guidance to public administrations on how to improve interoperability. It provides three recommendations on the semantic level which are rather abstract in their formulation, although exemplifying these with approaches that can be categorised in FEI [@Chen2017] as *integrated*, or *unified* at best, but not *federated*. These examples imply that our approach is not in compliance with the EIF, which is in contrast with the three recommendations that do not exclude a *federated* approach, or any other of the DPs that we have elaborated.

The authors of [@Neiva2016] present a literature research to pragmatic interoperability. Although no definition on pragmatics or its interoperability is given, the distinction with semantics is given as "semantics is related with which the [semiotic] sign refers to, and pragmatics is related to the effect of the sign on the interpreter.". This aligns with our application of semantic meaning and pragmatic meaning. Where the authors keep pragmatics separate from semantics and, therefore, treat pragmatic interoperability separate from semantic interoperability, we consider the reciprocity between them significant and conclude that semantic interoperability can only be achieved when the DSC can re-establish the connection of the DSP's data with its own pragmatic meaning. Opposed to the authors opinion, we consider the pragmatic meaning a necessary element in achieving sIOP. 

A quasi-systematic literature review to interoperability in context-aware software systems was undertaken by [@Motta2019], resulting in an Interoperability Theoretical Framework "used to guide the evolution of software systems regarding changes focused on interoperability". They identify 16 high-level interoperability mechanisms, i.e., decisions to be taken and solutions recurrently used throughout the software systems to achieve interoperability. Our design principles are in (partial) support of 12(3) of the mechanisms, i.e., "Use common ontologies to enable understanding", and "Use 'bridges' to enable interaction". The 4 mechanisms that we do not support can be considered out of our scope, e.g., "Use opens source solutions" or "Use suitable protocols". 

# Discussion & future work #

Complement weak AI with human brain:

 * use AI where possible (computational semantics for software agent; supporting semantic reconciliation)
 * use human brain where necessary (but not more): ontology engineering @ design time; alignment authoring @ pre-runtime
    *  Therefore, and no matter how the human will be positioned in the architecture, in its pure sense, an access-and-play capability can never be established. However, the time-to-deliver sIOP between two interoperating software agents can be dramatically reduced. 



~~~{=latex}
\onecolumn

Throughout this document, the following Design Principles have been defined. 

\input{./src/docs/TableDesignPrinciples.tex}
\twocolumn
~~~



# References {-} #

\setlength{\parindent}{-0.2in}  

\setlength{\leftskip}{0.2in}  

\setlength{\parskip}{8pt} 
Note:


[^fn1]: Source: http://catless.ncl.ac.uk/Risks/14/57#subj1, accessed May 20, 2018

[^fn2]: http://www.linfo.org/scalable.html, accessed Nov. 2019; https://en.wikipedia.org/wiki/Scalability, accessed Nov. 2019