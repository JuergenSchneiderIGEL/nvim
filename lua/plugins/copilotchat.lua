return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      model = "gpt-5.3-codex",  -- 👈 set your preferred model here

      prompts = {

        ------------------------------------------------------------------
        -- 1. High-performance refactor
        ------------------------------------------------------------------
        SpeedCpp17 = {
          prompt = [[
Refactor the code in #selection for speed for C++-17.

Constraints:
- Use C++17 only.
- Avoid unnecessary allocations and copies.
- Prefer move semantics.
- Use std::string_view where appropriate.
- Reserve container capacity when beneficial.
- Prefer emplace over insert/push when meaningful.
- Reduce temporaries.
- Mark functions noexcept if safe.
- Keep code readable and maintainable.
- Add comments when appropriate to explain non-obvious optimizations.
- Add comments when appropriate to explain complex logic.

Explain what was improved and why.
]],
          description = "Refactor for speed (C++17)",
        },

        ------------------------------------------------------------------
        -- 2. STL modernization
        ------------------------------------------------------------------
        ModernizeSTL = {
          prompt = [[
Modernize the code in #selection using idiomatic C++17 STL.

- Prefer algorithms over manual loops.
- Use structured bindings.
- Replace raw loops with std::transform, std::find_if, std::accumulate, etc.
- Use auto appropriately.
- Remove raw pointers if possible.
- Prefer RAII patterns.
- Improve const-correctness.

Explain each modernization choice briefly.
]],
          description = "Modernize to idiomatic C++17",
        },

        ------------------------------------------------------------------
        -- 3. Memory optimization audit
        ------------------------------------------------------------------
        MemoryAudit = {
          prompt = [[
Perform a memory efficiency audit of the C++17 code in #selection.

Check for:
- Unnecessary copies
- Missing move operations
- Missing reserve() on containers
- Overuse of std::string instead of std::string_view
- Inefficient parameter passing
- Opportunities for constexpr
- Avoidable heap allocations

Rewrite improved code and explain improvements.
]],
          description = "Memory efficiency audit",
        },

        ------------------------------------------------------------------
        -- 4. Thread safety audit
        ------------------------------------------------------------------
        ThreadSafety = {
          prompt = [[
Analyze the C++17 code in the #selection for thread-safety.

Check for:
- Data races
- Missing const correctness
- Shared mutable state
- Unsafe static variables
- Need for std::mutex / std::lock_guard
- Atomic opportunities

If necessary, refactor to make it thread-safe.
Explain changes clearly.
]],
          description = "Thread-safety audit",
        },

        ------------------------------------------------------------------
        -- 5. noexcept & const correctness
        ------------------------------------------------------------------
        NoexceptConst = {
          prompt = [[
Improve const-correctness and noexcept usage in the C++17 code in the #selection.

- Mark methods const where applicable.
- Add noexcept where safe.
- Ensure exception guarantees are clear.
- Improve function signatures.

Provide the improved version and explain decisions.
]],
          description = "Improve noexcept + const correctness",
        },

        ------------------------------------------------------------------
        -- 6. API cleanup
        ------------------------------------------------------------------
        CleanAPI = {
          prompt = [[
Refactor the C++17 API in the #selection for clarity and maintainability.

- Improve naming
- Reduce duplication
- Improve encapsulation
- Prefer expressive types
- Remove unnecessary public surface
- Simplify logic
- Improve readability

Explain structural improvements.
]],
          description = "Clean up API design",
        },
      },
      mappings = {
        accept_diff = { normal = "ga", insert = "ga" },
      },
    },
    keys = {
      { "<leader>ar",
        function()
          require("CopilotChat").ask("/SpeedCpp17", {
            selection = require("CopilotChat.select").visual,
          })
        end,
        mode = "v", desc = "Refactor for speed" },
      { "<leader>am",
        function()
          require("CopilotChat").ask("/MondernizeSTL", {
            selection = require("CopilotChat.select").visual,
          })
        end,
        mode = "v", desc = "Modernize STL" },
      { "<leader>aM",
        function()
          require("CopilotChat").ask("/MemoryAudit", {
            selection = require("CopilotChat.select").visual,
          })
        end,
        mode = "v", desc = "Memory audit" },
      { "<leader>at",
        function()
          require("CopilotChat").ask("/ThreadSafety", {
            selection = require("CopilotChat.select").visual,
          })
        end,
        mode = "v", desc = "Thread safety audit" },
      { "<leader>an",
        function()
          require("CopilotChat").ask("/NoexceptConst", {
            selection = require("CopilotChat.select").visual,
          })
        end,
        mode = "v", desc = "Improve noexcept/const" },
      { "<leader>ac",
        function()
          require("CopilotChat").ask("/CleanAPI", {
            selection = require("CopilotChat.select").visual,
          })
        end,
        mode = "v", desc = "Clean API" },
    },
  },
}
