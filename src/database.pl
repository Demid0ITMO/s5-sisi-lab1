%%%%%%%%%%%%%%%%%%%%%% ФАКТЫ С 1 АРГУМЕНТОМ %%%%%%%%%%%%%%%%%%%%%%%

% Факты: Игры
game(minecraft).
game(fortnite).
game(pubg).
game(overwatch).
game(dnd).

% Факты: Жанры игр
genre(action).
genre(strategy).
genre(adventure).
genre(role_playing).
genre(sports).

% Факты: Платформы игр (где можно играть)
platform(pc).
platform(playstation).
platform(xbox).
platform(nintendo_switch).

% Факты: Режим игры
mode(single_player).
mode(multi_player).
mode(cooperative).
mode(competitive).

% Факты: Возрастной рейтинг
rating(e).
rating(e10).
rating(t).
rating(m).
rating(ao).

%%%%%%%%%%%%%%%%%%%%%% ФАКТЫ С 2 АРГУМЕНТАМИ %%%%%%%%%%%%%%%%%%%%%%

% Факты: Игра X имеет жанр Y
has_genre(minecraft, adventure).
has_genre(fortnite, action).
has_genre(pubg, action).
has_genre(overwatch, team_fighting).
has_genre(dnd, strategy).

% Факты: В игру X можно играть на Y
has_platform(minecraft, playstation).
has_platform(minecraft, pc).
has_platform(fortnite, playstation).
has_platform(pubg, pc).
has_platform(pubg, xbox).
has_platform(overwatch, nintendo_switch).
has_platform(dnd, pc).

% Факты: Игра X имеет Y режим
has_mode(minecraft, single_player).
has_mode(fortnite, multi_player).
has_mode(pubg, competitive).

% Факты: Игра Х имеет возрастное ограничение Y
has_rating(minecraft, e10).
has_rating(dnd, e10).
has_rating(fortnite, t).
has_rating(pubg, m).

% Факты: В игре X есть персонаж Y
has_character(minecraft, steve).
has_character(fortnite, default_skin).

%%%%%%%%%%%%%%%%%%%%%%%%%%%% ПРАВИЛА %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Является ли игра Game кооперативной ролевой игрой
cooperative_rpg_game(Game) :- has_mode(Game, cooperative), has_genre(Game, role_playing).

% Является ли игра Game взрослой (с рейтингом adults only) стратегией на xbox
adult_xbox_strategy_game(Game) :- 
    has_genre(Game, strategy), 
    has_platform(Game, xbox), 
    has_rating(Game, ao).

% Является ли игра Game мультиплеерным экшеном на консоли
team_based_console_game(Game) :- 
    has_genre(Game, action), 
    (has_platform(Game, playstation); has_platform(Game, nintendo_switch)), 
    has_mode(Game, multi_player).

% Является ли игра Game подходящей для детей
suitable_for_kids(Game) :- 
    (has_rating(Game, e); has_rating(Game, e10)),
    has_genre(Game, adventure),
    (has_platform(Game, pc); has_platform(Game, nintendo_switch)),
    has_mode(Game, single_player).

% Является ли игра Game подростковой дружелюбной игрой на платформе Platform
teen_friendly_game(Game, Platform) :- 
    (has_genre(Game, action); has_genre(Game, adventure)), 
    has_platform(Game, Platform),
    (has_mode(Game, single_player); has_mode(Game, multi_player)).
