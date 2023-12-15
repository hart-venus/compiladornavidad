
//----------------------------------------------------
// The following code was generated by CUP v0.11b 20160615 (GIT 4ac7450)
//----------------------------------------------------

package com.wanderariel;

import java_cup.runtime.*;
import java_cup.runtime.XMLElement;

/** CUP v0.11b 20160615 (GIT 4ac7450) generated parser.
  */
@SuppressWarnings({"rawtypes"})
public class parser extends java_cup.runtime.lr_parser {

 public final Class getSymbolContainer() {
    return sym.class;
}

  /** Default constructor. */
  @Deprecated
  public parser() {super();}

  /** Constructor which sets the default scanner. */
  @Deprecated
  public parser(java_cup.runtime.Scanner s) {super(s);}

  /** Constructor which sets the default scanner. */
  public parser(java_cup.runtime.Scanner s, java_cup.runtime.SymbolFactory sf) {super(s,sf);}

  /** Production table. */
  protected static final short _production_table[][] = 
    unpackFromStrings(new String[] {
    "\000\026\000\002\002\004\000\002\002\003\000\002\003" +
    "\003\000\002\003\003\000\002\003\003\000\002\003\003" +
    "\000\002\003\003\000\002\004\003\000\002\004\003\000" +
    "\002\004\003\000\002\004\003\000\002\004\003\000\002" +
    "\004\003\000\002\005\003\000\002\005\004\000\002\006" +
    "\004\000\002\007\007\000\002\007\010\000\002\011\003" +
    "\000\002\011\005\000\002\012\004\000\002\010\004" });

  /** Access to production table. */
  public short[][] production_table() {return _production_table;}

  /** Parse-action table. */
  protected static final short[][] _action_table = 
    unpackFromStrings(new String[] {
    "\000\033\000\004\100\006\001\002\000\004\052\034\001" +
    "\002\000\004\002\032\001\002\000\014\027\016\030\012" +
    "\031\014\032\015\033\013\001\002\000\006\002\ufff4\100" +
    "\ufff4\001\002\000\006\002\000\100\006\001\002\000\006" +
    "\002\ufff3\100\ufff3\001\002\000\004\026\ufffe\001\002\000" +
    "\004\026\ufffb\001\002\000\004\026\ufffd\001\002\000\004" +
    "\026\ufffc\001\002\000\004\026\uffff\001\002\000\004\026" +
    "\020\001\002\000\004\046\021\001\002\000\016\027\016" +
    "\030\012\031\014\032\015\033\013\047\023\001\002\000" +
    "\004\026\031\001\002\000\004\052\ufff1\001\002\000\006" +
    "\047\026\075\027\001\002\000\006\047\uffef\075\uffef\001" +
    "\002\000\004\052\ufff0\001\002\000\014\027\016\030\012" +
    "\031\014\032\015\033\013\001\002\000\006\047\uffee\075" +
    "\uffee\001\002\000\006\047\uffed\075\uffed\001\002\000\004" +
    "\002\001\001\002\000\006\002\ufff2\100\ufff2\001\002\000" +
    "\004\053\035\001\002\000\006\002\uffec\100\uffec\001\002" +
    "" });

  /** Access to parse-action table. */
  public short[][] action_table() {return _action_table;}

  /** <code>reduce_goto</code> table. */
  protected static final short[][] _reduce_table = 
    unpackFromStrings(new String[] {
    "\000\033\000\012\002\004\005\007\006\006\007\003\001" +
    "\001\000\004\010\032\001\001\000\002\001\001\000\004" +
    "\003\016\001\001\000\002\001\001\000\006\006\010\007" +
    "\003\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\010\003\021" +
    "\011\023\012\024\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\006\003\021\012\027\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001" });

  /** Access to <code>reduce_goto</code> table. */
  public short[][] reduce_table() {return _reduce_table;}

  /** Instance of action encapsulation class. */
  protected CUP$parser$actions action_obj;

  /** Action encapsulation object initializer. */
  protected void init_actions()
    {
      action_obj = new CUP$parser$actions(this);
    }

  /** Invoke a user supplied parse action. */
  public java_cup.runtime.Symbol do_action(
    int                        act_num,
    java_cup.runtime.lr_parser parser,
    java.util.Stack            stack,
    int                        top)
    throws java.lang.Exception
  {
    /* call code in generated class */
    return action_obj.CUP$parser$do_action(act_num, parser, stack, top);
  }

  /** Indicates start state. */
  public int start_state() {return 0;}
  /** Indicates start production. */
  public int start_production() {return 0;}

  /** <code>EOF</code> Symbol index. */
  public int EOF_sym() {return 0;}

  /** <code>error</code> Symbol index. */
  public int error_sym() {return 1;}


  /** User initialization code. */
  public void user_init() throws java.lang.Exception
    {
 
    }

  /** Scan to get the next Symbol. */
  public java_cup.runtime.Symbol scan()
    throws java.lang.Exception
    {
 return lex.next_token(); 
    }


  Lexer lex;

  /**
  * Constructor de la clase parser
  * entrada: un lexer
  * salida: ninguna
  * restricciones: ninguna
  * objetivo: inicializar el lexer y el symbolFactory
  */
  public parser(Lexer lex) {
    this.lex = lex;
    this.symbolFactory = new DefaultSymbolFactory();
  }
  
  


/** Cup generated class to encapsulate user supplied action code.*/
@SuppressWarnings({"rawtypes", "unchecked", "unused"})
class CUP$parser$actions {


  /** 
  * funciones públicas de pruebas para el lexer, por ahora
  * solo imprimen en consola
  * entrada: ninguna
  * salida: ninguna
  * restricciones: ninguna
  * objetivo: imprimir en consola
  */
  public void hola() {
    System.out.println("Hola");
  }
  public void adios() {
    System.out.println("Adios");
  }

  private final parser parser;

  /** Constructor */
  CUP$parser$actions(parser parser) {
    this.parser = parser;
  }

  /** Method 0 with the actual generated action code for actions 0 to 300. */
  public final java_cup.runtime.Symbol CUP$parser$do_action_part00000000(
    int                        CUP$parser$act_num,
    java_cup.runtime.lr_parser CUP$parser$parser,
    java.util.Stack            CUP$parser$stack,
    int                        CUP$parser$top)
    throws java.lang.Exception
    {
      /* Symbol object for return from actions */
      java_cup.runtime.Symbol CUP$parser$result;

      /* select the action based on the action number */
      switch (CUP$parser$act_num)
        {
          /*. . . . . . . . . . . . . . . . . . . .*/
          case 0: // $START ::= navidad EOF 
            {
              Object RESULT =null;
		int start_valleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int start_valright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Object start_val = (Object)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		RESULT = start_val;
              CUP$parser$result = parser.getSymbolFactory().newSymbol("$START",0, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          /* ACCEPT */
          CUP$parser$parser.done_parsing();
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 1: // navidad ::= funciones_bolsa_navidena 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("navidad",0, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 2: // t_santa ::= t_int_colacho 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("t_santa",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 3: // t_santa ::= t_float_santa 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("t_santa",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 4: // t_santa ::= t_bool_noel 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("t_santa",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 5: // t_santa ::= t_char_pascuero 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("t_santa",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 6: // t_santa ::= t_string_kris 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("t_santa",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 7: // l_santa ::= l_int_colacho 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("l_santa",2, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 8: // l_santa ::= l_float_santa 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("l_santa",2, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 9: // l_santa ::= l_t_noel 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("l_santa",2, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 10: // l_santa ::= l_f_noel 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("l_santa",2, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 11: // l_santa ::= l_char_pascuero 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("l_santa",2, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 12: // l_santa ::= l_string_kris 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("l_santa",2, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 13: // funciones_bolsa_navidena ::= funcion_ayudante_santa 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("funciones_bolsa_navidena",3, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 14: // funciones_bolsa_navidena ::= funciones_bolsa_navidena funcion_ayudante_santa 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("funciones_bolsa_navidena",3, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 15: // funcion_ayudante_santa ::= def_funcion_trineo cuerpo_funcion_villancico 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("funcion_ayudante_santa",4, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 16: // def_funcion_trineo ::= function_chimenea t_santa id_persona p_abre_cuento p_cierra_cuento 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("def_funcion_trineo",5, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 17: // def_funcion_trineo ::= function_chimenea t_santa id_persona p_abre_cuento parametros_funcion_renos p_cierra_cuento 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("def_funcion_trineo",5, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 18: // parametros_funcion_renos ::= parametro_funcion_reno 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("parametros_funcion_renos",7, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 19: // parametros_funcion_renos ::= parametros_funcion_renos sep_regalo parametro_funcion_reno 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("parametros_funcion_renos",7, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 20: // parametro_funcion_reno ::= t_santa id_persona 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("parametro_funcion_reno",8, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 21: // cuerpo_funcion_villancico ::= cb_abre_regalo cb_cierra_regalo 
            {
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("cuerpo_funcion_villancico",6, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /* . . . . . .*/
          default:
            throw new Exception(
               "Invalid action number "+CUP$parser$act_num+"found in internal parse table");

        }
    } /* end of method */

  /** Method splitting the generated action code into several parts. */
  public final java_cup.runtime.Symbol CUP$parser$do_action(
    int                        CUP$parser$act_num,
    java_cup.runtime.lr_parser CUP$parser$parser,
    java.util.Stack            CUP$parser$stack,
    int                        CUP$parser$top)
    throws java.lang.Exception
    {
              return CUP$parser$do_action_part00000000(
                               CUP$parser$act_num,
                               CUP$parser$parser,
                               CUP$parser$stack,
                               CUP$parser$top);
    }
}

}
