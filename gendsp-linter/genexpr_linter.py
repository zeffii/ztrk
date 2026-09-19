import sys
import warnings
warnings.filterwarnings("ignore", category=FutureWarning)

from tree_sitter import Language, Parser

# This only needs to be done once, but it's safe to run every time.
GENEXPR_LANGUAGE = Language(r'C:\Users\zeffi\GITWORX\tree-sitter-genexpr\genexpr.dll', 'genexpr')

parser = Parser()
parser.set_language(GENEXPR_LANGUAGE)

# rulebook demo
RULES = {
    "peek":    {"min": 2, "max": 3, "msg": "peek() expects 2 or 3 arguments (buffer, channels, optional offset)"},
    "poke":    {"min": 3, "max": 3, "msg": "poke() expects 3 arguments (buffer, value, index)"},
    "delay":   {"min": 0, "max": 2, "msg": "delay() expects 0, 1, or 2 arguments"},
    "history": {"min": 0, "max": 2, "msg": "history() expects 0, 1, or 2 arguments"},
    "param":   {"min": 1, "max": 2, "msg": "param() expects 1 or 2 arguments"},
    "in":      {"min": 1, "max": 1, "msg": "in() expects 1 argument (inlet index)"},
    "out":     {"min": 1, "max": 1, "msg": "out() expects 1 argument (outlet index)"},
}

def analyze_file(filepath):
    with open(filepath, 'rb') as f:
        source_code = f.read()

    tree = parser.parse(source_code)
    root_node = tree.root_node

    def walk(node):
        # A call looks like: postfix_expression with object=identifier, field=call_member_expression
        if node.type == 'postfix_expression':
            obj = node.child_by_field_name('object')
            field = node.child_by_field_name('field')
            if obj and obj.type == 'identifier' and field and field.type == 'call_member_expression':
                func_name = obj.text.decode('utf-8')
                # Count children named 'arguments' on the call_member_expression
                args = field.children_by_field_name('arguments')
                arg_count = sum(1 for c in args if c.is_named)
                line_num = node.start_point[0] + 1
                print(f"Line {line_num}: {func_name}() called with {arg_count} argument(s)")

                if func_name in RULES:
                    rule = RULES[func_name]
                    if not (rule["min"] <= arg_count <= rule["max"]):
                        print(f"Line {line_num}: WARNING - {rule['msg']} (got {arg_count})")
                else:
                    print(f"Line {line_num}: {func_name}() called with {arg_count} argument(s)")

        for child in node.children:
            walk(child)

    walk(root_node)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python genexpr_linter.py <path_to_file.genexpr>")
        sys.exit(1)

    analyze_file(sys.argv[1])
