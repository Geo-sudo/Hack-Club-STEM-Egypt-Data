import 'package:flutter/material.dart';
import './button.dart';
import 'package:function_tree/function_tree.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState()
  {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{

  String expression = "";
  String result = "";
  int count_paranthesis = 0;

  void replacePartOfExpression(int start, String replacer)
  {
    String s = "";

    for(int i = 0; i < expression.length; i++)
    {
        if(i == start)
        {
          s += replacer;
          try{
          s += expression.substring(i + replacer.length);
          }
          catch(e){};
          break;
        }
        else{
          s += expression[i];
        }
    }

    expression = s.replaceAll(' ', '');
  }

  void addToExpression(String s)
  {
    
    if(s == 'C') {
      expression = "";
      result=""; 
      count_paranthesis = 0;
      return;
    } 

    

    if(s == '=') {
      calculateExpression();
      if(result != 'Error')
      {
        expression = result.substring(2);
        result = '';
      }
      return;
    }
    
    
    if(s == 'DEL'){
      if(expression.length != 0)
        expression = expression.substring(0, expression.length - 1);
      else
        result = "";
      
      return;
    }

    if(s == '()' && count_paranthesis == 0)
    {
      expression += '(';
      count_paranthesis = 1;
    }
    else if(s == '()')
    {
      expression += ')';
      count_paranthesis = 0;
    }
    else if(s == 'X') {expression += '*';}
    else if(s == '%' || s == '+/-')
    {
      for(int i = expression.length - 1 ; ; i--)
      {
          bool valid = false;
          
          try{
            double.parse(expression[i]);
            valid = true;
          }
          catch(e)
          {
            try{
              if(expression[i] == '.')
              {
                valid = true;
              }
            }
            catch(e)
            {
              print(e);
            } 
          }
          


          if(valid == false)
          {

            if(s == '%')
            {
              String str = (double.parse(expression.substring(i + 1)) / 100).toString();
              if(str.contains('e'))
              {
                break;
              }
              print(str);
              replacePartOfExpression(i+1, str);
            }
            else
            {
              try{
                if(expression.substring(i-4,i+1) != '(-1)*')
                {
                  String str = '(-1)*' + expression.substring(i + 1);
                  replacePartOfExpression(i+1, str);
                }
                else
                {
                  String str = expression.substring(i + 1);
                  
                  replacePartOfExpression(i-4, str + ' ' * 5);
                }
              }
              catch(e)
              {
                
                  String str = '(-1)*' + expression.substring(i + 1);
                  replacePartOfExpression(i+1, str);
               
              
              }
              }

            break;
          }

      }
    }
    else
      expression += s;

    


    calculateExpression();
    
  }

  void calculateExpression()
  {
    try
    {
      num res = expression.interpret();
      result =  "= " + res.toString();
    }
    catch(e){
      result = "Error";
    }
  }

  @override
  Widget build(BuildContext ctx)
  {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title:Text("MOI\'S Calculator") ),
        body: Center(child: Column(
          
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 80,
              width: 320,
              
              child: Text(expression, style: TextStyle(fontSize: 24),)
            ),
            Container(
              alignment: Alignment.centerRight,
              height: 50,
              width: 320,
              child: Text(result, style: TextStyle(fontSize: 24))
            ),SizedBox(height:10),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right:21),

              child:MyButton.wh('DEL', (){setState((){addToExpression('DEL');}
                  );}, 80,50)
            ),SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                  MyButton('C', (){setState((){addToExpression('C');}
                  );}), SizedBox(width: 10),
                  MyButton('()', (){setState((){addToExpression('()');}
                  );}), SizedBox(width: 10),
                  MyButton('%', (){setState((){addToExpression('%');}
                  );}), SizedBox(width: 10),
                  MyButton('/', (){setState((){addToExpression('/');}
                  );})
                  ]
            ), SizedBox(height:10),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children:[
                  MyButton('7', (){setState((){addToExpression('7');}
                  );}), SizedBox(width: 10),
                  MyButton('8', (){setState((){addToExpression('8');}
                  );}), SizedBox(width: 10),
                  MyButton('9', (){setState((){addToExpression('9');}
                  );}), SizedBox(width: 10),
                  MyButton('X', (){setState((){addToExpression('X');}
                  );})
                  ]
            ), SizedBox(height:10),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children:[
                  MyButton('4', (){setState((){addToExpression('4');}
                  );}), SizedBox(width: 10), 
                  MyButton('5', (){setState((){addToExpression('5');}
                  );}), SizedBox(width: 10),
                  MyButton('6', (){setState((){addToExpression('6');}
                  );}), SizedBox(width: 10),
                  MyButton('-', (){setState((){addToExpression('-');}
                  );})
                  ]
            ), SizedBox(height:10),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children:[
                  MyButton('1', (){setState((){addToExpression('1');}
                  );}), SizedBox(width: 10),
                  MyButton('2', (){setState((){addToExpression('2');}
                  );}), SizedBox(width: 10),
                  MyButton('3', (){setState((){addToExpression('3');}
                  );}), SizedBox(width: 10),
                  MyButton('+', (){setState((){addToExpression('+');}
                  );})
                  ]
            ), SizedBox(height:10),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton('+/-', (){setState((){addToExpression('+/-');}
                  );}), SizedBox(width: 10),
                  MyButton('0', (){setState((){addToExpression('0');}
                  );}), SizedBox(width: 10),
                  MyButton('.', (){setState((){addToExpression('.');}
                  );}), SizedBox(width: 10),
                  MyButton('=', (){setState((){addToExpression('=');}
                  );})
                  ]
              )
          ],
          
          )
        )),
      theme: ThemeData(primarySwatch: Colors.deepPurple)
    );
  }
}