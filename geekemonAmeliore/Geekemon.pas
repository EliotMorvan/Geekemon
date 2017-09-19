unit Geekemon;
//Cette unité est la base de données du jeu.
//On y trouve notamment les types record pour les geekemons sauvages, ceux des équipes
//et ceux stockés dans le PC.

interface

type UnGeekemon = record
  nom : String;
  COMP1 : integer; //La valeur des compétences, qui correspondent à l'attaque dans
  COMP2 : integer; //la version minimale du jeu.
  COMP3 : integer;
  nomComp1 : string; //Le nom des attaques.
  nomComp2 : string;
  nomComp3 : string;
  DEF : integer;
  PV : integer;
end;

type EquipeDresseur = record
     nom : string;
     PV : integer;
     COMP1 : integer;
     COMP2 : integer;
     COMP3 : integer;
     DEF : integer;
end;

type MonEquipe = record
  nom : String;
  COMP1 : integer;
  COMP2 : integer;
  COMP3 : integer;
  nomComp1 : string;
  nomComp2 : string;
  nomComp3 : string;
  DEF : integer;
  PVdeBase : integer;
  PVactuels : integer;
  //Les PV utilisés lors d'un combat.
  nbGeekemons : integer;
  //nombre de geekemons de l'équipe du joueur
  EXP : integer;
  NIV : integer;
  accesCompetence3 : boolean;
  //Ce booléen prend la valeur "true" quand le geekemon passe niveau 10,
  //ce qui permet au joueur d'utiliser la troisième compétence du
  //geekemon en combat.
end;

type avancementQuete = record
  finpartie1 : boolean;
  finpartie2 : boolean;
  //Ce type record permet au joueur de continuer sa progression
  //dans le scénario. Quand il finit une partie, le booléen correspondant
  //prend la valeur true.
end;

type PC= record
  nom : string;
  PV : integer;
  COMP1 : integer;
  COMP2 : integer;
  COMP3 : integer;
  nomComp1 : string;
  nomComp2 : string;
  nomComp3 : string;
  DEF : integer;
  EXP : integer;
  NIV : integer;
  accesCompetence3 : boolean;
end;

arrayOfEquipeDresseur = array [0..23] of EquipeDresseur;

arrayOfGeekemon = array[0..23] of UnGeekemon;

arrayOfEquipe = array[0..3] of MonEquipe;

arrayOfDresseurs = array[0..23] of string;

arrayofPC = array [0..4] of PC;

function renvoyerEquipeDresseur() : arrayOfEquipeDresseur;
function renvoyerTableauGeekemon() : arrayOfGeekemon;
function renvoyerGeekEquipe() : arrayOfEquipe;
function renvoyerAvancementQuete() : avancementQuete;
function renvoyerNomDresseurs() : arrayofdresseurs;
function renvoyerPC() : arrayOfPC;


implementation
//Chaque fonction "renvoyer" renvoie un tableau.
//Ces tableaux sont ensuite affectés à des variables de la procédure démarrer
//qui seront passés en paramètre dans les autres sous-programmes.

function renvoyerPC() : arrayOfPC;

var
EquipeStockage : arrayofPC;

begin
  result:=equipeStockage;
end;

function renvoyerNomDresseurs() : arrayofdresseurs;

var
  nomDresseurs : arrayOfDresseurs;

begin
//Chaque dresseur a quatre cases dans le tableau car les noms des dresseurs en combat
//sont associés à la variable "numDressEquipe" qui gère également les geekemons envoyés.
  nomDresseurs[0] := 'Alexis';
  nomDresseurs[1] := 'Alexis';
  nomDresseurs[2] := 'Alexis';
  nomDresseurs[3] := 'Alexis';
  nomDresseurs[4] := 'Pierre';
  nomDresseurs[5] := 'Pierre';
  nomDresseurs[6] := 'Pierre';
  nomDresseurs[7] := 'Pierre';
  nomDresseurs[8] := 'David';
  nomDresseurs[9] := 'David';
  nomDresseurs[10] := 'David';
  nomDresseurs[11] := 'David';
  nomDresseurs[12] := 'Seigneur Phemius';
  nomDresseurs[13] := 'Seigneur Phemius';
  nomDresseurs[14] := 'Seigneur Phemius';
  nomDresseurs[15] := 'Seigneur Phemius';
  nomDresseurs[16] := 'Dame Rolland de Ravel';
  nomDresseurs[17] := 'Dame Rolland de Ravel';
  nomDresseurs[18] := 'Dame Rolland de Ravel';
  nomDresseurs[19] := 'Dame Rolland de Ravel';
  nomDresseurs[20] := 'MissingNo';
  nomDresseurs[21] := 'MissingNo';
  nomDresseurs[22] := 'MissingNo';
  nomDresseurs[23] := 'MissingNo';
  result := nomDresseurs;
end;


function renvoyerAvancementQuete() : avancementQuete;

var
  avancement : avancementQuete;

begin
//On initialise les deux premières parties de la quête à faux.
  avancement.finpartie1 := false;
  avancement.finpartie2 := false;
  result := avancement;
end;

function renvoyerEquipeDresseur() : arrayOfEquipeDresseur;

var
DressEquipe : arrayOfEquipeDresseur;
geekedex : arrayofgeekemon;

begin
  geekedex := renvoyerTableauGeekemon;
  Dressequipe[0].nom := geekedex[0].nom;
  Dressequipe[1].nom := geekedex[1].nom;
  Dressequipe[2].nom := geekedex[2].nom;
  Dressequipe[3].nom := geekedex[3].nom;
  Dressequipe[4].nom := geekedex[4].nom;
  Dressequipe[5].nom := geekedex[5].nom;
  Dressequipe[6].nom := geekedex[6].nom;
  Dressequipe[7].nom := geekedex[7].nom;
  Dressequipe[8].nom := geekedex[8].nom;
  Dressequipe[9].nom := geekedex[9].nom;
  Dressequipe[10].nom := geekedex[10].nom;
  Dressequipe[11].nom := geekedex[11].nom;
  Dressequipe[12].nom := geekedex[12].nom;
  Dressequipe[13].nom := geekedex[13].nom;
  Dressequipe[14].nom := geekedex[14].nom;
  Dressequipe[15].nom := geekedex[15].nom;
  Dressequipe[16].nom := geekedex[16].nom;
  Dressequipe[17].nom := geekedex[17].nom;
  Dressequipe[18].nom := geekedex[18].nom;
  Dressequipe[19].nom := geekedex[19].nom;
  Dressequipe[20].nom := geekedex[20].nom;
  Dressequipe[21].nom := geekedex[21].nom;
  Dressequipe[22].nom := geekedex[22].nom;
  Dressequipe[23].nom := geekedex[23].nom;

  Dressequipe[0].PV := geekedex[0].PV;
  Dressequipe[1].PV := geekedex[1].PV;
  Dressequipe[2].PV := geekedex[2].PV;
  Dressequipe[3].PV := geekedex[3].PV;
  Dressequipe[4].PV := geekedex[4].PV;
  Dressequipe[5].PV := geekedex[5].PV;
  Dressequipe[6].PV := geekedex[6].PV;
  Dressequipe[7].PV := geekedex[7].PV;
  Dressequipe[8].PV := geekedex[8].PV;
  Dressequipe[9].PV := geekedex[9].PV;
  Dressequipe[10].PV := geekedex[10].PV;
  Dressequipe[11].PV := geekedex[11].PV;
  Dressequipe[12].PV := geekedex[12].PV;
  Dressequipe[13].PV := geekedex[13].PV;
  Dressequipe[14].PV := geekedex[14].PV;
  Dressequipe[15].PV := geekedex[15].PV;
  Dressequipe[16].PV := geekedex[16].PV;
  Dressequipe[17].PV := geekedex[17].PV;
  Dressequipe[18].PV := geekedex[18].PV;
  Dressequipe[19].PV := geekedex[19].PV;
  Dressequipe[20].PV := geekedex[20].PV;
  Dressequipe[21].PV := geekedex[21].PV;
  Dressequipe[22].PV := geekedex[22].PV;
  Dressequipe[23].PV := geekedex[23].PV;

  Dressequipe[0].COMP1 := geekedex[0].COMP1;
  Dressequipe[1].COMP1 := geekedex[1].COMP1;
  Dressequipe[2].COMP1 := geekedex[2].COMP1;
  Dressequipe[3].COMP1 := geekedex[3].COMP1;
  Dressequipe[4].COMP1 := geekedex[4].COMP1;
  Dressequipe[5].COMP1 := geekedex[5].COMP1;
  Dressequipe[6].COMP1 := geekedex[6].COMP1;
  Dressequipe[7].COMP1 := geekedex[7].COMP1;
  Dressequipe[8].COMP1 := geekedex[8].COMP1;
  Dressequipe[9].COMP1 := geekedex[9].COMP1;
  Dressequipe[10].COMP1 := geekedex[10].COMP1;
  Dressequipe[11].COMP1 := geekedex[11].COMP1;
  Dressequipe[12].COMP1 := geekedex[12].COMP1;
  Dressequipe[13].COMP1 := geekedex[13].COMP1;
  Dressequipe[14].COMP1 := geekedex[14].COMP1;
  Dressequipe[15].COMP1 := geekedex[15].COMP1;
  Dressequipe[16].COMP1 := geekedex[16].COMP1;
  Dressequipe[17].COMP1 := geekedex[17].COMP1;
  Dressequipe[18].COMP1 := geekedex[18].COMP1;
  Dressequipe[19].COMP1 := geekedex[19].COMP1;
  Dressequipe[20].COMP1 := geekedex[20].COMP1;
  Dressequipe[21].COMP1 := geekedex[21].COMP1;
  Dressequipe[22].COMP1 := geekedex[22].COMP1;
  Dressequipe[23].COMP1 := geekedex[23].COMP1;

  Dressequipe[0].COMP2 := geekedex[0].COMP2;
  Dressequipe[1].COMP2 := geekedex[1].COMP2;
  Dressequipe[2].COMP2 := geekedex[2].COMP2;
  Dressequipe[3].COMP2 := geekedex[3].COMP2;
  Dressequipe[4].COMP2 := geekedex[4].COMP2;
  Dressequipe[5].COMP2 := geekedex[5].COMP2;
  Dressequipe[6].COMP2 := geekedex[6].COMP2;
  Dressequipe[7].COMP2 := geekedex[7].COMP2;
  Dressequipe[8].COMP2 := geekedex[8].COMP2;
  Dressequipe[9].COMP2 := geekedex[9].COMP2;
  Dressequipe[10].COMP2 := geekedex[10].COMP2;
  Dressequipe[11].COMP2 := geekedex[11].COMP2;
  Dressequipe[12].COMP2 := geekedex[12].COMP2;
  Dressequipe[13].COMP2 := geekedex[13].COMP2;
  Dressequipe[14].COMP2 := geekedex[14].COMP2;
  Dressequipe[15].COMP2 := geekedex[15].COMP2;
  Dressequipe[16].COMP2 := geekedex[16].COMP2;
  Dressequipe[17].COMP2 := geekedex[17].COMP2;
  Dressequipe[18].COMP2 := geekedex[18].COMP2;
  Dressequipe[19].COMP2 := geekedex[19].COMP2;
  Dressequipe[20].COMP2 := geekedex[20].COMP2;
  Dressequipe[21].COMP2 := geekedex[21].COMP2;
  Dressequipe[22].COMP2 := geekedex[22].COMP2;
  Dressequipe[23].COMP2 := geekedex[23].COMP2;

  Dressequipe[0].COMP3 := geekedex[0].COMP3;
  Dressequipe[1].COMP3 := geekedex[1].COMP3;
  Dressequipe[2].COMP3 := geekedex[2].COMP3;
  Dressequipe[3].COMP3 := geekedex[3].COMP3;
  Dressequipe[4].COMP3 := geekedex[4].COMP3;
  Dressequipe[5].COMP3 := geekedex[5].COMP3;
  Dressequipe[6].COMP3 := geekedex[6].COMP3;
  Dressequipe[7].COMP3 := geekedex[7].COMP3;
  Dressequipe[8].COMP3 := geekedex[8].COMP3;
  Dressequipe[9].COMP3 := geekedex[9].COMP3;
  Dressequipe[10].COMP3 := geekedex[10].COMP3;
  Dressequipe[11].COMP3 := geekedex[11].COMP3;
  Dressequipe[12].COMP3 := geekedex[12].COMP3;
  Dressequipe[13].COMP3 := geekedex[13].COMP3;
  Dressequipe[14].COMP3 := geekedex[14].COMP3;
  Dressequipe[15].COMP3 := geekedex[15].COMP3;
  Dressequipe[16].COMP3 := geekedex[16].COMP3;
  Dressequipe[17].COMP3 := geekedex[17].COMP3;
  Dressequipe[18].COMP3 := geekedex[18].COMP3;
  Dressequipe[19].COMP3 := geekedex[19].COMP3;
  Dressequipe[20].COMP3 := geekedex[20].COMP3;
  Dressequipe[21].COMP3 := geekedex[21].COMP3;
  Dressequipe[22].COMP3 := geekedex[22].COMP3;
  Dressequipe[23].COMP3 := geekedex[23].COMP3;

  Dressequipe[0].DEF := geekedex[0].DEF;
  Dressequipe[1].DEF := geekedex[1].DEF;
  Dressequipe[2].DEF := geekedex[2].DEF;
  Dressequipe[3].DEF := geekedex[3].DEF;
  Dressequipe[4].DEF := geekedex[4].DEF;
  Dressequipe[5].DEF := geekedex[5].DEF;
  Dressequipe[6].DEF := geekedex[6].DEF;
  Dressequipe[7].DEF := geekedex[7].DEF;
  Dressequipe[8].DEF := geekedex[8].DEF;
  Dressequipe[9].DEF := geekedex[9].DEF;
  Dressequipe[10].DEF := geekedex[10].DEF;
  Dressequipe[11].DEF := geekedex[11].DEF;
  Dressequipe[12].DEF := geekedex[12].DEF;
  Dressequipe[13].DEF := geekedex[13].DEF;
  Dressequipe[14].DEF := geekedex[14].DEF;
  Dressequipe[15].DEF := geekedex[15].DEF;
  Dressequipe[16].DEF := geekedex[16].DEF;
  Dressequipe[17].DEF := geekedex[17].DEF;
  Dressequipe[18].DEF := geekedex[18].DEF;
  Dressequipe[19].DEF := geekedex[19].DEF;
  Dressequipe[20].DEF := geekedex[20].DEF;
  Dressequipe[21].DEF := geekedex[21].DEF;
  Dressequipe[22].DEF := geekedex[22].DEF;
  Dressequipe[23].DEF := geekedex[23].DEF;
  result := DressEquipe;
end;

function renvoyerTableauGeekemon() : arrayOfGeekemon;

var
geekedex : arrayOfGeekemon;

begin
  geekedex[0].nom := 'Stella';
  geekedex[1].nom := 'Joffrey Baratheon';
  geekedex[2].nom := 'Son Goku';
  geekedex[3].nom := 'Jon Snow';
  geekedex[4].nom := 'Daenerys Targaryen';
  geekedex[5].nom := 'Walter White';
  geekedex[6].nom := 'Negan';
  geekedex[7].nom := 'Scoubidoo';
  geekedex[8].nom := 'Link';
  geekedex[9].nom := 'Yagami Raito';
  geekedex[10].nom := 'Ulquiora Schiffer';
  geekedex[11].nom := 'L';
  geekedex[12].nom := 'Vegeta';
  geekedex[13].nom := 'Bruce Wayne';
  geekedex[14].nom := 'Monkey D. Luffy';
  geekedex[15].nom := 'King Bradley';
  geekedex[16].nom := 'Ken Kaneki';
  geekedex[17].nom := 'Grand Schtroumpf';
  geekedex[18].nom := 'Rick Grimes';
  geekedex[19].nom := 'Shanks Le Roux';
  geekedex[20].nom := 'Sosuke Aizen';
  geekedex[21].nom := 'Itachi Uchiwa';
  geekedex[22].nom := 'Saitama';
  geekedex[23].nom := 'Vegeto';

  geekedex[0].COMP1 := 18;
  geekedex[1].COMP1 := 18;
  geekedex[2].COMP1 := 18;
  geekedex[3].COMP1 := 15;
  geekedex[4].COMP1 := 15;
  geekedex[5].COMP1 := 16;
  geekedex[6].COMP1 := 16;
  geekedex[7].COMP1 := 17;
  geekedex[8].COMP1 := 17;
  geekedex[9].COMP1 := 18;
  geekedex[10].COMP1 := 18;
  geekedex[11].COMP1 := 19;
  geekedex[12].COMP1 := 19;
  geekedex[13].COMP1 := 19;
  geekedex[14].COMP1 := 19;
  geekedex[15].COMP1 := 19;
  geekedex[16].COMP1 := 20;
  geekedex[17].COMP1 := 21;
  geekedex[18].COMP1 := 21;
  geekedex[19].COMP1 := 22;
  geekedex[20].COMP1 := 22;
  geekedex[21].COMP1 := 23;
  geekedex[22].COMP1 := 24;
  geekedex[23].COMP1 := 25;

  geekedex[0].COMP2 := 18;
  geekedex[1].COMP2 := 18;
  geekedex[2].COMP2 := 18;
  geekedex[3].COMP2 := 15;
  geekedex[4].COMP2 := 15;
  geekedex[5].COMP2 := 16;
  geekedex[6].COMP2 := 16;
  geekedex[7].COMP2 := 17;
  geekedex[8].COMP2 := 17;
  geekedex[9].COMP2 := 18;
  geekedex[10].COMP2 := 18;
  geekedex[11].COMP2 := 19;
  geekedex[12].COMP2 := 19;
  geekedex[13].COMP2 := 19;
  geekedex[14].COMP2 := 19;
  geekedex[15].COMP2 := 19;
  geekedex[16].COMP2 := 20;
  geekedex[17].COMP2 := 21;
  geekedex[18].COMP2 := 21;
  geekedex[19].COMP2 := 22;
  geekedex[20].COMP2 := 22;
  geekedex[21].COMP2 := 23;
  geekedex[22].COMP2 := 24;
  geekedex[23].COMP2 := 25;

  geekedex[0].COMP3 := 21;
  geekedex[1].COMP3 := 21;
  geekedex[2].COMP3 := 21;
  geekedex[3].COMP3 := 15;
  geekedex[4].COMP3 := 15;
  geekedex[5].COMP3 := 16;
  geekedex[6].COMP3 := 16;
  geekedex[7].COMP3 := 17;
  geekedex[8].COMP3 := 17;
  geekedex[9].COMP3 := 18;
  geekedex[10].COMP3 := 18;
  geekedex[11].COMP3 := 19;
  geekedex[12].COMP3 := 19;
  geekedex[13].COMP3 := 19;
  geekedex[14].COMP3 := 19;
  geekedex[15].COMP3 := 19;
  geekedex[16].COMP3 := 20;
  geekedex[17].COMP3 := 21;
  geekedex[18].COMP3 := 21;
  geekedex[19].COMP3 := 22;
  geekedex[20].COMP3 := 22;
  geekedex[21].COMP3 := 23;
  geekedex[22].COMP3 := 24;
  geekedex[23].COMP3 := 25;

  geekedex[0].nomComp1 := 'Jet de lumière';
  geekedex[1].nomComp1 := 'Griffe de lionceau';
  geekedex[2].nomComp1 := 'Kamehamea';
  geekedex[3].nomComp1 := 'Torrent de Fangirl';
  geekedex[4].nomComp1 := 'rugissement de Rhaegal';
  geekedex[5].nomComp1 := 'Production de méthamphétamine';
  geekedex[6].nomComp1 := 'Lucille';
  geekedex[7].nomComp1 := 'crocscoubi';
  geekedex[8].nomComp1 := 'Epée du héros';
  geekedex[9].nomComp1 := 'death note';
  geekedex[10].nomComp1 := 'Sonido';
  geekedex[11].nomComp1 := 'réflexion intensive';
  geekedex[12].nomComp1 := 'bigbang';
  geekedex[13].nomComp1 := 'Batarang';
  geekedex[14].nomComp1 := 'Cwhing Punch';
  geekedex[15].nomComp1 := 'Rapière';
  geekedex[16].nomComp1 := 'Kagune Blindé';
  geekedex[17].nomComp1 := 'Sagesse Ultime';
  geekedex[18].nomComp1 := 'Colt Python';
  geekedex[19].nomComp1 := 'Diplomatie';
  geekedex[20].nomComp1 := 'Kyoka Suigetsu';
  geekedex[21].nomComp1 := 'Kaleidoscope Hypnothique du Sharingan';
  geekedex[22].nomComp1 := 'Pluie de Coups Ordinaires';
  geekedex[23].nomComp1 := 'Rayon d''Energie';

  geekedex[0].nomComp2 := 'lumière aveuglante';
  geekedex[1].nomComp2 := 'liquide empoisonné';
  geekedex[2].nomComp2 := 'kaioken';
  geekedex[3].nomComp2 := 'Résurrection';
  geekedex[4].nomComp2 := 'Piétinement de Visérion';
  geekedex[5].nomComp2 := 'vole de chauffe ballon';
  geekedex[6].nomComp2 := 'charisme persuasif';
  geekedex[7].nomComp2 := 'scoubidobidoooooo';
  geekedex[8].nomComp2 := 'Ocarina';
  geekedex[9].nomComp2 := 'une pomme';
  geekedex[10].nomComp2 := 'Résurrecion';
  geekedex[11].nomComp2 := 'position accroupie';
  geekedex[12].nomComp2 := 'final flash';
  geekedex[13].nomComp2 := 'Arts Martiaux';
  geekedex[14].nomComp2 := 'Chwing Bazooka';
  geekedex[15].nomComp2 := 'Escrime Ultime';
  geekedex[16].nomComp2 := 'kagune Dorée';
  geekedex[17].nomComp2 := 'Bonnet rouge';
  geekedex[18].nomComp2 := 'Rage non Controlée';
  geekedex[19].nomComp2 := 'Sabre Légendaire';
  geekedex[20].nomComp2 := 'Hollomorphose';
  geekedex[21].nomComp2 := 'Amaterasu';
  geekedex[22].nomComp2 := 'One Punch Man';
  geekedex[23].nomComp2 := 'Final Kamehamea';

  geekedex[0].nomComp3 := 'océan de soleil';
  geekedex[1].nomComp3 := 'rugissement de lion';
  geekedex[2].nomComp3 := 'genkidama';
  geekedex[3].nomComp3 := 'Roi du Nord';
  geekedex[4].nomComp3 := 'Flammes de Drogon';
  geekedex[5].nomComp3 := 'lancement de chapeau';
  geekedex[6].nomComp3 := 'meurtre à la chaîne';
  geekedex[7].nomComp3 := 'la mystery machine';
  geekedex[8].nomComp3 := 'Masque du Dieu Démon';
  geekedex[9].nomComp3 := 'guerre mentale';
  geekedex[10].nomComp3 := 'Cero Obscuras';
  geekedex[11].nomComp3 := 'résolution d’enquête';
  geekedex[12].nomComp3 := 'Super Saiyan God';
  geekedex[13].nomComp3 := 'Batpod';
  geekedex[14].nomComp3 := 'Gear 2';
  geekedex[15].nomComp3 := 'Oeil Ultime';
  geekedex[16].nomComp3 := 'Kagune Ecailleux';
  geekedex[17].nomComp3 := 'Dictateur';
  geekedex[18].nomComp3 := 'Balle dans le Crâne';
  geekedex[19].nomComp3 := 'Fluide Royale';
  geekedex[20].nomComp3 := 'Bankai';
  geekedex[21].nomComp3 := 'Susanô';
  geekedex[22].nomComp3 := 'Enchaînement Sérieux';
  geekedex[23].nomComp3 := 'Super Saiyan God Vegeto';

  geekedex[0].DEF:= 8;
  geekedex[1].DEF:= 7;
  geekedex[2].DEF:= 5;
  geekedex[3].DEF:= 5;
  geekedex[4].DEF := 5;
  geekedex[5].DEF := 6;
  geekedex[6].DEF := 6;
  geekedex[7].DEF := 6;
  geekedex[8].DEF := 6;
  geekedex[9].DEF := 6;
  geekedex[10].DEF := 8;
  geekedex[11].DEF := 8;
  geekedex[12].DEF := 8;
  geekedex[13].DEF := 8;
  geekedex[14].DEF := 8;
  geekedex[15].DEF := 11;
  geekedex[16].DEF := 11;
  geekedex[17].DEF := 11;
  geekedex[18].DEF:= 11;
  geekedex[19].DEF := 11;
  geekedex[20].DEF := 13;
  geekedex[21].DEF := 13;
  geekedex[22].DEF := 13;
  geekedex[23].DEF := 13;

  geekedex[0].PV := 40;
  geekedex[1].PV := 40;
  geekedex[2].PV := 40;
  geekedex[3].PV := 40;
  geekedex[4].PV := 40;
  geekedex[5].PV := 50;
  geekedex[6].PV := 50;
  geekedex[7].PV := 50;
  geekedex[8].PV := 50;
  geekedex[9].PV := 50;
  geekedex[10].PV := 60;
  geekedex[11].PV:= 60;
  geekedex[12].PV := 60;
  geekedex[13].PV := 60;
  geekedex[14].PV := 60;
  geekedex[15].PV := 70;
  geekedex[16].PV := 70;
  geekedex[17].PV := 70;
  geekedex[18].PV := 70;
  geekedex[19].PV := 70;
  geekedex[20].PV := 80;
  geekedex[21].PV := 80;
  geekedex[22].PV := 80;
  geekedex[23].PV := 80;
  result := geekedex;
end;

function renvoyerGeekEquipe() : arrayOfEquipe;
var
  geekEquipe : arrayOfEquipe;
  geekedex : arrayOfGeekemon;
begin
  //Cette initialisation des PV à 10 est relative au système de combat
  //qui utilise des alternatives liées au nombre de geekemons déjà
  //KO dans l'équipe du joueur.
  //Dans la première alternative d'un combat, si le troisième geekemon du joueur est KO,
  //on envoie le quatrième, ce qui pose un problème si le joueur n'a que son starter et que
  //les PV du reste de l'équipe ne sont pas initialisés.
  geekedex := renvoyerTableauGeekemon();
  geekEquipe[1].PVactuels := 10;
  geekEquipe[2].PVactuels := 10;
  geekEquipe[3].PVactuels := 10;
  //On initialise le débloquage de la troisième compétence à faux pour que les
  //geekemons ne puissent pas l'utiliser.
  geekEquipe[0].accesCompetence3 := false;
  geekEquipe[1].accesCompetence3 := false;
  geekEquipe[2].accesCompetence3 := false;
  geekEquipe[3].accesCompetence3 := false;
  result := geekEquipe;
end;

end.
