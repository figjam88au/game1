#!/usr/bin/env perl
use strict;
use warnings;
use autodie;

# Program by Brett Wilson 
# Version 0.0.5.201611

our $playername;
our $playerhp; #current health
our $playerlevel;
our $enemyhp; #current enemy health
our $enemy;	#enemy number
our $enemyname; #enemy name
our $enemyattack; #attack name
our $enemydamage; #damage from attack
our $move = "s";		#x, c and q are used
our $validmove;		#valid message
our $randenemy;		#number of enemy in array



#code Starts here
intro ();			#initial dialogue
setplayer ();		#sets and display player
setenemy ();		#set and display enemy
while ($move ne "q" and $enemyhp >= 1) {
	battle ();
}
victory ();


#subs
sub intro {
	print "This is my Game\n", "set in 2060\n", "\n";
}


sub setplayer {
	print "What is your name?\n";
	$playername = <>;		# lets user set what playername is.
	print "\n", "Player 1 is ", "$playername";
	chomp $playername;
	
	$playerlevel = 1;		# sets default player level to 1
	$playerhp = 5;
	print "$playername is Level $playerlevel with $playerhp health\n", "\n";
	print "Your adventure begins...\n","\n";
}


sub setenemy {
	$randenemy = int(rand(3)); #random Whole number between 0-3
	my @AoA = (
		[ "Cat", 3, "Claw", 2 ], #Name, HP, Attack, Damage
		[ "Dog", 5, "Bite", 2 ],
		[ "Rat", 2, "Squeek", 1 ],
	);
	$enemyname = $AoA[$randenemy][0];
	$enemyhp = $AoA[$randenemy][1];
	$enemyattack = $AoA[$randenemy][2];
	$enemydamage = $AoA[$randenemy][3];
	print "An evil $enemyname approaches\n", "It has $enemyhp hp\n", "\n";
}


sub battle {
#your turn
	print "Your health is $playerhp\n";
	print "Push x to punch\n", "Puch c to kick\n", "Push q to exit\n";
	$validmove = "That is not a vailid move: Loose a turn\n";
	$move = <>;
	chomp $move;
	if ($move eq 'x') {
		$enemyhp = $enemyhp - 1; 
		$validmove = "\n";
		print "$playername uses Punch and does 1 damage\n";
	}
	if ($move eq 'c') {
		$enemyhp = $enemyhp - 2; 
		$validmove = "\n";
		print "$playername uses Kick and does 2 damage\n";
	}
	print $validmove;			#print valid message

#enemy turn
	print "Enemy hp is $enemyhp\n";
	if ($enemyhp > 0 and $move ne 'q'){
		print "The $enemyname uses $enemyattack\n";
		$playerhp = $playerhp - $enemydamage;
		print "$enemyattack does $enemydamage damage to $playername\n", "\n";
	}
}


sub victory {
	if ($move ne "q" and $enemyname eq "Cat" and $enemyhp lt 1){			
		print "Victory\n";			#victory if quit by winning
		print "you have killed an animal in cold blood, you will now be arrested\n";
	} elsif ($move ne "q" and $enemyhp < 1){			
		print "Victory\n";			#victory if quit by winning
	}
}

