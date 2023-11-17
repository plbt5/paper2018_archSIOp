---
# Standard Scrivener+Pandoc Project YAML metadata
# IMPORTANT: YAML configuration files use SPACES for indentation to define structure, remember to straighten any smart quotes, and don't capitalise metadata keys like "author" or "title", they must be lowercase!

# Select which templates pandocomatic will use
# you can enter overrides to the templates here as well
pandocomatic_:
  use-template:
    - elsarticle  
title: "A principled approach to dynamic and scalable semantic interoperability in heterogeneous environments"
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
journalname: ??International Journal of Web & Semantic Technology (IJWesT), of IEEE Transactions on Knowledge and Data Engineering??  
version-incr: major # major, minor or commit
compiled: 17/11/2023
date: Friday, 17 November 2023
ack: P.B. would like to acknowledge H.Dominicus for her editorial efforts and M.Bik for leading the project.
abstract: |   
  
  Fast and effective business collaboration benefits from semantic interoperability (sIOP). Dynamic sIOP is a dynamically scalable, infrastructure-supported form of sIOP targeting dynamic, semantically heterogeneous environments. It responds to the trend on data-driven operations and collaboration, enabling an access-and-play semantic deciphering of external data sources.  
  
  The challenge to overcome in the ICT discipline is to bridge the differences in real world semantics (RWS) that exist between applications. Since software systems are still unable to genuinely understand RWS, homogenising such semantic heterogeneity requires intervention of the human brain. Dynamic sIOP requires a subsequent adaption of the software application accordingly, and/or an extension of the communication infrastructure. Our investigation is oriented at the latter, viz extending the infrastructure with a dynamic sIOP capability, and minimising the human-in-the-loop as well as the design time for adapting the software.  
  
  Our approach is to identify the essential (extra-)functional concerns for the dynamic sIOP capability, and to establish design principles (DPs) to their resolution. We operationalise these DPs by showing that their collective application leads to infrastructural services at the one hand, and communication specific components at the other, both being generic to the particular RWS of the application domain. Additionally, the RWS of the domain remain as an explicit and reusable artefact that is specific to and governed by the enterprise and loosely-coupled with its applications.  
  
  The benefits of our dynamic sIOP architecture and our contribution to the body of knowledge about the semantic (web) technology is a capability of software applications to converse about the domain semantics in real time, as opposed to standardise domain semantics upfront in fixed data communication syntaxes. The characteristics of dynamic sIOP enables an ad-hoc and scalable access-and-play capability between arbitrary applications, paving the way towards fast and effective business collaborations.  
  
---



# Introduction #

Never before, data were so ubiquitous, and managed access to external data was so easy. But *understanding precedes use*, and understanding the data requires a human in the loop. Therefore, semantic interoperability (sIOP) is time consuming and hampers agility in business collaboration in all domains. Due to the independent development of software agents, differences in how agents abstract, represent, and structure RWS emerge, producing *semantic heterogeneity* at the data communication plane. The European Interoperability Framework (EIF)[@EU-ISA2Program2017], the European Interoperability Reference Architecture (EIRA) [@EU-ISA2Program2019] and the FAIR principles [@Wilkinson2016] are three typical examples of contemporary guidelines towards sIOP, recommending, amongst others, the separation of syntactical from semantic concerns. Indeed, this separation of concerns is a necessary characteristic for sIOP to emerge. In itself, though, it renders insufficient as to the practice of how to achieve such separation. In this paper, we identify concerns towards dynamic sIOP and investigate what design principles are necessary for their resolution. We subsequently operationalise their application into an infrastructural supported dynamic sIOP. 

sIOP refers to the shared and unambiguous understanding of data among socio-technical systems, i.e., systems that have a social part (human agents) and a technical part (software agents). In order to provide instant and efficient sIOP, (i) the social component should be minimised and (ii) the technical component must ensure that the processing of data is in line with the semantic definition of the data, and vice versa. We refer to the latter as (semantic) reciprocity between data and processing.

Data represents a certain state of affairs (SoA) in the domain of application (DoA). The purpose of sIOP is to communicate this SoA in such manner that the data service consumer (DSC) can act upon it adequately. Unfortunately, variations may exist between the data service provider (DSP) and the DSC in terms, structures, dimensions and other background knowledge about the exchanged data. Consequentially, one datum might refer to two differently perceived SoAs, leading to conclusions that cannot be substantiated in the DoA and, subsequently, to incorrect behaviour. In order for DSCs to correctly *use* DSPs’ data, we need a genuine *understanding* upfront, which computers still cannot do. When we accept the need for a human in the loop, her place in architecture becomes a design choice. Like [@Kuhn2009], and as opposed to a philosophical or linguistic problem, we consider semantic interoperability an engineering problem that aims at constraining mechanical interpretations towards those that are intended, producing engineering artefacts that can carry sIOP.

Current sIOP implementations are based on the (time-consuming) process of establishing a shared syntactical convention on real-world semantics (RWS)[^fn1] that the data that are exchanged, refers to (*semantic hmoogeneity*). This requires custom software solutions and collaboration-dependent software adaptations, resulting in semantic monoliths encompassing the stakeholders applications and data sources. This resolves some but not all interoperability problems [@Renner1996], but consequently makes dealing with data that originates outside the monolith impossible. Worse, sIOP between different but equally legitimate perspectives on reality is difficult — if not impossible — to achieve on the basis of semantic homogeneity. In view of the large uptake of the Internet, the Internet of Things (IoT), cloud computing and big data, and economical pressure to intensify business collaboration, a semantic homogeneity based approach towards sIOP is insufficient. This requires new ICT capabilities to support dynamic collaboration, semantic scalability, and the means to talk about and reconcile semantic differences in real-time. All with minimal human-in-the-loop efforts. In this paper, we develop design principles to achieve this, which will ultimately allow for a maximum level of automation that is founded on infrastructural support in the achievement of sIOP.

We categorise our work in terms of the Framework for Enterprise Interoperability (FEI) [@Chen2017] as addressing the *conceptual* barrier, investigating the *data* and *process* concerns, and applying a *federated* approach. 

Our approach is depicted in \cref{fig:concernsa}. We identify four sets of concerns in relation to dynamic sIOP, three of which are of functional nature and one of extra-functional nature. We consider each concern quintessential towards consolidating dynamic sIOP. The first three main sections address the functional concerns (semantic concerns, \cref{anchorage-semantic-concerns}; reconciliation concerns, \cref{spanning-reconciliation-concerns}; and mediation concerns, \cref{roadway-mediation-concerns}). The fourth main section addresses extra-functional concerns about semantic scalability, \cref{semantic-scalability}. For each identified concern, one or more design principles (DPs) are defined. Finally, we present how these DPs can be operationalised by their inclusion in a method in support of view-based architectures, \cref{iso42010-viewpoint-on-siop}. Throughout these investigations, we collect the DPs in \cref{tab:dps} at the end of the paper, structured according to [@Greefhorst2011]. Metaphorically speaking, we consider sIOP a bridge overarching a semantic gap (\cref{fig:concernsb}): with *anchorages* (local, tangible semantics) on each side of the gap, with a *spanning* (semantic reconciliation, semantic alignments) resting on them to structurally (semantically) support the interoperability bridge, and with a *roadway* (semantic mediation) enabling the crossing of the traffic (data). *Design principles* provide the necessary guidance to the architect for the various design decisions that effectively result in a particular bridge over a particular semantic gap. 


~~~{=latex}
\begin{figure}
  \centering
  \begin{subfigure}[t]{0.75\linewidth}
    \includegraphics[width=\textwidth, left]{src/images/OverviewPaper}
    \caption{}\label{fig:concernsa}
    \vspace{.5cm}
  \end{subfigure}%
  \begin{subfigure}[t]{0.25\linewidth}
    \includegraphics[width=\textwidth, right, top]{src/images/OverviewLegend}
  \end{subfigure}
  \begin{subfigure}[t]{0.75\linewidth}
    \includegraphics[width=\textwidth, left]{src/images/3SemanticConcerns}
    \caption{}\label{fig:concernsb}
  \end{subfigure}%
  \begin{subfigure}[t]{0.25\linewidth}
    \includegraphics[width=\textwidth, right, ]{src/images/3concernsLegend}
  \end{subfigure}
  \caption{(a) Overview of relationships between concerns, DPs and the sIOP Viewpoint, with their sections in the paper; (b) Conceptual overview of the relationships in sIOP between the anchorage (conceptual modelling), its spanning (semantic reconciliation) and roadway (semantic mediation).}\label{fig:semantic-concerns}
\end{figure}
~~~





[^fn1]: In the remainder of the paper we use the terms RWS, semantics and real-world semantics interchangeably.