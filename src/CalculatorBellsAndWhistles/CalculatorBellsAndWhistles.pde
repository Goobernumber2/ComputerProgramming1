//Rebecca Jackson | oct 7 2026 | Calculator plan
String displayVal;
float l, r, result;
char op;
boolean left;
boolean newEntry;
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];



void setup() {
  size(325, 550);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  newEntry = true;
  numButtons[0] = new Button(100, 325, 50, 50, '0', 128, 140);
  numButtons[1] = new Button(25, 100, 50, 50, '1', 128, 140);
  numButtons[2] = new Button(100, 100, 50, 50, '2', 128, 140);
  numButtons[3] = new Button(175, 100, 50, 50, '3', 128, 140);
  numButtons[4] = new Button(25, 175, 50, 50, '4', 128, 140);
  numButtons[5] = new Button(100, 175, 50, 50, '5', 128, 140);
  numButtons[6] = new Button(175, 175, 50, 50, '6', 128, 140);
  numButtons[7] = new Button(25, 250, 50, 50, '7', 128, 140);
  numButtons[8] = new Button(100, 250, 50, 50, '8', 128, 140);
  numButtons[9] = new Button(175, 250, 50, 50, '9', 128, 140);

  opButtons[0] = new Button(250, 100, 50, 50, '+', 128, 140);
  opButtons[1] = new Button(250, 175, 50, 50, '-', 128, 140);
  opButtons[2] = new Button(250, 250, 50, 50, '/', 128, 140);
  opButtons[3] = new Button(250, 325, 50, 50, 'x', 128, 140);
  opButtons[4] = new Button(25, 400, 50, 50, '+', 128, 140);
  opButtons[5] = new Button(250, 400, 50, 50, '-', 128, 140);
  opButtons[6] = new Button(250, 475, 50, 50, '=', 128, 140);
  opButtons[7] = new Button(25, 325, 50, 50, '.', 128, 140);
  opButtons[8] = new Button(175, 325, 50, 50, 'B', 128, 140);
  opButtons[9] = new Button(100, 400, 50, 50, 'R', 128, 140);
  opButtons[10] = new Button(175, 400, 50, 50, 'G', 128, 140);
  opButtons[11] = new Button(175, 475, 50, 50, 'Y', 128, 140);
  opButtons[12] = new Button(25, 475, 125, 50, 'C', 128, 140);
}

void draw() {
  background(235);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
  updateDisplay();
}

void updateDisplay() {
  //background shape
  rectMode(CORNER);
  rect(20, 20, width-40, 60, 10);
  //Overlay text
  fill(0);
  textAlign(RIGHT);
  text(displayVal, width-30, 40);
}
void mouseReleased() {
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover()) {
      String digit = str(numButtons[i].label);

      if (newEntry || displayVal.equals("0.0")) {
        displayVal = digit;
        newEntry = false;
      } else {
        displayVal += digit;
      }

      if (left == true) {
        l = float(displayVal);
      } else {
        r = float(displayVal);
      }
    }
  }
  //Op buttons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      char clicked = (opButtons[i].label);

      if (clicked == '=') {
        performCalc();
      } else if (clicked == '+' || clicked == '-' ||
        clicked == 'x' || clicked == '+') {
        op = clicked;
        left = false;
        newEntry = true;
        displayVal = str(op);
      } else if (clicked == 'B') {
        background(50,152,224);
      } else if (clicked == 'R') {
        background(219,64,64);
      } else if (clicked == 'G') {
        background(94,217,67);
      } else if (clicked == 'Y') {
        background(237,232,77);
      }
    }
    //else {
    //  displayVal = displayVal + (opButtons[i].label);
    //}
  }
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  } else {
    return;
  }

  displayVal = str(result);
  l = result;
  r = 0.0;
  left = true;
}

void keyPressed() {
  if (key >= '0' && key <= '9') {
    handleEvent(key, true);
  }
}

void handleEvent (char val, boolean isNum) {
   //if (newEntry || displayVal.equals("0.0")) {
   //     displayVal = digit;
   //     newEntry = false;
   //   } else {
   //     displayVal += digit;
   //   }

   //   if (left == true) {
   //     l = float(displayVal);
   //   } else {
   //     r = float(displayVal);
   //   }
}
