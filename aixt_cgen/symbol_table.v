// Project Name: Aixt project, https://github.com/fermarsan/aixt.git
// File Name: symbol_table.v
// Author: Fernando Martínez Santa
// Date: 2023-2024
// License: MIT
//
// Description: print the table of all symbols.
module aixt_cgen

import v.ast

fn (mut gen Gen) symbol_table(scope ast.Scope) string {
	mut msg := ''
	println('+'.repeat(25))
	for key, val in scope.objects {
		// msg += '${val.name.after_char(`.`)} -- ${gen.kind_and_type(val)}\n'
		msg += '${key} -- ${gen.kind_and_type(val)}\n'
		// println(val)
	}
	println('-'.repeat(25))
	for child in scope.children {
		msg += gen.symbol_table(child) 
	}
	return msg
}