return {
  colorscheme = "monokai-pro",

  lsp = {
    config = {
      omnisharp = {
        OmniSharp_enable_import_completion = true,
        OmniSharp_enable_editorconfig_support = false,
        OmniSharp_organize_imports_on_format = true,
        OmniSharp_enable_roslyn_analyzers = false,
        on_attach = function(client, bufnr)
          client.server_capabilities.semanticTokensProvider = {
            full = vim.empty_dict(),
            legend = {
              tokenModifiers = { "static_symbol" },
              tokenTypes = {
                "comment",
                "excluded_code",
                "identifier",
                "keyword",
                "keyword_control",
                "number",
                "operator",
                "operator_overloaded",
                "preprocessor_keyword",
                "string",
                "whitespace",
                "text",
                "static_symbol",
                "preprocessor_text",
                "punctuation",
                "string_verbatim",
                "string_escape_character",
                "class_name",
                "delegate_name",
                "enum_name",
                "interface_name",
                "module_name",
                "struct_name",
                "type_parameter_name",
                "field_name",
                "enum_member_name",
                "constant_name",
                "local_name",
                "parameter_name",
                "method_name",
                "extension_method_name",
                "property_name",
                "event_name",
                "namespace_name",
                "label_name",
                "xml_doc_comment_attribute_name",
                "xml_doc_comment_attribute_quotes",
                "xml_doc_comment_attribute_value",
                "xml_doc_comment_cdata_section",
                "xml_doc_comment_comment",
                "xml_doc_comment_delimiter",
                "xml_doc_comment_entity_reference",
                "xml_doc_comment_name",
                "xml_doc_comment_processing_instruction",
                "xml_doc_comment_text",
                "xml_literal_attribute_name",
                "xml_literal_attribute_quotes",
                "xml_literal_attribute_value",
                "xml_literal_cdata_section",
                "xml_literal_comment",
                "xml_literal_delimiter",
                "xml_literal_embedded_expression",
                "xml_literal_entity_reference",
                "xml_literal_name",
                "xml_literal_processing_instruction",
                "xml_literal_text",
                "regex_comment",
                "regex_character_class",
                "regex_anchor",
                "regex_quantifier",
                "regex_grouping",
                "regex_alternation",
                "regex_text",
                "regex_self_escaped_character",
                "regex_other_escape",
              },
            },
            range = true,
          }
        end,
      },
    },
  },

  dap = {
    adapters = {
      coreclr = {
        type = "executable",
        command = "/home/eduardo/.local/share/nvim/netcoredbg/netcoredbg",
        args = { "--interpreter=vscode" },
      }
    },
    configurations = {
      cs = {
        type = "coreclr",
        name = "launch-netcoredbg",
        request = "launch",
        program = function()
          ---@diagnostic disable-next-line: redundant-parameter
          return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end,
      },
    }
  },

  plugins = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require("catppuccin").setup {}
      end,
    },
    {
      "loctvl842/monokai-pro.nvim",
      config = function()
        require("monokai-pro").setup {
          filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
        }
      end
    },
  },
}
