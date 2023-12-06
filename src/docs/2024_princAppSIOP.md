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
compiled: 06/12/2023
date: Wednesday, 6 December 2023
ack: P.B. would like to acknowledge H.Dominicus for her editorial efforts and M.Bik for leading the project.
abstract: |   
  
  Collaboration among business stakeholders occurs within chains and networks that are considerably more dynamic than in the past. Parties come and go depending on opportunities and threats in their domain of application. Additionally, communication essential for collaboration is increasingly shifting from the physical to the digital domain. This necessitates solutions for dynamic semantic interoperability (sIOP) within the digital realm.
  
  Dynamic sIOP is a form of sIOP that addresses semantically heterogeneous environments without the need for upfront sharing of common semantics or knowledge of participating stakeholders. In the field of ICT, the primary challenge is to effectively reconcile, in (near) real-time, the differences in real-world semantics (RWS) referred to by various applications. Since software systems are unable to genuinely understand RWS, bridging semantic heterogeneity requires a human-in-the-loop. Also, any solution towards that bridge should not be invented locally and reinvented again and again, but rather is common functionality that can and should become available as infrastructural services. Our research aims to enhance both application and infrastructure by introducing a dynamic sIOP capability, whilst minimising the human-in-the-loop to the bare essentials.  
  
  Our approach is to identify the essential functional concerns for such dynamic sIOP capability, and to devise design principles (DPs) to their resolution. We operationalise these DPs by arguing that their joint implementation results in infrastructural services that are agnostic towards the specific RWS of the application domain while enabling applications to communicate and come to an agreement about domain semantics.  
  
  The benefits of such dynamic sIOP capability over existing solutions towards sIOP lie in software applications’ ability to converse about the domain semantics in real time whenever the need arises, rather than being constrained to communicate over a fixed set of semantics only. This is a direct result of separating the semantic concerns from the communication concerns, lifting the semantic representation from the communication syntax. And, by remaining agnostic to domain semantics and solely applying generic (infrastructural) services, this approach allows for a standardisation initiative on top of any communication infrastructure. Consequently, for arbitrary applications to be eligible to engage in collaboration, they need only share a specific part of reality.  
  
---

