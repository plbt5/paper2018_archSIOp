---
# Standard Scrivener+Pandoc Project YAML metadata
# IMPORTANT: YAML configuration files use SPACES for indentation to define structure, remember to straighten any smart quotes, and don't capitalise metadata keys like "author" or "title", they must be lowercase!

# Select which templates pandocomatic will use
# you can enter overrides to the templates here as well
pandocomatic_:
  use-template:
    - elsarticle  
title: "A principled approach to dynamic semantic interoperability in heterogeneous environments"
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
version-incr: commit # major, minor or commit
compiled: 05/02/2024
date: Monday, 5 February 2024
ack: # P.B. would like to acknowledge H.Dominicus for her editorial efforts and M.Bik for leading the project.
abstract: |   
  
  Collaboration among business stakeholders occurs within chains and networks that are considerably more dynamic than in the past. Parties come and go depending on opportunities and threats in their domain of application. Additionally, communication essential for collaboration is increasingly shifting from the physical to the digital domain. This necessitates solutions for dynamic semantic interoperability (sIOP) within the digital realm.
  
  Dynamic sIOP is a form of sIOP that addresses semantically heterogeneous environments without the need for upfront sharing of common semantics or knowledge of participating stakeholders. In the field of ICT, the primary challenge is to effectively reconcile, in (near) real-time, the differences in real-world semantics (RWS) referred to by various applications. Since software systems are unable to genuinely understand RWS, bridging semantic heterogeneity requires a human-in-the-loop. Also, any solution towards that bridge should not be invented locally and reinvented again and again, but rather is common functionality that can and should become available as infrastructural services. Our research aims to enhance both application and infrastructure by introducing a dynamic sIOP capability, whilst minimising the human-in-the-loop to the bare essentials.  
  
  Our approach is to identify the essential functional concerns for such dynamic sIOP capability, and to devise design principles (DPs) to their resolution. We operationalise these DPs by arguing that their joint implementation results in infrastructural services that are agnostic towards the specific RWS of the application domain while enabling applications to communicate and come to an agreement about domain semantics.  
  
  The benefits of such dynamic sIOP capability over existing solutions towards sIOP lie in software applications’ ability to converse about the domain semantics in real time whenever the need arises, rather than being constrained to communicate over a fixed set of semantics only. This is a direct result of separating the semantic concerns from the communication concerns, lifting the semantic representation from the communication syntax. And, by remaining agnostic to domain semantics and solely applying generic (infrastructural) services, this approach allows for a standardisation initiative on top of any communication infrastructure. Consequently, for arbitrary applications to be eligible to engage in collaboration, they need only share a specific part of reality.  
  
---



# Introduction #

Never before, business collaborations were so networked, their potential stakeholders so numerous and the dynamics in their value chains so present. Never before, data were so ubiquitous, and managed access to external data was so easy. Never before, the drive to shift the communication underlying the collaboration from the physical to the digital realm was so high. For the individual business party, such economical pressure to intensify digital business collaboration translates in the need for an ICT capability that allows her to instantaneously connect to a value chain and partake in the collaboration by exchanging one’s internal data and using external data. 

But *understanding precedes use*; because data refer to a certain state of affairs (SoA) in reality, understanding data is about establishing what SoA the data are referring to. Due to the independent development of software agents, differences arise in how agents abstract, represent, and structure real-world semantics (RWS), resulting in *semantic heterogeneity* at the data communication plane. In order for data consumers to correctly *use* the data providers’ data, we need a genuine *understanding* upfront, which computers still cannot do. 

Semantic interoperability (sIOP) refers to the shared and unambiguous understanding of data that is exchanged among socio-technical systems, i.e., systems that have a social part (human agents) and a technical part (software agents). Understanding relies solely on the human agents, making sIOP time consuming and hampering agility in business collaboration in all domains. When we accept the need for a human in the loop of collaborative socio-technical systems, her place in architecture becomes a design choice. Like [@Kuhn2009], and as opposed to a philosophical or linguistic problem, we consider sIOP an engineering problem that aims at constraining mechanical interpretations towards those that are intended, producing engineering artefacts that can facilitate sIOP. 

The purpose of sIOP is to apply data exchange as a vehicle to communicate the SoA as perceived by the data producer to the data consumer such that the latter can act upon it adequately. In order to provide instant and efficient sIOP among socio-technical systems, (i) the contribution of the social component should be reduced to its bare essentials, viz data understanding such that (ii) the social component prepares the technical component to ensure that it processes the data in line with the semantic definition of the data (and vice versa). 

Current sIOP implementations are based on the (time-consuming) process of establishing a shared syntactical convention on the RWS[^fn1] to which the exchanged data refer. Dubbed *semantic homogeneity*, this requires a potentially substantial investment into the adaption of stakeholders’ ICT to the shared semantic standard. Moreover, this results in a semantic monolith encompassing the stakeholders’ applications and data sources for the particular collaboration. Indeed, this approach resolves some but not all interoperability problems [@Renner1996]. For instance, dealing with data that originates outside the monolith is impossible without costly adaptation of the standard - an adaptation that all stakeholders must sign-up for. Worse, sIOP between different but equally legitimate perspectives on reality is difficult — if not impossible — to achieve on the basis of semantic homogeneity, at least demanding the standard to include perspective-induced optional parts. 

The European Interoperability Framework (EIF)[@EU-ISA2Program2017], the European Interoperability Reference Architecture (EIRA) [@EU-ISA2Program2019] and the FAIR principles [@Wilkinson2016] are three typical examples of contemporary guidelines towards sIOP, recommending as prime principle to separate syntactical from semantic concerns. Indeed, this principle is a necessary characteristic to allow for sIOP in semantically heterogeneous environments, although in itself it renders insufficient as to the practice of how to achieve such separation. Moreover, new ICT capabilities are required that support dynamic collaborations, i.e., establishing sIOP at runtime between collaborating partners that come and go. These include (i) the means to talk about, identify and reconcile semantic differences; and (ii) semantic scalability, that is, allowing variations in perspectives on reality to be introduced or removed without noticeable impact on the adequacy of the collaboration. All with minimal human-in-the-loop efforts. 

~~~{=latex}
\begin{figure}[h]
  \centering
  \subfloat[][]{%
    \includegraphics[width=0.7\linewidth]{src/images/OverviewPaper}%
  }%
  \qquad
  \subfloat[][]{%
    \includegraphics[width=0.2\linewidth]{src/images/OverviewLegend}%
  }%
  \caption{(a) Overview of relationships between concerns, DPs and the sIOP Viewpoint, with their sections in the paper. (b) Legend of the used components.}\label{fig:overview-paper}
\end{figure}
~~~


In this paper, we identify concerns towards this form of sIOP that we call *dynamic sIOP*. It responds to the trend on data-driven operations and collaborations, enabling an access-and-play interoperability by runtime deciphering to which SoAs the external data refer. We investigate what design principles are necessary for resolving those concerns. We operationalise their application by showing how this results in infrastructural and application parts that allow dynamic sIOP to emerge. We categorise our work in terms of the Framework for Enterprise Interoperability (FEI) [@Chen2017] as addressing the *conceptual* barrier, investigating the *data* and *process* concerns, and applying a *federated* approach.

This paper is structured as follows. We first elaborate on our meaning of dynamic sIOP, \cref{dynamic-siop}, and reflect it against the state of the art in \cref{state-of-the-art}. We then identify four sets of concerns that we consider quintessential towards consolidating dynamic sIOP, and investigate each of them in a separate section: (i) semantic concerns, \cref{anchorage-semantic-concerns}; (ii) reconciliation concerns, \cref{spanning-reconciliation-concerns}; (iii) mediation concerns, \cref{roadway-mediation-concerns}; and (iv) semantic scalability concerns, \cref{semantic-scalability-concerns}. As depicted in \cref{fig:overview-paper}, we follow a principled approach by defining, in each of these sections for each identified concern, one or more design principles (DPs) to its resolution; their collective compilation can be found in \cref{tab:dps} at \cpageref{tab:dps}, structured according to [@Greefhorst2011]. We proceed by presenting how these DPs can be operationalised to their effect by engineering an architectural viewpoint on dynamic sIOP, \cref{architectural-viewpoint-on-dynamic-siop}. In \cref{discussion-conclusions-future-work}, we discuss our findings, draw conclusions and present the open issues that require further research.

We are confident that this principled approach can drive research and engineering initiatives to ultimately produce a standard for dynamic sIOP. By separating syntactical from semantic concerns and infrastructural from application components, such standard will facilitate an ICT stack with semantic capabilities that allow seamless, digital ad-hoc business collaborations to emerge. 


# Dynamic sIOP #

Interoperability refers to the ability of two or more organisations to interact towards mutually beneficial goals. This involves sharing information and knowledge between these organisations through the business processes they support, by exchanging data between their ICT systems [@EU-ISA2Program2017]. Consequently, achieving interoperability involves addressing many concerns, separated into distinct layers, with semantics being one of them. Semantics denote the comprehension of the reality state being referred to by the information provided. In software terms, digital data represent a specific state of affairs (SoA) within the domain of application (DoA). 

Providing this definition of semantics, sIOP, then, refers to the capability to share a particular SoA between two software agents by the exchange of digital data. However, software is not capable of bridging the gap between data and reality. Software should target the next best, i.e., to consolidate *semantic reciprocity* between data and data processing. This means that data processing aligns with the semantic definition of the data and that the data are compatible with the software's processing algorithms. Without semantic reciprocity, the software agent may operate on the data in a way that is not realistic, producing faulty behaviour. For instance, the command to ‘share the coffee’ might result in dividing the coffee *and the cup* in two equal parts<span class="comment" style="background-color:#FEF3C0; border: 1pt solid #CBC29A"> Twan: Dit voorbeeld heeft geen link met software/business collaboration.</span>.

Maintaining semantic reciprocity becomes challenging when agents start to communicate. Semantic reciprocity can be assumed to apply for any individual software agent. Due to independent development, it is probable that the data service provider (DSP) and data service consumer (DSC) will apply different background knowledge in their abstraction of the DoA and representation of the SoA in their data. The resulting differences in naming, structure, dimension, granularity, formats and more, will disrupt semantic reciprocity between the DSP's data and the DSC's data processing. Consequently, one piece of data might refer to two different perceived SoAs, leading to conclusions that cannot be substantiated in the DoA and, subsequently, to incorrect behaviour of the DSC. Therefore, the purpose of sIOP is to ensure that DSCs and DSPs share one single SoA when exchanging data, by restoring the semantic reciprocity between DSP's data and DSC's data processing. 

Metaphorically speaking, we consider sIOP a bridge overarching a semantic gap (\cref{fig:siop-concerns}): with *anchorages* (local, tangible semantics) on each side of the gap, with a *spanning* (semantic reconciliation, semantic alignments) resting on them to structurally (semantically) support the interoperability bridge, and with a *roadway* (semantic mediation) enabling the delivery of the cargo (SoA) by the crossing traffic (data). 

Dynamic sIOP refers to restoring semantic reciprocity between DSP's data and DSC's data processing when the circumstances of the collaboration change due to business-induced factors. SIOP must be adjusted to reflect these changes before collaboration can continue. These factors may include changes in stakeholders participating in the collaboration, such as substituting partners or expanding the collaboration with similar partners; or changes in goals attained by the collaboration; or varying stakeholder interests in those goals; or changes in the collaboration's structure (such as the spin-out of sub-goals or partial results into independent production chains or - vice-versa - their integration into the larger collaboration). Dynamic sIOP is an ICT capability to achieve and maintain sIOP under business-induced variations within the collaborative network, as quickly as possible and as soon as variations occur, as transparent as possible to the business. We dub this an *access-and-play* capability of the software agent.

~~~{=latex}
\begin{figure}
  \begin{subfigure}[t]{0.75\linewidth}
    \includegraphics[width=\textwidth, left]{src/images/3SemanticConcerns}
  \end{subfigure}%
  \qquad%
  \begin{subfigure}[t]{0.2\linewidth}
    \includegraphics[width=\textwidth, right ]{src/images/3concernsLegend}
  \end{subfigure}
  \caption{Conceptual overview of the relationships in sIOP between the anchorage (conceptual modelling), its spanning (semantic reconciliation) and roadway (semantic mediation).}\label{fig:siop-concerns}
\end{figure}
~~~


Now that we know what dynamic sIOP entails, the question arises how to realise it. \Cref{fig:siop-concerns} depicts an outline of the main elements of the solution, as follows. When stakeholders engage in collaboration, a part of reality exists that is shared by them; without such *shared DoA* no reason exists for collaborating in the first place. Modelling the DoA requires an *abstraction*, the art of leaving out what isn’t relevant. Abstraction is directed by a particular perspective on reality, and results in how the DoA is perceived. The *domain model*, e.g., an ontology, is the result of a *conceptual modelling* activity that is performed once by the stakeholder, independently from any other stakeholder or software agent. In this way, a stakeholder-specific reflection emerges (and maintained) that describes how a stakeholder perceives its DoA. This embodies an asset for the stakeholder, the life cycle of which is only dependent on the particular perspective that the stakeholder has got about its DoA, irrespective of any software agent in its enterprise application landscape. We consider the stakeholder’s domain model an essential element required to achieve sIOP for each business collaboration: it provide the software agent with a tangible, local semantic *anchorage*, part of which describes the shared DoA that the collaboration is about and for which sIOP is in order. 

Although stakeholders collaborate in the shared DoA, they don’t necessarily share an identical perspective, resulting in variations between their domain models. Amongst others, these variations include representational differences, e.g., how entities are named, or structured, or being formulated as classes versus properties; aggregation differences, e.g., identifying individuals versus their aggregation as (onto)logical type; semantic astigmatism, that is, entities that share many things or possibly even the same individuals but are different nevertheless, e.g. the nation of Basques versus the country of Spain. To overcome these discrepancies, a *semantic reconciliation* is required between those parts of the domain models that concern the shared DoA. It specifies precisely how (onto)logical constructs from one domain model correspond to (onto)logical constructs from the other domain model. These correspondences are expressed in a specific language, e.g., \cite{Scharffe2011}. They collaboratively pertain to the shared DoA only, denoted an *alignment*, where they function as the *spanning* of the semantic bridge. Indeed, semantic reconciliation is largely supported by alignment systems and although it requires human authoring, no further human intervention applies in its use during *semantic mediation*. The latter refers to a generic, runtime component that is positioned in the data exchange flow between the communicating software agents. It functions as the *roadway* between them, and transcribes the data as received from the DSP into data that can be recognised by the DSC, without altering the semantics that are carried by the data. 

The dynamic part of sIOP requires a semantic protocol<span class="comment" style="background-color:#FEF3C0; border: 1pt solid #CBC29A"> Paul: dit heb ik nog onvoldoende voor ogen om nu al een overzicht van te kunnen maken.</span> about semantic differences. It must support identifying and resolving semantic differences that result from business-induced variations in the collaboration network. It can do so by addressing inconsistencies between those parts in the domain models that concern the shared DoA, using the alignments that apply. Such remains insufficient as it doesn’t involve the objectives that the stakeholders pursue with the collaboration, nor what stakeholders can and should contribute to it. In fact, the collaboration can be expressed by mutual obligations and interests, the requested and offered capabilities and contracts between the stakeholders, related SLAs, potential and actual partners in the collaboration network, its structure, processes, flow of business, and more. This can be considered just another reality, the DoA for which sIOP - again - is in order. The difference with the above is that the previous DoA will be used to identify the subject about which the new DoA applies. Here we identify a form of metamodel - model relationships that must be formalised. Other than that, the same elements exist.


# State of the art #

Bespreek:

1. Jardim-Goncalves, R., Grilo, A., Agostinho, C., Lampathaki, F., & Charalabidis, Y. (2013). Systematisation of Interoperability Body of Knowledge: the foundation for Enterprise Interoperability as a science. Enterprise Information Systems, 7(1), 7–32. https://doi.org/10.1080/17517575.2012.684401


# Anchorage: Semantic concerns #

# Spanning: Reconciliation concerns #

# Roadway: Mediation concerns #

# Semantic scalability concerns #

# Architectural viewpoint on dynamic sIOP  #

# Discussion, conclusions & future work #

# Design Principles #

~~~{=latex}
\onecolumn
~~~
Throughout this document, the following Design Principles (DPs) have been defined, structured according to \cite{Greefhorst2011}, as follows. The *Type of Information* describes the subject of architectural information, classified by the four architecture domains from TOGAF: business, data, application and technology. The *Quality attributes* define the segments that value most from the architecture principle, and are classified as follows

* **functionality**: a set of attributes that bear on the existence of a set of functions and their specified properties. The functions are those that satisfy stated or implied needs;
* **reliability**: a set of attributes that bear on the capability of software to maintain its level of performance under stated conditions for a stated period of time;
* **usability**: a set of attributes that bear on the effort needed for use, and on the individual assessment of such use, by a stated or implied set of users;
* **efficiency**: a set of attributes that bear on the relationship between the level of performance of the software and the amount of resources used, under stated conditions;
* **maintainability**: a set of attributes that bear on the effort needed to make specified modifications;
* **portability**: a set of attributes that bear on the ability of software to be transferred from one environment to another.

We sometimes specify Subcharacteristics, in parentheses, to these quality attributes to be more specific on the particular qualities involved.

Since these DPs all apply in the context of sIOP, this is something to make explicit in each DP. This wouldn’t improve its readability, and we therefore assume each DP to start with the following sentence: "When it is reasonable to expect that the software agent will be engaged in collaboration or otherwise will interoperate with (an)other software agent(s), then …” 

~~~{=latex}
\input{./src/docs/TableDesignPrinciples.tex}
\twocolumn
~~~



[^fn1]: In the remainder of the paper we use the terms RWS and semantics interchangeably.