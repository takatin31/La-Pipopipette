public class Rect
{
	int x, y;
	int col;
	boolean up, down, left, right;
	static final int rectSize = 80;

	Rect(int x, int y)
	{
		this.x = x;
		this.y = y;
		col = 0;
		up = false;
		down = false;
		left = false;
		right = false;
	}

	void validate()
	{
		if (this.isFull())
		{
			Cubes_game.still = true;
			if (Cubes_game.turn)
			{
				Cubes_game.scoreBlue++;
				if (Cubes_game.scoreBlue >= Cubes_game.nbrL*Cubes_game.nbrC/2)
				{
					Cubes_game.win = true;
				}
				col = 1;
			}
			else
			{
				Cubes_game.scoreGreen++;
				if (Cubes_game.scoreGreen >= Cubes_game.nbrL*Cubes_game.nbrC/2)
				{
					Cubes_game.win = true;
				}
				col = 2;
			}
		}
	}

	boolean isFull()
	{
		return (up && down && left && right);
	}

	void rectClickedRight()
	{
		right = true;
		validate();
	}

	
	void rectClickedLeft()
	{
		left = true;
		validate();
	}
	
	void rectClickedUp()
	{
		up = true;
		validate();
	}

	void rectClickedDown()
	{
		down = true;
		validate();
	}


	void draw()
	{
		if (col == 0)
		{
			noFill();
		}
		else 
		{
			if (col == 1)
				fill(#1025EF);
				else {
						fill(#088905);
					}	
		}

		strokeWeight(3);
		if (Cubes_game.turn)
			stroke(#1025EF);
		else 
			stroke(#088905);
		rect(x, y, rectSize, rectSize);

		strokeWeight(5);
		stroke(0);

		if (up)
		{
			line(x, y, x + rectSize, y);
		}

		if (down)
		{
			line(x, y + rectSize, x + rectSize, y + rectSize);
		}

		if (left)
		{
			line(x, y, x, y + rectSize);
		}

		if (right)
		{
			line(x + rectSize, y, x + rectSize, y + rectSize);
		}

		ellipse(x, y, 3, 3);
		ellipse(x + rectSize, y, 3, 3);
		ellipse(x, y + rectSize, 3, 3);
		ellipse(x + rectSize, y + rectSize, 3, 3);
	}

}
