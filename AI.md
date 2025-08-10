# IONKARE Modernization AI Strategy

## Vision
Make the application AI first after MVP by augmenting patient and supporter experiences, improving care coordination, and accelerating internal operations while preserving privacy and compliance.

## Initial AI Use Cases (prioritized)
- Content safety and moderation for media and posts
- Help and FAQ assistant with retrieval augmented generation
- Summaries of care updates and calendar changes for supporters
- Smart search across profiles and posts; semantic search
- Assistive authoring for updates and invitations
- Anomaly detection on account events and security signals
- Support agent assist for operations and compliance queries

## Architecture Overview
- Retrieval augmented generation: vector index of approved content with policy filters
- Data sources: documentation, product help, non PHI operational data; PHI only with explicit approval and guardrails
- Vector store: Postgres pgvector or managed vector DB
- Model access: provider abstraction to support Bedrock, Azure OpenAI, or self hosted models
- Prompt management: templates, versioning, redaction hooks, evaluation datasets
- Guardrails: schema constrained outputs, safety filters, regex and classifier based PII scrubbing, allow deny lists
- Observability: prompt and response logs with redaction, feedback signals, latency and cost metrics, offline evaluations

## Security and Privacy for AI
- Do not send PHI to third party models without BAA; prefer Bedrock or Azure with BAA
- Redact and minimize inputs; separate compute per environment and tenant where needed
- Signed requests, key management via KMS and Secrets Manager, per feature rate limits
- Abuse prevention: user quotas, anomaly detection, CAPTCHA where needed

## Data Governance
- Dataset catalog, lineage, and retention; right to be forgotten flows applied to embeddings
- Human in the loop review for training and fine tuning datasets
- Access controls: role based and attribute based policies enforced at retrieval time

## MLOps and Quality
- Version models, prompts, and datasets; reproducible pipelines
- Batch and real time inference paths; canary and A B tests for new versions
- Evaluation metrics: helpfulness, accuracy, safety, groundedness; golden test sets
- Red teaming and jailbreak testing pre release; bias and fairness monitoring

## Roadmap
- Phase 0: instrument logging and feedback; choose providers; build gateway and guardrails
- Phase 1: RAG help assistant and content moderation; semantic search for docs
- Phase 2: summarization of updates and calendar; assistive authoring
- Phase 3: personalization and recommendations; proactive nudges with consent

## Open Questions
- Which provider and model families will be approved under compliance constraints
- Scope of PHI in AI features and consent model
- Retention and deletion SLAs for prompts and embeddings
