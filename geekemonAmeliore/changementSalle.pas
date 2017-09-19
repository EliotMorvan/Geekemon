unit changementSalle;
//Cette unité contient les sous-programmes relatifs à la "zone intermédiaire"
//où le joueur décide ce qu'il souhaite faire.
//On y trouve également l'écran de chargement et la carte.
interface
uses Geekemon, Améliorations, System.SysUtils, Scénario, ETDDG, unitéCombat;
//////////////
procedure changementDeSalle (geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur ; nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofPc; quitter : integer);
//////////////////
procedure cafeteria (geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofPc; quitter : integer);
//////////////////////
procedure procETDDG (geekedex : arrayOfGeekemon;var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofPc; quitter : integer);
//////////////////
procedure salleSuivante (geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofPc; quitter : integer);
//////////////////////
procedure carte (geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur);
/////////////////////
procedure traineau(var k : integer);
///////////////////
procedure barre;
///////////////////
procedure carteSecretariat;



implementation

/////////////////////////////////////////////////////////
procedure changementDeSalle (geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofPc; quitter : integer);
//La procédure centrale. Le joueur peut aller à l'ETDDG, se promener ou aller à la cafétéria affronter des dresseurs.
var
  choixSalle : integer;
begin
 effacerEcran;
  couleurTexte(6);
  deplacerCurseurXY(15,0);
  writeln('                                    __         __                     ');
  deplacerCurseurXY(15,1);
  writeln('                                   /  |       |  \                    ');
  deplacerCurseurXY(15,2);
  writeln('                                 / `| |       | |'' \                 ');
  deplacerCurseurXY(15,3);
  writeln('                               /   /| |       | |\   \                ');
  deplacerCurseurXY(15,4);
  writeln('                             /    / | | ''.''.  | | \    \            ');
  deplacerCurseurXY(15,5);
  writeln('                           /     / _|_|__ \|__|_|_ \     \            ');
  deplacerCurseurXY(15,6);
  writeln('                         /      / /   _  \-/  _   \ \      \          ');
  deplacerCurseurXY(15,7);
  writeln('                       /.:::::./ /  /'' \.   ./ `\  \ \.:::::.\       ');
  deplacerCurseurXY(15,8);
  writeln('                      .:::::::/ |  |     | |     |  | \:::::::.       ');
  deplacerCurseurXY(15,9);
  writeln('                      \::::::/  | \|  mMM| |MMm  |/ |  \::::::/       ');
  deplacerCurseurXY(15,10);
  writeln('                      /~/~~~~   | -`_ MMM| |MMM _''- |    ~~~\~\      ');
  deplacerCurseurXY(15,11);
  writeln('                     '' ''        |     `::::::::''    |        ` `   ');
  deplacerCurseurXY(15,12);
  writeln('                                //\  / `::::::'' \  /\\                ');
  deplacerCurseurXY(15,13);
  writeln('                                   /''    ::::    `\       Woof!      ');
  deplacerCurseurXY(15,14);
  writeln('                                  |       ::       |   /              ');
  deplacerCurseurXY(15,15);
  writeln('                                 /     __/''`\__     \                ');
  deplacerCurseurXY(15,16);
  writeln('                                 | .--'' `-__-'' `--. |               ');
  deplacerCurseurXY(15,17);
  writeln('                                 |''                `|                ');
  deplacerCurseurXY(50,20);
  couleurTexte(15);
  attendre(1000);
  writeln ('Ou veux tu aller?');
  deplacerCurseurXY(50,22);
  attendre(500);
  writeln ('1. Etddg (Soin/Potion)');
  deplacerCurseurXY(50,23);
  attendre(500);
  writeln ('2. Salle suivante');
  deplacerCurseurXY(50,24);
  attendre(500);
  writeln ('3. Cafeteria (Affronter d''autres dresseurs)');
  deplacerCurseurXY(50,25);
  attendre(500);
  writeln ('4. Reprendre la quête');
  deplacerCurseurXY(50,26);
  attendre(500);
  choixSalle := readVerif(1,4);
  effacerEcran;
  if choixSalle = 1 then
  begin
    procETDDG (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
  end;
  if choixSalle = 2 then
  begin
     salleSuivante (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
  end;
  if choixSalle = 3 then
  begin
  cafeteria (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
  end;
  if choixSalle = 4 then
  begin
  quete(geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
  end;
end;

////////////////////////
procedure cafeteria (geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofPc; quitter : integer);
var
  choixCafeteria : integer;
begin
  writeln ('Vous êtes à la cafétéria, vous pouvez combattre d''autres dresseurs ou consulter votre position');
  writeln ('1. Combattre des dresseurs');
  //On laisse au joueur le choix de ne pas affronter de dresseurs.
  writeln ('2. Consulter votre emplacement');
  choixCafeteria := readVerif(1,2);
  writeln;
  if choixCafeteria = 1 then
  begin
    choixDresseur (geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
    changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
  end
  else
  if choixCafeteria = 2 then
  begin
    carte (geekedex, geekEquipe, nbPotion,DressEquipe);
    changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
  end;
end;

///////////////////////////////////////
procedure procETDDG (geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofPc; quitter : integer);
var
  choixETDDG : integer;
begin
  writeln('Bienvenue à l''ETDDG, ici vous pouvez soigner vos pokemons ou acheter des potions de soins.');
  writeln ('Que voulez vous faire?');
  //Le joueur peut accéder à la cafétéria depuis l'ETDDG
  writeln ('1. Aller à la Cafétéria');
  writeln ('2. Salle suivante');
  writeln ('3. Soigner mes geekemons');
  writeln ('4. Acheter des potions');
  writeln ('5. Consulter la carte');
  writeln ('6. Consulter le PC');
  ChoixETDDG := readVerif(1,6);
  writeln;
    if choixETDDG = 1 then
    begin
      cafeteria (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs,equipeStockage, quitter);
    end;
    if choixETDDG = 2 then
    begin
      salleSuivante (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
    end;
  if choixETDDG = 3 then
      begin
        soin (geekedex, geekEquipe, nbPotion, DressEquipe);
      end;
  if choixETDDG = 4 then
    begin
    nbPotion := potion(geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
    end;
  if choixETDDG = 5 then
  begin
     carte (geekedex, geekEquipe, nbPotion,DressEquipe);
  end;
  if choixETDDG = 6 then
  begin
     PC(geekedex, geekEquipe ,nbPotion, DressEquipe, nom1, avancement, nomdresseurs, EquipeStockage);
  end;
  changementDeSalle (geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
end;

////////////////////////////////
procedure salleSuivante (geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofPc; quitter : integer);
var
  choixSalleSuivante : integer;
//Vagabonder ne mène qu'à appeler des procédures combatGeekemonSauvage, lançant un combat
//contre un geekemon sauvage aléatoire.
begin
  writeln ('Vous êtes dans une salle du bâtiment IQ !');
  combatGeekemonSauvage(geekedex,geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomdresseurs, equipeStockage, quitter);
  changementDeSalle (geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
end;



///////////////////////////////////////////////////////////
procedure carte (geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur);

begin
couleurTexte(11);
writeln('|-----------------------------------------|');
writeln('| |---------|-------|------|------------| |');
writeln('| |         |       |      |            | |');
write ('| | ');
couleurTexte(12);
write ('Entrée');
couleurTexte(11);
write ('  |  ');
couleurTexte(12);
write ('148');
couleurTexte(11);
write ('  |  ');
couleurTexte(12);
write ('149');
couleurTexte(11);
write (' | ');
couleurTexte(12);
write ('cafeteria');
couleurTexte(11);
writeln('  | |');
writeln('| |         |       |      |            | |');
writeln('| |         |       |      |            | |');
writeln('| |----  ---|------ |----- | -----------| |');
writeln('| |                                     | |');
writeln('| |-------- |------ |----- | -----------| |');
writeln('| |         |       |      |            | |');
write ('| |  ');
couleurTexte(12);
write ('146');
couleurTexte(11);
write ('    |  ');
couleurTexte(12);
write ('147');
couleurTexte(11);
write ('  |  ');
couleurTexte(12);
write ('Sect');
couleurTexte(11);
write ('|  ');
couleurTexte(12);
write ('ETDDG     ');
couleurTexte(11);
writeln('| |');
writeln('| |         |       |      |            | |');
writeln('| |         |       |      |            | |');
writeln('| |---------|-------|------|------------| |');
writeln('|-----------------------------------------|');
couleurTexte(15);

end;

////////////////////
procedure traineau(var k : integer);

begin

      begin
        couleurTexte(15);
        deplacerCurseurXY(k,19);
        writeln ('     _---_.*~<(''===          ,~~,         ,~~,         ,~~,           ,_)                              ');
        deplacerCurseurXY(k,20);
        writeln ('    (,    \ (__)=3--__._----_()''4__._----_()''4__._----_()''4__._,____.()''b                            ');
        deplacerCurseurXY(k,21);
        writeln ('      \--------/-\  ~~(        ) ~~(        ) ~~(        )  ~~:       :''                                ');
        deplacerCurseurXY(k,22);
        writeln ('       \_______|       (,_,,,_)     (,_,,,_)     (,_,,,_)     ;,,,,,,:                                   ');
        deplacerCurseurXY(k,23);
        writeln ('    ___I___I___I./     / /  \ \     / /  \ \     / /  \ \     / /  \ \                                    ');
        attendre(250);
        k:=k+1;
        if k>28 then
        begin
          k:=k-18 ;
        end;
      end;
end;

//////////////////////
procedure barre;
var
  i : integer;
  k : integer;
begin
    k := 10;
    traineau(k);
    deplacerCurseurXY(30,2);
    writeln('   .  .      +     .      .          .    .                   ');
    deplacerCurseurXY(30,3);
    writeln('             .      .     #       .           .                  ');
    deplacerCurseurXY(30,4);
    writeln('       .       .         ###            .      .            ');
    deplacerCurseurXY(30,5);
    writeln('      .      .   "#:. .:##"##:. .:#"  .      .                   ');
    deplacerCurseurXY(30,6);
    writeln('          .      . "####"###"####"  .                            ');
    deplacerCurseurXY(30,7);
    writeln('       .     "#:.    .:#"###"#:.    .:#"  .                 ');
    deplacerCurseurXY(30,8);
    writeln('  .             "#########"#########"        .                ');
    deplacerCurseurXY(30,9);
    writeln('            .    "#:.  "####"###"####"  .:#"   .               ');
    deplacerCurseurXY(30,10);
    writeln('     .     .  "#######""##"##""#######"                        ');
    deplacerCurseurXY(30,11);
    writeln('                ."##"#####"#####"##"           .               ');
    deplacerCurseurXY(30,12);
    writeln('    .   "#:. ...  .:##"###"###"##:.  ... .:#"     .              ');
    deplacerCurseurXY(30,13);
    writeln('      .     "#######"##"#####"##"#######"      .               ');
    deplacerCurseurXY(30,14);
    writeln('    .    .     "#####""#######""#####"    .      .               ');
    deplacerCurseurXY(30,15);
    writeln('            .     "      000      "    .     .                   ');
    deplacerCurseurXY(30,16);
    writeln('       .         .   .   000     .        .       .              ');
    deplacerCurseurXY(30,17);
    writeln('                        O000O                                    ');
    couleurTexte(2);
    deplacerCurseurXY(10,24);
    writeln ('    ¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦     ');
    deplacerCurseurXY(10,25);
    writeln ('    ¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦     ');
    deplacerCurseurXY(10,26);
    writeln ('    ¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦     ');
    for i :=14 to 103 do
    begin

      traineau(k);
      couleurTexte(4);
      attendre(10);
      deplacerCurseurXY(i,24);
      writeln('¦');
      deplacerCurseurXY(i,25);
      writeln('¦');
      deplacerCurseurXY(i,26);
      writeln('¦');



    end;
    couleurTexte(15);
end;

/////////////////////////////
procedure carteSecretariat ();

begin






writeln('                         ._______________________________________________________________          ');
writeln('                       .  |[  BIENVENUE  ]       [Salle 146]   [Salle 147]     [ETDDG]  |        ');
writeln('                      .   |[AU SECRETARIAT]      .________.    .________.    .________.   |        ');
writeln('                    .     |     wwwwwwwww       |      .''|    |      .''|    |      .''|   |        ');
writeln('                   .      |     |)__|__(|       |    .''  |    |    .''  |    |    .''  |   |        ');
writeln('                 .    /|  |     |\  |  /|       |    |   |    |    |   |    |    |   |   |        ');
writeln('                .    /%|  |     ''=======''       |    |   |    |    |   |    |    |   |   |        ');
writeln('              .     |@/   |                     |    |o  |    |    |o  |    |    |o  |   |        ');
writeln('             .      |/    |_____________________|____|  ,|____|____|  ,|____|____|  ,|__ |        ');
writeln('           .             /                           | ,           | ,           | ,     /        ');
writeln('          .      ._.    /                            |.            |.            |.     /         ');
writeln('        .       / /|   /                                                               /          ');
writeln('       |       / /||  /         __________                                            /           ');
writeln('       |      /_/|/| /        /_/-----/_/|   __                                      /            ');
writeln('       |      |||/||/         ( ( '' '' ( (| /''--''\          ____________             /             ');
writeln('       |      ||/|/           (_( '' '' (_(|/.    .\        =/ o      o  /=          /              ');
writeln('       |      |||/            / /=====/ /|  ''||''         =/    X  .   /=          /               ');
writeln('       |      ||/            /_//____/_/ |   ||         =/___________/=          /                ');
writeln('       |      /             (o|:.....|o) |   ||                                 /                 ');
writeln('       |     /              |_|:_____|_|/''  _||_                               /                  ');
writeln('       |    /                 ''        ''    /____\                            /                   ');
writeln('       |_____________________________________________________________________/                    ');
  couleurTexte(15);

end;




end.
