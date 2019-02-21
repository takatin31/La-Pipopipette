static int nbrL = 8, nbrC = 6;
Rect tabRect[] = new Rect[nbrL*nbrC];
static boolean turn = true; //true ==> blue turn
static boolean still = false;
static int scoreBlue = 0;
static int scoreGreen = 0;
static boolean win = false;

void setup()
{
	size(700, 660);
	for (int i = 0 ; i < nbrC ; i++)
	{
		for (int j = 0 ; j < nbrL ; j++)
		{
			tabRect[i*nbrL+j] = new Rect(10 + i * Rect.rectSize, 10 + j * Rect.rectSize);
		}
	}
	fillRects();
}

void draw()
{
	background(255);
	noFill();
	strokeWeight(2);
	stroke(0);
	rect(0, 0, 500, 658);
	rect(0, 0, width-2, height-2);
	for (int i = 0 ; i < nbrL*nbrC ; i++)
	{
		tabRect[i].draw();
	}
	drawMenu();
}

void drawMenu()
{
	strokeWeight(3);
	stroke(0);
	line(520, 0, 520, 660);

	textSize(24);
	fill(0);
	text("Score : ", 570, 50);
	fill(#1025EF);
	text("Blue : "+scoreBlue, 550, 90);
	fill(#088905);
	text("Green : "+scoreGreen, 550, 120);

	if (win)
	{
		if (turn)
		{
			fill(#1025EF);
		}
		else 
		{
			fill(#088905);
		}
		textSize(28);
		text("Winner", 560, 300);
	}
}

void fillRects()
{
	for (int i = 0 ; i < 30 ; i++)
	{
		int x = floor(random(0, nbrC));
		int y = floor(random(0, nbrL));
		int dir = floor(random(0, 4));

		switch (dir) {
			case 0:
				if (x > 0)
					tabRect[(x-1)*nbrL+y].rectClickedRight();
				if (x < nbrC)
					tabRect[x*nbrL+y].rectClickedLeft();
				break;
			case 1:
				if (x < nbrC - 1)
					tabRect[(x+1)*nbrL+y].rectClickedLeft();
				tabRect[x*nbrL+y].rectClickedRight();
				break;
			case 2:
				if (y > 0)
						tabRect[x*nbrL+y-1].rectClickedDown();
					if (y < nbrL)
						tabRect[x*nbrL+y].rectClickedUp();
				break;
			case 3:
				if (y < nbrL - 1)
						tabRect[x*nbrL+y+1].rectClickedUp();
					
					tabRect[x*nbrL+y].rectClickedDown();
				break;
		}
	}
}

void mouseClicked()
{
	boolean click = false;
	if (mouseX < 500 && !win)
	{
		int x = (mouseX - 10)/Rect.rectSize;
		int y = (mouseY - 10)/Rect.rectSize;
		still = false;

		if ((mouseX - 10)% 80 < 10 || (mouseX - 10)%80 > 70)
		{
			click = true;
			if((mouseX - 10)% 80 < 10)
			{
				if (x > 0)
					tabRect[(x-1)*nbrL+y].rectClickedRight();
				if (x < nbrC)
					tabRect[x*nbrL+y].rectClickedLeft();
			}
			else 
			{
				if (x < nbrC - 1)
					tabRect[(x+1)*nbrL+y].rectClickedLeft();
				tabRect[x*nbrL+y].rectClickedRight();
			}
		}
		else
		{
			if ((mouseY - 10)% 80 < 10 || (mouseY - 10)%80 > 70)
			{
				click = true;
				if((mouseY - 10)% 80 < 10)
				{
					if (y > 0)
						tabRect[x*nbrL+y-1].rectClickedDown();
					if (y < nbrL)
						tabRect[x*nbrL+y].rectClickedUp();
				}
				else 
				{
					if (y < nbrL - 1)
						tabRect[x*nbrL+y+1].rectClickedUp();
					tabRect[x*nbrL+y].rectClickedDown();
				}
			}	
		}

		if (!still && click)
		{
			turn = !turn;
		}
	}
	
	
}
