import std.stdio;
import std.random : dice;
import std.conv : to;
import std.string: chomp;

enum CellState {
	EMPTY = "empty",
	CROSS = "cross",
	CIRCLE = "circle"
}

void printBoard(CellState[]board) {
	writeln(board[0], "|", board[1], "|", board [2]);
	writeln("-------------------------------------");
	writeln(board[3], "|", board[4], "|", board [5]);
	writeln("-------------------------------------");
	writeln(board[6], "|", board[7], "|", board [8]);
}

bool check_game_state(CellState[]board) {
	// TODO for next time :)
	return false;
}

void main()
{	
	CellState[9] board;

	printBoard(board);
	bool still_playing = true;
	auto current_player = dice(0.5, 0.5);
	auto player_symbol = [
		CellState.CROSS,
		CellState.CIRCLE
	];
	writeln("Player ", current_player+1, " will start");
	while(still_playing) {
		write("Player ", current_player+1, " your move please: ");
		auto current_move = to!int(readln().chomp);
		writeln("Player ", current_player+1, " moves ", current_move);
		if(board[current_move] == CellState.EMPTY) {
			board[current_move] = player_symbol[current_player];
		} else {
			writeln("You can't play here!");
			continue;
		}
		printBoard(board);
		current_player = current_player==0?1:0;
		still_playing = check_game_state(board);
	}
}
