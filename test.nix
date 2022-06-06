{ fromYaml ? ( import ./default.nix {} ).fromYaml }:
let

  eval  = expr: import ( builtins.toFile "__EXPR" expr );
  xeval = expr:
    let rsl = toString ( eval expr );
        elen = builtins.stringLength expr;
        splitC = if ( 60 < elen ) then "\n  " else "  ";
    in "( ${expr} )  ==>${splitC}${rsl}";
  
  checkMT = message: test:
    let rsl = test; in builtins.trace "\nchecking: ${message}" rsl;

  tryParseYaml = str:
    let mlp = ( builtins.match "\n" str ) != null;
        elen = builtins.stringLength rsl
        blockp = ( 60 < elen ) || mlp;
        splitC = if blockp then "\n  " else "  ";
        indented = builtins.replaceString ["\n"] ["\n  "] str;
        block = if blockp then indented else str;
        message = "parsing:${splitC}${block};
    in checkMT message ( fromYaml str );

  valids = [
    ''hey: there''
    ''hey: "there"''
    ''"hey": "there"''
    ''{ "hey": "there" }''
  ];

  testValids = null;

in {
  
}
