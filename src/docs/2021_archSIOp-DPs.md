---
# Standard Scrivener+Pandoc Project YAML metadata
# IMPORTANT: YAML configuration files use SPACES for indentation to define structure, remember to straighten any smart quotes, and don't capitalise metadata keys like "author" or "title", they must be lowercase!

# Select which templates pandocomatic will use
# you can enter overrides to the templates here as well

pandocomatic_:
  use-template:
    - elsevier  
title: "Consolidating Semantic Interoperability in Contemporary Software Architecture Paradigms"
tnote:
  - "version 2.0-0"
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
compiled: 20/01/2022
date: Thursday, 20 January 2022
thanks: Do we have acknowedgments to make?
  
---



# Overview of Design Principles #

# DP 2.1 #


\begin{mmdp}[The responsibility for the semantic meaning of data lays with the source]\label{dp:rfsm}

When it is reasonable to expect that the software agent will be engaged in collaboration or otherwise will interoperate with (an)other software agent(s), it is the responsibility of the software architect to serve the quantity and manner of the potential interoperability by specifying the semantics of the data in advance. 

\textbf{Type of information:} business, data  \\
\textbf{Quality attributes:} semantics, interoperability, usability, efficiency   \\
\textbf{Rationale:}
\begin{enumerate}
  \item Data represent the state of affairs of some part of the world, viewed from a particular perspective of use. Such view is just one particular perspective out of many equally legitimate ones;
  \item Semantic heterogeneity, a direct consequence of the equally legitimate perspectives on reality, should not be considered a bug to resolve, but a feature to preserve and nurture in order to maximise semantic clarity and accuracy;
  \item Accepting semantic heterogeneity implies the probable uniqueness of the agents view on reality;
  \item Computers are not capable of genuine understanding, hence cannot establish semantics from data and thus require the human-in-the-loop for that;
  \item The responsibility for formulating the semantics that are expressed by the data can only lay by the software architect that has taken the particular perspective on reality when carving out the entities of interest to the software application;
  \item On specifying semantics, Grice’s maxims on communication, and particularly on serving the quantity and manner of communication, represent the natural constraints to respect;
  \item Without adherence to this principle, the meaning of the data expressed by the software agent can be considered flawed, inaccurate, incomplete or otherwise insufficient in its support for semantic interoperability.
\end{enumerate}
\textbf{Implications:}
\begin{enumerate}
  \item The specification of the data semantics is only dependent on the agent’s own perspective on the application domain, and can therefore be fulfilled before any specific interoperability with communication peers;
  \item No matter the number of different communication peers, the software agent needs to have the semantics of its data elements specified only once;
  \item By providing an explicit semantic specification of the data, an agent facilitates other components and agents to connect to it and, consequently, grounds its semantic interoperability with them unequivocally.
\end{enumerate}  
\end{mmdp}



# DP 2.2 #


\begin{mmdp}[Semantic compatibility is a precursor to semantic interoperability.]\label{dp:eoc}

In order to consolidate semantic compatibility between collaborating agents, both agents must confess to their ontological commitment underlying their domain models.

\textbf{Type of information:} business, data  \\
\textbf{Quality attributes:} semantics, interoperability, usability, functionality   \\
\textbf{Rationale:}
\begin{enumerate}
  \item Semantic compatibility is a necessary condition for the emergence of sIOP;
  \item An ontological commitment represent a philosophical stance on fundamental categories and principles, which are foundational to semantics [@Brandt2021a, Sec.3.1];
  \item Each modelling language and, hence, every (domain) model, carries an ontological commitment, at least implicitly;
  \item The semantics of data as is specified by their domain model is subordinate to the categorisation and scope that follow from the ontological commitment of the applied modelling language; 
  \item Following [@Grice:1991BT], it testifies to the manner of communication to avoid obscurity of expression and ambiguity; 
  \item Without adherence to this principle, agents will suffer from semantic incompatibility and therefore experience significant issues with their capability to establish sIOP in their communication with each other.
\end{enumerate}
\textbf{Implications:}
\begin{enumerate}
  \item Actors that share the same ontological commitment will enjoy compatibility in the scope and nature of their semantics;
  \item Actors that don’t share the same ontological commitment will know to take corrective actions to assure their semantic compatibility;
  \item By providing an explicit specification of the ontological commitment underlying her domain model, an agent realises the proper semantic environment to establish semantic interoperability with her.
\end{enumerate}  
\end{mmdp}



# DP 3.1 #

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



# DP 3.2 #


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



# DP 4.1 #


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

