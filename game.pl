#!/usr/bin/env perl
use Modern::Perl '2015';
use autodie;

use Win32::Console;						#allows cls to clear screen


our $playername;
our $playerhp; #current health
our $playerlevel;
our $enemyhp; #current enemy health
our $enemy;	#enemy number
our $enemyname; #enemy name
our $move = "s";		#attack option x
our $validmove = "no";
our $randenemy;


my $OUT = Win32::Console->new(STD_OUTPUT_HANDLE);
my $clear_string = $OUT->Cls;



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
	print $clear_string, "\n";
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
		[ "Rat", 2, "bart", 1 ],
	);
	$enemyname = $AoA[$randenemy][0];
	$enemyhp = $AoA[$randenemy][1];
	print "An evil $enemyname approaches\n", "It has $enemyhp hp\n", "\n";
}


sub battle {
	print "Push x to punch\n", "Puch c to kick\n", "Push q to exit\n";
	$move = <>;
	chomp $move;
	if ($move eq 'x') {$enemyhp = $enemyhp - 1};
	if ($move eq 'c') {$enemyhp = $enemyhp - 2};
	print "enemy hp is $enemyhp \n", "\n";
}


sub victory {
	if ($move ne "q" and $enemyname eq "Cat"){			#victory if quit by winning
		print "Victory\n";
		print "you have killed an animal in cold blood, you will now be arrested\n";
	} elsif ($move ne "q"){			#victory if quit by winning
		print "Victory\n";
	}
	
}
