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


## AI Security

### Threats and Risks
- Prompt injection and goal hijacking; data exfiltration via tool use
- Training data poisoning; model supply chain compromise
- Sensitive data leakage in prompts or outputs; model inversion risks
- Toxic or unsafe outputs; policy non-compliance

### Controls
- Provider governance: use vendors with BAA (e.g., Bedrock/Azure) for PHI; isolate workloads per env/tenant
- Data minimization: redact PII/PHI; allowlist retrieval sources; policy checks pre and post generation
- Guardrails: schema constrained outputs, content filters, safety classifiers, allow/deny lists
- Tool/function calling: strict scoping, timeouts, quotas, and audit logs; secrets never exposed to models
- Network and egress: private endpoints, egress proxy with DLP, model egress controls
- Observability: full prompt/response logging with redaction; evaluations and abuse feedback
- Supply chain: verify model/image signatures; track versions/digests; SBOM for models where available

### LLM Strategy (Large and Small Models)
- Large hosted models for highest quality tasks with privacy and cost controls
- Small/local models for sensitive or offline tasks; quantized variants for efficiency
- Abstraction layer to switch providers/models; policy driven routing and fallback

### Integrations
- RAG gateway with pgvector and policy filtered retrieval
- Moderation and PII detection pre/post; human-in-the-loop for sensitive flows
- Evaluation gates in CI for prompts and tasks; red teaming before release
