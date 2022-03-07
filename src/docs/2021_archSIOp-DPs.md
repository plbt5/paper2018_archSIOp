---
# Standard Scrivener+Pandoc Project YAML metadata
# IMPORTANT: YAML configuration files use SPACES for indentation to define structure, remember to straighten any smart quotes, and don't capitalise metadata keys like "author" or "title", they must be lowercase!

# Select which templates pandocomatic will use
# you can enter overrides to the templates here as well
pandocomatic_:
  use-template:
    - elsevier  
title: "Consolidating semantic interoperability in contemporary software architectural paradigms"
tnote: 
  - "version 2.0-1"
#  - "Tables & figures with 2-columns incorrectly placed; will be corrected when submitting."
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
compiled: 01/02/2022
date: Tuesday, 1 February 2022
thanks: Do we have acknowedgments to make?
abstract: |   
  
  *Background:* In today’s increase of business digitalisation and system’s distribution, absence of access-and-play semantic interoperability (sIOP) is a major hurdle to IT-based business collaboration. Current approaches towards sIOP still rely on conventions on the semantics of the exchanged terms, which can be considered both accepted folklore and an impediment to access-and-play sIOP. A breakthrough for this impasse requires consensus on the foundations of semantics and sIOP. In a previous paper we already conclude that in software, semantics cannot exist and is reduced to the reciprocity between data and data processing code. We showed that semantics can be addressed as separate concern, its reciprocity can be contained and become a tangible artifact from which semantic reusability and interoperability emerge as engineering benefits. For sIOP to emerge, the effort of the inevitable human-in-the-loop is to be reduced and her position improved. This is a matter of software architecture.       
  
  *Objective:* The objective of our study is to identify and formulate the fundamental demands towards access-and-play interoperability, to derive their supporting architectural principles, and their integration in contemporary architectural paradigms.    
  
  *Method:* We follow a design-science approach and address the business relevance of the problem, and identify six requirements on sIOP, two of which are concerned with a genuine understanding of semantics that demand for the human-in-the-loop. We assume that the collaborating agents have followed the architectural principles on semantics according to our previous study, which results in an explicit representation of an atomic semantic monolith for each of the agents: two semantic anchorages. We subsequently develop four design principles in order to support interoperability between the semantic anchorages, and one design principle to cater for the semantic distinction between a formal semantic correspondence and the necessary data transcription during communication. We finally evaluate these principles by designing and formulating an ISO-42010 Architecture Viewpoint and View on sIOP.   
  
  *Results:* Semantics in software are the result of a reciprocity between data and the software code that operates on them, resulting in a local semantic monolith [@Brandt2018a]. Data exchange breaks that semantic monolith and hence the aforementioned reciprocity. The main concern of sIOP is to re-establish a valid reciprocity between the internal data processing code from the receiving agent and the external data as received from the producing agent, without extending the semantic monolith from either agents. We show that loosely coupled semantics, semantic alignments and a shared ontological commitment of the applied modelling language can be considered the cornerstone to achieve sIOP. The supporting principles are: (i) assume responsibility for the semantics of one’s data, (ii) maintain an explicit ontological commitment, (iii) abstract semantics from the communication syntax, (iv) align the internal and external semantic meaning of the exchanged data, and (v) encapsulate how agents exchange semantic meaning. This results in a loosely coupled semantics that is re-usable for every interoperating peer agent, even those that are not anticipated for during the agent’s design. The resulting ISO-42010 Architecture Viewpoint and View on sIOP, including a semantic mediation capability, represents a pattern to consolidate sIOP in contemporary architectural paradigms.  
  
  *Conclusions:* The major shortcomings in architectural paradigms to account for an access-and-play sIOP are their negligence of a separation of concerns between the semantic representation and data communication syntax at the one hand and human-authored alignments and the automated mediation process at the other, and establishing the conditions for their support in advance. By their explicit inclusion, we show that loosely coupled semantics can be consolidated in contemporary architectural paradigms, stimulating access-and-play sIOP.   
     
  
---



# Overview of Design Principles #

# DP 1 Semantic heterogeneity between software agents is a feature that should be preserved #


\begin{mmdp}[Semantic heterogeneity between software agents is a feature that should be preserved]\label{dp:shf}

\textbf{Type of information:} business, data  \\
\textbf{Quality attributes:} semantics, interoperability, reliability, reusability, efficiency   \\
\textbf{Rationale:}
\begin{enumerate}
  \item Data represent the state of affairs of some part of the world, viewed from a particular perspective of use. Such view is just one particular perspective out of many equally legitimate ones;
  \item Semantic heterogeneity is a direct consequence of acknowledging equally legitimate perspectives on reality;
  \item Accepting semantic heterogeneity implies the probable uniqueness of the agents view on reality;
  \item Without adherence to this principle, sIOP can be achieved only for dedicated DC/DP pairs, with collaborations that have been foreseen, for which the semantics are assumed stable over time, implemented with technology or platforms for which no or limited evolution is anticipated, and assuming that new communication channels won’t emerge over time.
\end{enumerate}
\textbf{Implications:}
\begin{enumerate}
  \item Semantic heterogeneity maximises semantic clarity, accuracy and, consequently, the faithfull representation of the SoA in reality;
  \item A software agent needs to specify the semantics of its data elements only once whilst remaining prepared for any number of distinct communication peers;
  \item Maintenance and evolution of its semantics remain under the DP’s own control throughout the whole lifespan of the agent, and only depends on its business interest for investment, no matter the growth and evolution of the domain;
  \item Accepting semantic heterogeneity implies acceptance of semantic mediation and resulting semantic alignments in order to achieve sIOP.
\end{enumerate}  
\end{mmdp}




# DP 2 The responsibility for the semantic meaning of data lays with the source #


\begin{mmdp}[The responsibility for explicating the semantic meaning of data lays with the DP]\label{dp:rfsm}

When it is reasonable to expect that the software agent will be engaged in collaboration or otherwise will interoperate with (an)other software agent(s), it is the responsibility of the software architect to serve the quantity and manner of the potential interoperability by specifying its DM, and particularly the semantic meaning of its data, in advance. 

\textbf{Type of information:} business, data  \\
\textbf{Quality attributes:} semantics, interoperability, usability, efficiency   \\
\textbf{Rationale:}
\begin{enumerate}
  \item Computers are not capable of genuine understanding, hence cannot establish semantics from data and thus require the human-in-the-loop for that;
  \item The user of the software agent has a natural, business controlled perspective on the DoA;
  \item This particular perspective is mirrored by the design of the software agent in the way how the entities of interest are carved out from the DoA. This includes the background knowledge that applies, the used terminology and how data from these entities are to be processed;
  \item Consequently, the responsibility for formulating the semantics that are expressed by the data can only lay by the DP;
  \item On specifying semantics, Grice’s maxims on communication, and particularly on serving the quantity and manner of communication, represent the natural constraints to respect;
  \item Without adherence to this principle, the meaning of the data expressed by the software agent can be considered flawed, inaccurate, incomplete or otherwise insufficient in its support for semantic interoperability.
\end{enumerate}
\textbf{Implications:}
\begin{enumerate}
  \item The specification of the data semantics is only dependent on the agent’s own perspective on the application domain, and can therefore be fulfilled without any specific demands on interoperability with other software agents;
  \item No matter the number of different communication peers, the software agent needs to have the semantics of its data elements specified only once;
  \item By providing an explicit semantic specification of the data in advance, a software agent is prepared to engage in sIOP with other agents that can now connect to its semantics;
  \item By establishing collaboration with other DPs or DCs through its DM, the software agent ensures that the communication is grounded in its own perspective.
\end{enumerate}  
\end{mmdp}

# DP 3 Semantic compatibility is a precursor to semantic interoperability #

\begin{mmdp}[Semantic compatibility is a precursor to semantic interoperability]\label{dp:scp}

In order to consolidate semantic compatibility between collaborating software agents, both agents must confess to their ontological commitment underlying their domain models.

\textbf{Type of information:} business, data  \\
\textbf{Quality attributes:} semantics, accuracy, interoperability, usability   \\
\textbf{Rationale:}
\begin{enumerate}
  \item Following [@Grice:1991BT], it testifies to the manner of communication to avoid obscurity of expression and ambiguity;
  \item An ontological commitment represents a philosophical stance on fundamental categories and principles, which are foundational to semantics [@Brandt2021a, Sec.3.1];
  \item Each modelling language and, hence, every (semantic) model, carries an ontological commitment, at least implicitly;
  \item The semantic meaning of data as specified by their SM are subordinate to the categorisation and scope that follow from the ontological commitment of the applied modelling language; 
  \item Semantic compatibility is a necessary condition for the emergence of sIOP; 
  \item Without adherence to this principle, software agents will suffer from semantic incompatibility and therefore experience significant issues with their capability to establish sIOP in their communication with each other.
\end{enumerate}
\textbf{Implications:}
\begin{enumerate}
  \item Software agents that share the same ontological commitment will enjoy compatibility in the scope and nature of their semantics;
  \item Software agents that don’t share the same ontological commitment will know to take corrective actions to assure their semantic compatibility;
  \item By confessing to the ontological commitment underlying her domain model, a software agent realises the proper semantic environment to establish semantic interoperability with her.
\end{enumerate}  
\end{mmdp}


# DP 4 Align the internal and external semantic meaning of the exchanged data #

\begin{mmdp}[Align the internal and external semantic meaning of the exchanged data]\label{dp:alignment}

When a software agent engages in interoperation with (an)other software agent(s), establish for the exchanged data a maximal coherence between external semantic meaning and internal pragmatic meaning by formalising the alignment between the external and internal semantic meaning.   

\textbf{Type of information:} application, data  \\
\textbf{Quality attributes:} semantics, semantic interoperability   \\
\textbf{Rationale:}
\begin{enumerate}
  \item On processing external data, semantics manifest themselves as the reciprocity between data and processing code;
  \item Data are considered to carry the semantic meaning as specified by the Domain Model of the software agent;
  \item Formalising a correspondence relation between the semantic meanings of interoperating software agents effectively connects the external semantic meaning with the internal pragmatic meaning;
  \item By assuring that the internal semantic meaning encompasses the external semantic meaning, and by assuring that the semantic consequences of the latter extending the former are insignificant, collectively assures the semantic validity of the correspondence relation.
\end{enumerate}
\textbf{Implications:}
\begin{enumerate}
  \item The conversion from external to internal semantic meaning is specified by a correspondence;
  \item The collection of all correspondences specify the semantic alignment that holds between a pair of interoperating agents;
  \item Software agents that are unable to align their semantic meaning with the external semantic meaning cannot engage in sIOP without introducing phantom semantics, with unforeseen consequences in their data processing.
\end{enumerate}  
\end{mmdp}



# DP 5 Separate semantics from communication syntax #


To Be Confirmed

\begin{mmdp}[Separate semantics from communication syntax]\label{dp:ssoc}

When a software agent engages in interoperation with (an)other software agent(s), resolve their semantic differences independently from the syntax of the exchanged data.   

\textbf{Type of information:} data, technology  \\
\textbf{Quality attributes:} semantic interoperability, portability, maintainability, efficiency, usability (reuse), reliability, functionality   \\
\textbf{Rationale:}
\begin{enumerate}
  \item Data schemata are defined to support the (de)serialisation processes that consolidate the data communications concern;
  \item Neglecting the principle of separation of concerns solidifies dependency between otherwise disjoint concerns, here the semantic level and the syntactic level of data communication;
  \item Access-and-play capabilities are supported by assuring minimal impact on software code when introducing semantic modifications;
  \item Minimising impact on software code that is concerned with data communication is realised by abstracting semantics away from the data schemata.
\end{enumerate}
\textbf{Implications:}
\begin{enumerate}
  \item Separation of concerns has a strong positive effect on software quality, including but not limited to sIOP;
  \item Removing any dependency between semantics and data syntax enables to support multiple communication paradigms without the need to modify the semantic abstraction;
  \item Similarly, modifications in the semantic representation, or supporting multiple semantic representations become possible without the need to modify the communication layer;
  \item Align semantics, not data schemata: Semantic reconciliation is applied at a higher conceptual level and abstracts away from data communication schemata;
  \item Heterogeneous semantics from multiple data sources are more easily supported;
  \item Semantic alignments imply the need for a mediation capability between the semantic representations of the communicating agents.
\end{enumerate}  
\end{mmdp}



# DP 6 Encapsulate how agents exchange semantic meaning #


To Be Confirmed

\begin{mmdp}[Encapsulate how agents exchange semantic meaning]\label{dp:mediation}

When software agents engage in interoperation, encapsulate how the representation of their semantic meaning should be transcribed without inducing phantom semantics.   

\textbf{Type of information:} business, data  \\
\textbf{Quality attributes:} semantic interoperability   \\
\textbf{Rationale:}
\begin{enumerate}
  \item The semantic meaning is codified in (onto)logical representations;
  \item Keeping agents from referring to each others representation therefore requires transcription between representations;
  \item A solution where each agent needs to implement one transcription component between its own representation and each of its interoperating peer, increases complexity;
  \item Encapsulating the transcription into an alignment-based intermediary component results in less communication complexity and relieves the agents from development and maintenance of local wrappers;
\end{enumerate}
\textbf{Implications:}
\begin{enumerate}
  \item A mediator creates representational transparency between communicating agents, keeping agents from using each others representations;
  \item This enables independent development of the individual agent’s semantic meaning;
  \item The need to enforce a canonical semantic representation, viz. semantic homogeneity, expires, allowing semantic heterogeneity to become the norm;
  \item Each agent can reuse its semantic anchorage in any other interoperation;
  \item Data transcription logic can become a generic service provided by the communication infrastructure;
  \item Each agent can communicate with any other agent in its own native semantic representation.
\end{enumerate}  
\end{mmdp}

