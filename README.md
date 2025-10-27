# Awesome Prompt Engineering [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A curated list of awesome prompt engineering resources, tools, techniques, and best practices for working with Large Language Models (LLMs)

Prompt engineering is the art and science of crafting effective inputs to get the best outputs from AI language models like GPT-4, Claude, Gemini, and others. This list covers everything from fundamental techniques to advanced strategies.

## Contents

- [Learning Resources](#learning-resources)
  - [Courses & Tutorials](#courses--tutorials)
  - [Books](#books)
  - [Research Papers](#research-papers)
  - [Guides & Documentation](#guides--documentation)
- [Core Techniques](#core-techniques)
  - [Zero-Shot Prompting](#zero-shot-prompting)
  - [Few-Shot Prompting](#few-shot-prompting)
  - [Chain-of-Thought (CoT)](#chain-of-thought-cot)
  - [Tree of Thoughts](#tree-of-thoughts)
  - [ReAct](#react)
- [Advanced Techniques](#advanced-techniques)
  - [Self-Consistency](#self-consistency)
  - [Constitutional AI](#constitutional-ai)
  - [Prompt Chaining](#prompt-chaining)
  - [Meta-Prompting](#meta-prompting)
- [Tools & Frameworks](#tools--frameworks)
  - [Prompt Testing & Optimization](#prompt-testing--optimization)
  - [Prompt Libraries](#prompt-libraries)
  - [Development Tools](#development-tools)
- [Prompt Templates](#prompt-templates)
  - [Code Generation](#code-generation)
  - [Data Analysis](#data-analysis)
  - [Content Creation](#content-creation)
  - [Reasoning & Problem Solving](#reasoning--problem-solving)
- [Model-Specific Resources](#model-specific-resources)
  - [OpenAI GPT](#openai-gpt)
  - [Anthropic Claude](#anthropic-claude)
  - [Google Gemini](#google-gemini)
  - [Open Source Models](#open-source-models)
- [Community & Discussions](#community--discussions)
- [Related Lists](#related-lists)
- [Contributing](#contributing)

## Learning Resources

### Courses & Tutorials

- [OpenAI Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering) - Official guide from OpenAI
- [Anthropic Prompt Engineering Guide](https://docs.anthropic.com/claude/docs/prompt-engineering) - Best practices for Claude
- [Prompt Engineering Guide by DAIR.AI](https://www.promptingguide.ai/) - Comprehensive community-driven guide
- [Learn Prompting](https://learnprompting.org/) - Free course on prompt engineering
- [DeepLearning.AI ChatGPT Prompt Engineering](https://www.deeplearning.ai/short-courses/chatgpt-prompt-engineering-for-developers/) - Course by Andrew Ng
- [Brex's Prompt Engineering Guide](https://github.com/brexhq/prompt-engineering) - Practical guide with examples

### Books

- [The Prompt Engineering Handbook](https://promptengineering.org/) - Comprehensive handbook on techniques
- [Prompt Engineering for LLMs](https://www.oreilly.com/library/view/prompt-engineering-for/9781098156046/) - O'Reilly book

### Research Papers

- [Chain-of-Thought Prompting](https://arxiv.org/abs/2201.11903) - Elicits reasoning in LLMs
- [Tree of Thoughts](https://arxiv.org/abs/2305.10601) - Deliberate problem solving with LLMs
- [ReAct: Synergizing Reasoning and Acting](https://arxiv.org/abs/2210.03629) - Combining reasoning and actions
- [Self-Consistency Improves Chain of Thought Reasoning](https://arxiv.org/abs/2203.11171) - Sampling multiple reasoning paths
- [Constitutional AI](https://arxiv.org/abs/2212.08073) - Self-improvement through AI feedback
- [Large Language Models are Zero-Shot Reasoners](https://arxiv.org/abs/2205.11916) - "Let's think step by step"
- [Prompt Injection Attacks](https://arxiv.org/abs/2302.12173) - Security considerations

### Guides & Documentation

- [Prompting Techniques](https://github.com/openai/openai-cookbook/blob/main/techniques_to_improve_reliability.md) - OpenAI cookbook
- [Prompt Engineering Best Practices](https://help.openai.com/en/articles/6654000-best-practices-for-prompt-engineering-with-openai-api) - OpenAI best practices
- [Claude Prompt Library](https://docs.anthropic.com/claude/prompt-library) - Curated prompts from Anthropic
- [Awesome ChatGPT Prompts](https://github.com/f/awesome-chatgpt-prompts) - Community-curated prompts

## Core Techniques

### Zero-Shot Prompting

Direct prompting without examples - asking the model to perform a task with just instructions.

**Example:**
```
Translate the following English text to French: "Hello, how are you?"
```

**Best for:** Simple, well-defined tasks that don't require specific formatting or style.

### Few-Shot Prompting

Providing examples before asking the model to perform the task.

**Example:**
```
Translate English to French:

English: Hello
French: Bonjour

English: Goodbye
French: Au revoir

English: Thank you
French: [model completes]
```

**Best for:** Tasks requiring specific formatting, style, or complex patterns.

### Chain-of-Thought (CoT)

Encouraging the model to show its reasoning process step-by-step.

**Example:**
```
Q: Roger has 5 tennis balls. He buys 2 more cans of tennis balls.
Each can has 3 tennis balls. How many tennis balls does he have now?

A: Let's think step by step:
1. Roger starts with 5 tennis balls
2. He buys 2 cans, each with 3 balls
3. That's 2 × 3 = 6 new balls
4. Total: 5 + 6 = 11 tennis balls
```

**Best for:** Complex reasoning, math problems, multi-step tasks.

### Tree of Thoughts

Exploring multiple reasoning paths and evaluating them.

**Best for:** Complex problem-solving requiring exploration of alternatives.

### ReAct

Combining reasoning with action-taking (tool use).

**Best for:** Tasks requiring external information or actions (web search, calculations, etc.).

## Advanced Techniques

### Self-Consistency

Generating multiple reasoning paths and selecting the most consistent answer.

**Implementation:**
1. Generate multiple chain-of-thought responses
2. Extract final answers from each
3. Use majority voting or consistency checking

### Constitutional AI

Using AI to critique and improve its own outputs based on principles.

**Example:**
```
Initial response: [model output]

Please critique the above response for:
1. Accuracy
2. Completeness
3. Clarity

Then provide an improved version.
```

### Prompt Chaining

Breaking complex tasks into a sequence of simpler prompts.

**Example:**
```
Prompt 1: "Summarize this article"
Prompt 2: "Extract key insights from: [summary]"
Prompt 3: "Create action items based on: [insights]"
```

### Meta-Prompting

Asking the model to generate or improve prompts.

**Example:**
```
I want to use an LLM to analyze customer feedback.
Generate an effective prompt for this task that:
1. Extracts sentiment
2. Identifies key themes
3. Suggests improvements
```

## Tools & Frameworks

### Prompt Testing & Optimization

- [LangChain](https://github.com/langchain-ai/langchain) - Framework for developing LLM applications
- [LangSmith](https://www.langchain.com/langsmith) - Testing and monitoring for LLM apps
- [PromptFoo](https://github.com/promptfoo/promptfoo) - Test and evaluate LLM outputs
- [OpenAI Evals](https://github.com/openai/evals) - Framework for evaluating LLMs
- [Weights & Biases Prompts](https://wandb.ai/site/prompts) - Track and version prompts
- [Humanloop](https://humanloop.com/) - Prompt engineering IDE
- [PromptLayer](https://promptlayer.com/) - Prompt management and tracking

### Prompt Libraries

- [LangChain Hub](https://smith.langchain.com/hub) - Discover and share prompts
- [FlowGPT](https://flowgpt.com/) - Community prompt marketplace
- [PromptBase](https://promptbase.com/) - Marketplace for prompts
- [ShareGPT](https://sharegpt.com/) - Share ChatGPT conversations

### Development Tools

- [LangChain](https://github.com/langchain-ai/langchain) - Python/JS framework for LLM apps
- [LlamaIndex](https://github.com/run-llama/llama_index) - Data framework for LLM apps
- [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Microsoft's LLM SDK
- [Haystack](https://github.com/deepset-ai/haystack) - NLP framework with LLM support
- [Guidance](https://github.com/guidance-ai/guidance) - Control LLM generation
- [LMQL](https://lmql.ai/) - Query language for LLMs

## Prompt Templates

### Code Generation

**Debug Code:**
```
I have the following code that's not working:

```python
[your code]
```

Error: [error message]

Please:
1. Identify the bug
2. Explain why it's happening
3. Provide the corrected code
```

**Code Review:**
```
Review this code for:
- Best practices
- Performance issues
- Security concerns
- Readability

```python
[your code]
```

Provide specific suggestions for improvement.
```

### Data Analysis

**Exploratory Analysis:**
```
Analyze this dataset and provide:
1. Summary statistics
2. Key patterns or trends
3. Notable outliers or anomalies
4. Recommendations for deeper analysis

Dataset: [data or description]
```

### Content Creation

**Blog Post Structure:**
```
Write a blog post about [topic] with:
- Engaging introduction
- 3-5 main sections with subheadings
- Practical examples
- Actionable takeaways
- Conclusion

Target audience: [description]
Tone: [professional/casual/technical/etc.]
Length: ~1000 words
```

### Reasoning & Problem Solving

**Structured Problem-Solving:**
```
Solve this problem using structured reasoning:

Problem: [description]

Please:
1. Restate the problem in your own words
2. Identify key constraints and requirements
3. Break down into sub-problems
4. Solve each sub-problem
5. Synthesize the final solution
6. Verify the solution meets all requirements
```

## Model-Specific Resources

### OpenAI GPT

- [GPT-4 System Card](https://cdn.openai.com/papers/gpt-4-system-card.pdf) - Capabilities and limitations
- [OpenAI API Best Practices](https://platform.openai.com/docs/guides/production-best-practices)
- [Function Calling Guide](https://platform.openai.com/docs/guides/function-calling)
- [GPT-4 Prompt Engineering](https://github.com/openai/openai-cookbook)

**GPT-4 Specific Tips:**
- Use system messages effectively for role-setting
- Leverage function calling for structured outputs
- Temperature 0.7-1.0 for creative tasks, 0-0.3 for factual

### Anthropic Claude

- [Claude Prompt Engineering](https://docs.anthropic.com/claude/docs/intro-to-prompting)
- [Claude Best Practices](https://docs.anthropic.com/claude/docs/prompt-engineering)
- [Extended Thinking with Claude](https://docs.anthropic.com/claude/docs/extended-thinking)

**Claude Specific Tips:**
- Use XML tags for structure: `<document>`, `<example>`, etc.
- Leverage extended thinking for complex reasoning
- Constitutional AI principles built-in

### Google Gemini

- [Gemini Prompting Guide](https://ai.google.dev/docs/prompt_best_practices)
- [Multimodal Prompting](https://ai.google.dev/tutorials/prompting_with_media)

**Gemini Specific Tips:**
- Excellent at multimodal inputs (text + images)
- Long context window (up to 1M tokens)
- Strong at code generation and analysis

### Open Source Models

- [Llama 2 Prompting Guide](https://replicate.com/blog/how-to-prompt-llama)
- [Mistral AI Documentation](https://docs.mistral.ai/)
- [Prompt Engineering for Open Source LLMs](https://huggingface.co/blog/how-to-generate)

## Community & Discussions

- [r/PromptEngineering](https://www.reddit.com/r/PromptEngineering/) - Reddit community
- [LangChain Discord](https://discord.gg/langchain) - LangChain community
- [OpenAI Forum](https://community.openai.com/) - Official OpenAI discussions
- [Anthropic Discord](https://discord.gg/anthropic) - Claude community
- [PromptHero](https://prompthero.com/) - Prompt sharing platform

## Related Lists

- [awesome-chatgpt](https://github.com/humanloop/awesome-chatgpt) - ChatGPT resources
- [awesome-chatgpt-prompts](https://github.com/f/awesome-chatgpt-prompts) - Prompt collection
- [awesome-llm](https://github.com/Hannibal046/Awesome-LLM) - LLM resources
- [awesome-langchain](https://github.com/kyrolabs/awesome-langchain) - LangChain resources
- [awesome-gpt4](https://github.com/radi-cho/awesome-gpt4) - GPT-4 specific resources

## Contributing

Contributions are welcome! Please read the [contribution guidelines](CONTRIBUTING.md) first.

- Submit new resources via pull request
- Report broken links or outdated information via issues
- Suggest new categories or improvements

## License

[![CC0](https://licensebuttons.net/p/zero/1.0/88x31.png)](https://creativecommons.org/publicdomain/zero/1.0/)

To the extent possible under law, [Tyson Cung](https://github.com/tysoncung) has waived all copyright and related or neighboring rights to this work.
