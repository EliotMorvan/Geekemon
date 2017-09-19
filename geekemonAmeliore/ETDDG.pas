unit ETDDG;
//Cette unit� contient les sous-programmes relatifs aux actions effectu�es � l'ETTDG.
interface
uses Geekemon;
procedure soin (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur);
function potion (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur ; var nom1 : string ; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofpc; quitter : integer) : integer;
procedure PC (geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur ; var nom1 : string ; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; var EquipeStockage :arrayofPC);

implementation
uses changementSalle, Sc�nario;
////////////////////////////////////////////////////
function potion (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var nom1 : string ; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofpc; quitter : integer) : integer;
var
  choixPotion : integer;
begin
  writeln ('Vous avez ', nbPotion,' potions');
  writeln ('Voulez vous acheter une potion?');
  writeln ('1. Oui');
  writeln ('2. Non');
  choixPotion := readVerif(1,2);
  if choixPotion = 1 then
  begin
    nbPotion := nbPotion + 1;
    if nbPotion > 1 then
    //(Juste une histoire d'orthographe...)
    begin
    writeln ('Vous avez maintenant ',nbPotion,' potions');
    readln;
    end
    else
    begin
    writeln ('Vous avez maintenant ',nbPotion,' potion');
    readln;
    end;
    procETDDG(geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
  end
  else
  begin
    procETDDG(geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
  end;
  potion:= nbPotion
end;

////////////////////////////////
procedure soin (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur);
//Tous les geekemons de l'�quipe reprennent leurs PVs de base stock�s dans le champ PVdeBase
begin
  geekEquipe[0].PVactuels := geekEquipe[0].PVdeBase;
  geekEquipe[1].PVactuels := geekEquipe[1].PVdeBase;
  geekEquipe[2].PVactuels := geekEquipe[2].PVdeBase;
  geekEquipe[3].PVactuels := geekEquipe[3].PVdeBase;
  writeln ('F�licitations ! Vos geekemons sont en pleine forme.');
end;
//////////////////////////////

procedure PC (geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur ; var nom1 : string ; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; var EquipeStockage :arrayofPC);

var
  choixStockage : integer;
  choix : integer;
  choixrecup : integer;
  choixespace : integer;
  sortie : integer;

begin
    EquipeStockage[0].nom:=('(la case du tableau est vide)');
    EquipeStockage[1].nom:=('(la case du tableau est vide)');
    EquipeStockage[2].nom:=('(la case du tableau est vide)');
    EquipeStockage[3].nom:=('(la case du tableau est vide)');
    EquipeStockage[4].nom:=(' '); // cette case doit rester vide
    sortie := 2;

while (sortie = 2) do
  begin

    writeln ('Bonjour, bienvenue sur le PC de JIMMY, ici vous pouvez stocker jusqu''� quatre geekemons ou vous pouvez aussi les r�cuperer');
    writeln ('Que voulez-vous faire?');
    writeln ('1. Stocker ses Geekemons');
    writeln ('2. R�cuperer ses geekemons');

    readln(choix);
    while choix=1 do
    begin
      writeln;
      writeln('Quel geekemon voulez-vous stocker?');
      writeln;
      writeln('1. Stocker : ',geekequipe[0].nom);
      writeln('2. Stocker : ',geekequipe[1].nom);
      writeln('3. Stocker : ',geekequipe[2].nom);
      writeln('4. Stocker : ',geekequipe[3].nom);
      readln(choixStockage);

    case ChoixStockage of
    //Selon la valeur de ChoixStockage, la case � l'indice
    //du pc prend les donn�es de la case de l'�quipe au m�me
    //indice pour tous les champs
    1 : Begin
          writeln('Au revoir ' ,geekequipe[0].nom,'!');
          Equipestockage[0].nom := Geekequipe[0].nom;
          Equipestockage[0].PV :=Geekequipe[0].PVdeBase;
          Equipestockage[0].niv :=Geekequipe[0].NIV;
          Equipestockage[0].exp :=Geekequipe[0].EXP;
          Equipestockage[0].nomcomp1 :=Geekequipe[0].nomComp1;
          Equipestockage[0].nomcomp2 :=Geekequipe[0].nomComp2;
          Equipestockage[0].nomcomp3 :=Geekequipe[0].nomComp3;
          Equipestockage[0].comp1 :=Geekequipe[0].COMP1;
          Equipestockage[0].comp2 :=Geekequipe[0].COMP2;
          Equipestockage[0].comp3 :=Geekequipe[0].COMP3;
          Equipestockage[0].DEF :=Geekequipe[0].DEF;
          Equipestockage[0].accesCompetence3 :=Geekequipe[0].accesCompetence3;
          //On efface les donn�es de la case 0 de geekEquipe � l'aide de
          //la case 4 de EquipeStockage qui reste vide
          Geekequipe[0].nom := EquipeStockage[4].nom;
          Geekequipe[0].PVdebase :=EquipeStockage[4].PV;
          Geekequipe[0].PVactuels := EquipeStockage[4].PV;
          Geekequipe[0].niv :=EquipeStockage[4].niv;
          Geekequipe[0].exp :=EquipeStockage[4].exp;
          Geekequipe[0].nomcomp1 :=EquipeStockage[4].nomcomp1;
          Geekequipe[0].nomcomp2 :=EquipeStockage[4].nomcomp2;
          Geekequipe[0].nomcomp3 :=EquipeStockage[4].nomcomp3;
          Geekequipe[0].comp1 :=EquipeStockage[4].comp1;
          Geekequipe[0].comp2 :=EquipeStockage[4].comp2;
          Geekequipe[0].comp3 :=EquipeStockage[4].comp3;
          Geekequipe[0].DEF :=EquipeStockage[4].DEF;
          Geekequipe[0].accesCompetence3 :=Equipestockage[4].accesCompetence3;


          writeln ('Votre geekemon a bien �t� stock� sur le PC de JIMMY!');
          writeln('Vous pouvez aussi chosir de r�cuperer un geekemon : ');
          writeln('1 Continuer � stocker');
          writeln('2. R�cuperer un geekemon');
          readln(choix);

        End;
    2 : Begin
          writeln('Au revoir ' ,geekequipe[1].nom,'!');
          Equipestockage[1].nom := Geekequipe[1].nom;
          Equipestockage[1].PV :=Geekequipe[1].PVdeBase;
          Equipestockage[1].niv :=Geekequipe[1].NIV;
          Equipestockage[1].exp :=Geekequipe[1].EXP;
          Equipestockage[1].nomcomp1 :=Geekequipe[1].nomComp1;
          Equipestockage[1].nomcomp2 :=Geekequipe[1].nomComp2;
          Equipestockage[1].nomcomp3 :=Geekequipe[1].nomComp3;
          Equipestockage[1].comp1 :=Geekequipe[1].COMP1;
          Equipestockage[1].comp2 :=Geekequipe[1].COMP2;
          Equipestockage[1].comp3 :=Geekequipe[1].COMP3;
          Equipestockage[1].DEF :=Geekequipe[1].DEF;
          Equipestockage[1].accesCompetence3 :=Geekequipe[1].accesCompetence3;

          Geekequipe[1].nom := EquipeStockage[4].nom;
          Geekequipe[1].PVdebase :=EquipeStockage[4].PV;
          Geekequipe[1].PVactuels := EquipeStockage[4].PV;
          Geekequipe[1].niv :=EquipeStockage[4].niv;
          Geekequipe[1].exp :=EquipeStockage[4].exp;
          Geekequipe[1].nomcomp1 :=EquipeStockage[4].nomcomp1;
          Geekequipe[1].nomcomp2 :=EquipeStockage[4].nomcomp2;
          Geekequipe[1].nomcomp3 :=EquipeStockage[4].nomcomp3;
          Geekequipe[1].comp1 :=EquipeStockage[4].comp1;
          Geekequipe[1].comp2 :=EquipeStockage[4].comp2;
          Geekequipe[1].comp3 :=EquipeStockage[4].comp3;
          Geekequipe[1].DEF :=EquipeStockage[4].DEF;
          Geekequipe[1].accesCompetence3 :=Equipestockage[4].accesCompetence3;


          writeln ('Votre geekemon a bien �t� stock� sur le PC de JIMMY!');
          writeln('Vous pouvez aussi chosir de r�cuperer un geekemon : ');
          writeln('1 Continuer � stocker');
          writeln('2. R�cuperer un geekemon');
          readln(choix);


        End;
    3 : Begin
          writeln('Au revoir ' ,geekequipe[2].nom,'!');
          Equipestockage[2].nom := Geekequipe[2].nom;
          Equipestockage[2].PV :=Geekequipe[2].PVdeBase;
          Equipestockage[2].niv :=Geekequipe[2].NIV;
          Equipestockage[2].exp :=Geekequipe[2].EXP;
          Equipestockage[2].nomcomp1 :=Geekequipe[2].nomComp1;
          Equipestockage[2].nomcomp2 :=Geekequipe[2].nomComp2;
          Equipestockage[2].nomcomp3 :=Geekequipe[2].nomComp3;
          Equipestockage[2].comp1 :=Geekequipe[2].COMP1;
          Equipestockage[2].comp2 :=Geekequipe[2].COMP2;
          Equipestockage[2].comp3 :=Geekequipe[2].COMP3;
          Equipestockage[2].DEF :=Geekequipe[2].DEF;
          Equipestockage[2].accesCompetence3 :=Geekequipe[2].accesCompetence3;

          Geekequipe[2].nom := EquipeStockage[4].nom;
          Geekequipe[2].PVdebase :=EquipeStockage[4].PV;
          Geekequipe[2].PVactuels := EquipeStockage[4].PV;
          Geekequipe[2].niv :=EquipeStockage[4].niv;
          Geekequipe[2].exp :=EquipeStockage[4].exp;
          Geekequipe[2].nomcomp1 :=EquipeStockage[4].nomcomp1;
          Geekequipe[2].nomcomp2 :=EquipeStockage[4].nomcomp2;
          Geekequipe[2].nomcomp3 :=EquipeStockage[4].nomcomp3;
          Geekequipe[2].comp1 :=EquipeStockage[4].comp1;
          Geekequipe[2].comp2 :=EquipeStockage[4].comp2;
          Geekequipe[2].comp3 :=EquipeStockage[4].comp3;
          Geekequipe[2].DEF :=EquipeStockage[4].DEF;
          Geekequipe[2].accesCompetence3 :=Equipestockage[4].accesCompetence3;
          writeln ('Votre geekemon a bien �t� stock� sur le PC de JIMMY!');
          writeln('Vous pouvez aussi chosir de r�cuperer un geekemon : ');
          writeln('1 Continuer � stocker');
          writeln('2. R�cuperer un geekemon');
          readln(choix);

        End;
    4 : Begin
          writeln('Au revoir ' ,geekequipe[3].nom,'!');
          Equipestockage[3].nom := Geekequipe[3].nom;
          Equipestockage[3].PV :=Geekequipe[3].PVdeBase;
          Equipestockage[3].niv :=Geekequipe[3].NIV;
          Equipestockage[3].exp :=Geekequipe[3].EXP;
          Equipestockage[3].nomcomp1 :=Geekequipe[3].nomComp1;
          Equipestockage[3].nomcomp2 :=Geekequipe[3].nomComp2;
          Equipestockage[3].nomcomp3 :=Geekequipe[3].nomComp3;
          Equipestockage[3].comp1 :=Geekequipe[3].COMP1;
          Equipestockage[3].comp2 :=Geekequipe[3].COMP2;
          Equipestockage[3].comp3 :=Geekequipe[3].COMP3;
          Equipestockage[3].DEF :=Geekequipe[3].DEF;
          Equipestockage[3].accesCompetence3 :=Geekequipe[3].accesCompetence3;

          Geekequipe[3].nom := EquipeStockage[4].nom;
          Geekequipe[3].PVdebase :=EquipeStockage[4].PV;
          Geekequipe[3].PVactuels := EquipeStockage[4].PV;
          Geekequipe[3].niv :=EquipeStockage[4].niv;
          Geekequipe[3].exp :=EquipeStockage[4].exp;
          Geekequipe[3].nomcomp1 :=EquipeStockage[4].nomcomp1;
          Geekequipe[3].nomcomp2 :=EquipeStockage[4].nomcomp2;
          Geekequipe[3].nomcomp3 :=EquipeStockage[4].nomcomp3;
          Geekequipe[3].comp1 :=EquipeStockage[4].comp1;
          Geekequipe[3].comp2 :=EquipeStockage[4].comp2;
          Geekequipe[3].comp3 :=EquipeStockage[4].comp3;
          Geekequipe[3].DEF :=EquipeStockage[4].DEF;
          Geekequipe[3].accesCompetence3 :=Equipestockage[4].accesCompetence3;
          writeln ('Votre geekemon a bien �t� stock� sur le PC de JIMMY!');
          writeln('Vous pouvez aussi chosir de r�cuperer un geekemon : ');
          writeln('1 Continuer � stocker');
          writeln('2. R�cuperer un geekemon');
          readln(choix);
        end;
    end;

        end;
        writeln('Vous pouvez aussi choisir de r�cuperer vos geekemons');
        begin
          writeln('Vous avez au moins un geekemon de stock�, vous pouvez donc en retirer au moins un');
          writeln('Quel geekemon voulez-vous r�cuperer dans votre �quipe :');
          writeln;
          writeln('1. R�cuperer : ',EquipeStockage[0].nom);
          writeln('2. R�cuperer : ',EquipeStockage[1].nom);
          writeln('3. R�cuperer : ',EquipeStockage[2].nom);
          writeln('4. R�cuperer : ',EquipeStockage[3].nom);
          readln(choixrecup);
          if choixrecup=1 then
            begin
              writeln(' A quel emplacement voulez vous r�cuperer ',EquipeStockage[0].nom,'?');
              writeln;
              writeln('1. A l''emplacement de votre premier geekemon');
              writeln('2. A l''emplacement de votre second geekemon');
              writeln('3. A l''emplacement de votre troisi�me geekemon');
              writeln('4. A l''emplacement de votre dernier geekemon');

            readln(choixespace);
            case choixespace of
            //Selon le geekemon que l'on souhaite r�cup�rer et l'emplacement
            //ou on souhaite le mettre, on a un grand nombre de conditions.
           1 : begin
              writeln('Salut ',EquipeStockage[0].nom,'!');
              Geekequipe[0].nom := EquipeStockage[0].nom;
              Geekequipe[0].PVdebase :=EquipeStockage[0].PV;
              Geekequipe[0].PVactuels := EquipeStockage[0].PV;
              Geekequipe[0].niv :=EquipeStockage[0].niv;
              Geekequipe[0].exp :=EquipeStockage[0].exp;
              Geekequipe[0].nomcomp1 :=EquipeStockage[0].nomcomp1;
              Geekequipe[0].nomcomp2 :=EquipeStockage[0].nomcomp2;
              Geekequipe[0].nomcomp3 :=EquipeStockage[0].nomcomp3;
              Geekequipe[0].comp1 :=EquipeStockage[0].comp1;
              Geekequipe[0].comp2 :=EquipeStockage[0].comp2;
              Geekequipe[0].comp3 :=EquipeStockage[0].comp3;
              Geekequipe[0].DEF :=EquipeStockage[0].DEF;
              Geekequipe[0].accesCompetence3 :=Equipestockage[0].accesCompetence3;

              Equipestockage[0].nom := Equipestockage[4].nom;
              Equipestockage[0].PV :=Equipestockage[4].PV;
              Equipestockage[0].niv :=Equipestockage[4].niv;
              Equipestockage[0].EXP :=EquipeStockage[4].EXP;
              Equipestockage[0].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].comp1 :=Equipestockage[4].comp1;
              Equipestockage[0].comp2 :=Equipestockage[4].comp2;
              Equipestockage[0].comp3 :=Equipestockage[4].comp3;
              Equipestockage[0].DEF :=Equipestockage[4].DEF;
              Equipestockage[0].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[0].nom,' fait d�sormais partie de votre �quipe !');
              end;

        2 : begin
              writeln('Salut ',EquipeStockage[0].nom,'!');
              Geekequipe[1].nom := EquipeStockage[0].nom;
              Geekequipe[1].PVdebase :=EquipeStockage[0].PV;
              Geekequipe[1].PVactuels := EquipeStockage[0].PV;
              Geekequipe[1].niv :=EquipeStockage[0].niv;
              Geekequipe[1].exp :=EquipeStockage[0].exp;
              Geekequipe[1].nomcomp1 :=EquipeStockage[0].nomcomp1;
              Geekequipe[1].nomcomp2 :=EquipeStockage[0].nomcomp2;
              Geekequipe[1].nomcomp3 :=EquipeStockage[0].nomcomp3;
              Geekequipe[1].comp1 :=EquipeStockage[0].comp1;
              Geekequipe[1].comp2 :=EquipeStockage[0].comp2;
              Geekequipe[1].comp3 :=EquipeStockage[0].comp3;
              Geekequipe[1].DEF :=EquipeStockage[0].DEF;
              Geekequipe[1].accesCompetence3 :=Equipestockage[0].accesCompetence3;

              Equipestockage[0].nom := Equipestockage[4].nom;
              Equipestockage[0].PV :=Equipestockage[4].PV;
              Equipestockage[0].niv :=Equipestockage[4].niv;
              Equipestockage[0].EXP :=EquipeStockage[4].EXP;
              Equipestockage[0].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].comp1 :=Equipestockage[4].comp1;
              Equipestockage[0].comp2 :=Equipestockage[4].comp2;
              Equipestockage[0].comp3 :=Equipestockage[4].comp3;
              Equipestockage[0].DEF :=Equipestockage[4].DEF;
              Equipestockage[0].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[1].nom,' fait d�sormais partie de votre �quipe !');
            end;

        3 : begin
              writeln('Salut ',EquipeStockage[0].nom,'!');
              Geekequipe[2].nom := EquipeStockage[0].nom;
              Geekequipe[2].PVdebase :=EquipeStockage[0].PV;
              Geekequipe[2].PVactuels := EquipeStockage[0].PV;
              Geekequipe[2].niv :=EquipeStockage[0].niv;
              Geekequipe[2].exp :=EquipeStockage[0].exp;
              Geekequipe[2].nomcomp1 :=EquipeStockage[0].nomcomp1;
              Geekequipe[2].nomcomp2 :=EquipeStockage[0].nomcomp2;
              Geekequipe[2].nomcomp3 :=EquipeStockage[0].nomcomp3;
              Geekequipe[2].comp1 :=EquipeStockage[0].comp1;
              Geekequipe[2].comp2 :=EquipeStockage[0].comp2;
              Geekequipe[2].comp3 :=EquipeStockage[0].comp3;
              Geekequipe[2].DEF :=EquipeStockage[0].DEF;
              Geekequipe[2].accesCompetence3 :=Equipestockage[0].accesCompetence3;

              Equipestockage[0].nom := Equipestockage[4].nom;
              Equipestockage[0].PV :=Equipestockage[4].PV;
              Equipestockage[0].niv :=Equipestockage[4].niv;
              Equipestockage[0].EXP :=EquipeStockage[4].EXP;
              Equipestockage[0].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].comp1 :=Equipestockage[4].comp1;
              Equipestockage[0].comp2 :=Equipestockage[4].comp2;
              Equipestockage[0].comp3 :=Equipestockage[4].comp3;
              Equipestockage[0].DEF :=Equipestockage[4].DEF;
              Equipestockage[0].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[2].nom,' fait d�sormais partie de votre �quipe !');
            end;
        4 : begin
              writeln('Salut ',EquipeStockage[0].nom,'!');
              Geekequipe[3].nom := EquipeStockage[0].nom;
              Geekequipe[3].PVdebase :=EquipeStockage[0].PV;
              Geekequipe[3].PVactuels := EquipeStockage[0].PV;
              Geekequipe[3].niv :=EquipeStockage[0].niv;
              Geekequipe[3].exp :=EquipeStockage[0].exp;
              Geekequipe[3].nomcomp1 :=EquipeStockage[0].nomcomp1;
              Geekequipe[3].nomcomp2 :=EquipeStockage[0].nomcomp2;
              Geekequipe[3].nomcomp3 :=EquipeStockage[0].nomcomp3;
              Geekequipe[3].comp1 :=EquipeStockage[0].comp1;
              Geekequipe[3].comp2 :=EquipeStockage[0].comp2;
              Geekequipe[3].comp3 :=EquipeStockage[0].comp3;
              Geekequipe[3].DEF :=EquipeStockage[0].DEF;
              Geekequipe[3].accesCompetence3 :=Equipestockage[0].accesCompetence3;

              Equipestockage[0].nom := Equipestockage[4].nom;
              Equipestockage[0].PV :=Equipestockage[4].PV;
              Equipestockage[0].niv :=Equipestockage[4].niv;
              Equipestockage[0].EXP :=EquipeStockage[4].EXP;
              Equipestockage[0].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[0].comp1 :=Equipestockage[4].comp1;
              Equipestockage[0].comp2 :=Equipestockage[4].comp2;
              Equipestockage[0].comp3 :=Equipestockage[4].comp3;
              Equipestockage[0].DEF :=Equipestockage[4].DEF;
              Equipestockage[0].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[3].nom,' fait d�sormais partie de votre �quipe !');
             end;
             end;
            end;
          if choixrecup=2 then
         begin
          writeln(' A quel emplacement voulez vous r�cuperer ',EquipeStockage[1].nom,'?');
          writeln;
          writeln('1. A l''emplacement de votre premier geekemon');
          writeln('2. A l''emplacement de votre second geekemon');
          writeln('3. A l''emplacement de votre troisi�me geekemon');
          writeln('4. A l''emplacement de votre dernier geekemon');

       readln(choixespace);
       case choixespace of
        1 : begin
              writeln('Salut ',EquipeStockage[1].nom,'!');
              Geekequipe[0].nom := EquipeStockage[1].nom;
              Geekequipe[0].PVdebase :=EquipeStockage[1].PV;
              Geekequipe[0].PVactuels := EquipeStockage[1].PV;
              Geekequipe[0].niv :=EquipeStockage[1].niv;
              Geekequipe[0].exp :=EquipeStockage[1].exp;
              Geekequipe[0].nomcomp1 :=EquipeStockage[1].nomcomp1;
              Geekequipe[0].nomcomp2 :=EquipeStockage[1].nomcomp2;
              Geekequipe[0].nomcomp3 :=EquipeStockage[1].nomcomp3;
              Geekequipe[0].comp1 :=EquipeStockage[1].comp1;
              Geekequipe[0].comp2 :=EquipeStockage[1].comp2;
              Geekequipe[0].comp3 :=EquipeStockage[1].comp3;
              Geekequipe[0].DEF :=EquipeStockage[1].DEF;
              Geekequipe[0].accesCompetence3 :=Equipestockage[1].accesCompetence3;

              Equipestockage[1].nom := Equipestockage[4].nom;
              Equipestockage[1].PV :=Equipestockage[4].PV;
              Equipestockage[1].niv :=Equipestockage[4].niv;
              Equipestockage[1].EXP :=EquipeStockage[4].EXP;
              Equipestockage[1].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].comp1 :=Equipestockage[4].comp1;
              Equipestockage[1].comp2 :=Equipestockage[4].comp2;
              Equipestockage[1].comp3 :=Equipestockage[4].comp3;
              Equipestockage[1].DEF :=Equipestockage[4].DEF;
              Equipestockage[1].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[0].nom,' fait d�sormais partie de votre �quipe !');
              end;

        2 : begin
              writeln('Salut ',EquipeStockage[1].nom,'!');
              Geekequipe[1].nom := EquipeStockage[1].nom;
              Geekequipe[1].PVdebase :=EquipeStockage[1].PV;
              Geekequipe[1].PVactuels := EquipeStockage[1].PV;
              Geekequipe[1].niv :=EquipeStockage[1].niv;
              Geekequipe[1].exp :=EquipeStockage[1].exp;
              Geekequipe[1].nomcomp1 :=EquipeStockage[1].nomcomp1;
              Geekequipe[1].nomcomp2 :=EquipeStockage[1].nomcomp2;
              Geekequipe[1].nomcomp3 :=EquipeStockage[1].nomcomp3;
              Geekequipe[1].comp1 :=EquipeStockage[1].comp1;
              Geekequipe[1].comp2 :=EquipeStockage[1].comp2;
              Geekequipe[1].comp3 :=EquipeStockage[1].comp3;
              Geekequipe[1].DEF :=EquipeStockage[1].DEF;
              Geekequipe[1].accesCompetence3 :=Equipestockage[1].accesCompetence3;


              Equipestockage[1].nom := Equipestockage[4].nom;
              Equipestockage[1].PV :=Equipestockage[4].PV;
              Equipestockage[1].niv :=Equipestockage[4].niv;
              Equipestockage[1].EXP :=EquipeStockage[4].EXP;
              Equipestockage[1].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].comp1 :=Equipestockage[4].comp1;
              Equipestockage[1].comp2 :=Equipestockage[4].comp2;
              Equipestockage[1].comp3 :=Equipestockage[4].comp3;
              Equipestockage[1].DEF :=Equipestockage[4].DEF;
              Equipestockage[1].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[1].nom,' fait d�sormais partie de votre �quipe !');
            end;

        3 : begin
              writeln('Salut ',EquipeStockage[1].nom,'!');
              Geekequipe[2].nom := EquipeStockage[1].nom;
              Geekequipe[2].PVdebase :=EquipeStockage[1].PV;
              Geekequipe[2].PVactuels := EquipeStockage[1].PV;
              Geekequipe[2].niv :=EquipeStockage[1].niv;
              Geekequipe[2].exp :=EquipeStockage[1].exp;
              Geekequipe[2].nomcomp1 :=EquipeStockage[1].nomcomp1;
              Geekequipe[2].nomcomp2 :=EquipeStockage[1].nomcomp2;
              Geekequipe[2].nomcomp3 :=EquipeStockage[1].nomcomp3;
              Geekequipe[2].comp1 :=EquipeStockage[1].comp1;
              Geekequipe[2].comp2 :=EquipeStockage[1].comp2;
              Geekequipe[2].comp3 :=EquipeStockage[1].comp3;
              Geekequipe[2].DEF :=EquipeStockage[1].DEF;
              Geekequipe[2].accesCompetence3 :=Equipestockage[1].accesCompetence3;


              Equipestockage[1].nom := Equipestockage[4].nom;
              Equipestockage[1].PV :=Equipestockage[4].PV;
              Equipestockage[1].niv :=Equipestockage[4].niv;
              Equipestockage[1].EXP :=EquipeStockage[4].EXP;
              Equipestockage[1].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].comp1 :=Equipestockage[4].comp1;
              Equipestockage[1].comp2 :=Equipestockage[4].comp2;
              Equipestockage[1].comp3 :=Equipestockage[4].comp3;
              Equipestockage[1].DEF :=Equipestockage[4].DEF;
              Equipestockage[1].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[2].nom,' fait d�sormais partie de votre �quipe !');
            end;
        4 : begin
              writeln('Salut ',EquipeStockage[1].nom,'!');
              Geekequipe[3].nom := EquipeStockage[1].nom;
              Geekequipe[3].PVdebase :=EquipeStockage[1].PV;
              Geekequipe[3].PVactuels := EquipeStockage[1].PV;
              Geekequipe[3].niv :=EquipeStockage[1].niv;
              Geekequipe[3].exp :=EquipeStockage[1].exp;
              Geekequipe[3].nomcomp1 :=EquipeStockage[1].nomcomp1;
              Geekequipe[3].nomcomp2 :=EquipeStockage[1].nomcomp2;
              Geekequipe[3].nomcomp3 :=EquipeStockage[1].nomcomp3;
              Geekequipe[3].comp1 :=EquipeStockage[1].comp1;
              Geekequipe[3].comp2 :=EquipeStockage[1].comp2;
              Geekequipe[3].comp3 :=EquipeStockage[1].comp3;
              Geekequipe[3].DEF :=EquipeStockage[1].DEF;
              Geekequipe[3].accesCompetence3 :=Equipestockage[1].accesCompetence3;


              Equipestockage[1].nom := Equipestockage[4].nom;
              Equipestockage[1].PV :=Equipestockage[4].PV;
              Equipestockage[1].niv :=Equipestockage[4].niv;
              Equipestockage[1].EXP :=EquipeStockage[4].EXP;
              Equipestockage[1].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[1].comp1 :=Equipestockage[4].comp1;
              Equipestockage[1].comp2 :=Equipestockage[4].comp2;
              Equipestockage[1].comp3 :=Equipestockage[4].comp3;
              Equipestockage[1].DEF :=Equipestockage[4].DEF;
              Equipestockage[1].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[3].nom,' fait d�sormais partie de votre �quipe !');
            end;
           end;
         end;
             if choixrecup=3 then
                begin
                  writeln(' A quel emplacement voulez vous r�cuperer ',EquipeStockage[2].nom,'?');
                  writeln;
                  writeln('1. A l''emplacement de votre premier geekemon');
                  writeln('2. A l''emplacement de votre second geekemon');
                  writeln('3. A l''emplacement de votre troisi�me geekemon');
                  writeln('4. A l''emplacement de votre dernier geekemon');

                readln(choixespace);
                case choixespace of
        1 : begin
              Geekequipe[0].nom := EquipeStockage[2].nom;
              Geekequipe[0].PVdebase :=EquipeStockage[2].PV;
              Geekequipe[0].PVactuels := EquipeStockage[2].PV;
              Geekequipe[0].niv :=EquipeStockage[2].niv;
              Geekequipe[0].exp :=EquipeStockage[2].exp;
              Geekequipe[0].nomcomp1 :=EquipeStockage[2].nomcomp1;
              Geekequipe[0].nomcomp2 :=EquipeStockage[2].nomcomp2;
              Geekequipe[0].nomcomp3 :=EquipeStockage[2].nomcomp3;
              Geekequipe[0].comp1 :=EquipeStockage[2].comp1;
              Geekequipe[0].comp2 :=EquipeStockage[2].comp2;
              Geekequipe[0].comp3 :=EquipeStockage[2].comp3;
              Geekequipe[0].DEF :=EquipeStockage[2].DEF;
              Geekequipe[0].accesCompetence3 :=Equipestockage[2].accesCompetence3;


              Equipestockage[2].nom := Equipestockage[4].nom;
              Equipestockage[2].PV :=Equipestockage[4].PV;
              Equipestockage[2].niv :=Equipestockage[4].niv;
              Equipestockage[2].EXP :=EquipeStockage[4].EXP;
              Equipestockage[2].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].comp1 :=Equipestockage[4].comp1;
              Equipestockage[2].comp2 :=Equipestockage[4].comp2;
              Equipestockage[2].comp3 :=Equipestockage[4].comp3;
              Equipestockage[2].DEF :=Equipestockage[4].DEF;
              Equipestockage[2].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[0].nom,' fait d�sormais partie de votre �quipe !');
              end;

        2 : begin
              writeln('Salut ',EquipeStockage[2].nom,'!');
              Geekequipe[1].nom := EquipeStockage[2].nom;
              Geekequipe[1].PVdebase :=EquipeStockage[2].PV;
              Geekequipe[1].PVactuels := EquipeStockage[2].PV;
              Geekequipe[1].niv :=EquipeStockage[2].niv;
              Geekequipe[1].exp :=EquipeStockage[2].exp;
              Geekequipe[1].nomcomp1 :=EquipeStockage[2].nomcomp1;
              Geekequipe[1].nomcomp2 :=EquipeStockage[2].nomcomp2;
              Geekequipe[1].nomcomp3 :=EquipeStockage[2].nomcomp3;
              Geekequipe[1].comp1 :=EquipeStockage[2].comp1;
              Geekequipe[1].comp2 :=EquipeStockage[2].comp2;
              Geekequipe[1].comp3 :=EquipeStockage[2].comp3;
              Geekequipe[1].DEF :=EquipeStockage[2].DEF;
              Geekequipe[1].accesCompetence3 :=Equipestockage[2].accesCompetence3;


              Equipestockage[2].nom := Equipestockage[4].nom;
              Equipestockage[2].PV :=Equipestockage[4].PV;
              Equipestockage[2].niv :=Equipestockage[4].niv;
              Equipestockage[2].EXP :=EquipeStockage[4].EXP;
              Equipestockage[2].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].comp1 :=Equipestockage[4].comp1;
              Equipestockage[2].comp2 :=Equipestockage[4].comp2;
              Equipestockage[2].comp3 :=Equipestockage[4].comp3;
              Equipestockage[2].DEF :=Equipestockage[4].DEF;
              Equipestockage[2].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[1].nom,' fait d�sormais partie de votre �quipe !');
            end;

        3 : begin
              writeln('Salut ',EquipeStockage[2].nom,'!');
              Geekequipe[2].nom := EquipeStockage[2].nom;
              Geekequipe[2].PVdebase :=EquipeStockage[2].PV;
              Geekequipe[2].PVactuels := EquipeStockage[2].PV;
              Geekequipe[2].niv :=EquipeStockage[2].niv;
              Geekequipe[2].exp :=EquipeStockage[2].exp;
              Geekequipe[2].nomcomp1 :=EquipeStockage[2].nomcomp1;
              Geekequipe[2].nomcomp2 :=EquipeStockage[2].nomcomp2;
              Geekequipe[2].nomcomp3 :=EquipeStockage[2].nomcomp3;
              Geekequipe[2].comp1 :=EquipeStockage[2].comp1;
              Geekequipe[2].comp2 :=EquipeStockage[2].comp2;
              Geekequipe[2].comp3 :=EquipeStockage[2].comp3;
              Geekequipe[2].DEF :=EquipeStockage[2].DEF;
              Geekequipe[2].accesCompetence3 :=Equipestockage[2].accesCompetence3;


              Equipestockage[2].nom := Equipestockage[4].nom;
              Equipestockage[2].PV :=Equipestockage[4].PV;
              Equipestockage[2].niv :=Equipestockage[4].niv;
              Equipestockage[2].EXP :=EquipeStockage[4].EXP;
              Equipestockage[2].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].comp1 :=Equipestockage[4].comp1;
              Equipestockage[2].comp2 :=Equipestockage[4].comp2;
              Equipestockage[2].comp3 :=Equipestockage[4].comp3;
              Equipestockage[2].DEF :=Equipestockage[4].DEF;
              Equipestockage[2].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[2].nom,' fait d�sormais partie de votre �quipe !');
            end;
        4 : begin
              writeln('Salut ',EquipeStockage[2].nom,'!');
              Geekequipe[3].nom := EquipeStockage[2].nom;
              Geekequipe[3].PVdebase :=EquipeStockage[2].PV;
              Geekequipe[3].PVactuels := EquipeStockage[2].PV;
              Geekequipe[3].niv :=EquipeStockage[2].niv;
              Geekequipe[3].exp :=EquipeStockage[2].exp;
              Geekequipe[3].nomcomp1 :=EquipeStockage[2].nomcomp1;
              Geekequipe[3].nomcomp2 :=EquipeStockage[2].nomcomp2;
              Geekequipe[3].nomcomp3 :=EquipeStockage[2].nomcomp3;
              Geekequipe[3].comp1 :=EquipeStockage[2].comp1;
              Geekequipe[3].comp2 :=EquipeStockage[2].comp2;
              Geekequipe[3].comp3 :=EquipeStockage[2].comp3;
              Geekequipe[3].DEF :=EquipeStockage[2].DEF;
              Geekequipe[3].accesCompetence3 :=Equipestockage[2].accesCompetence3;

              Equipestockage[2].nom := Equipestockage[4].nom;
              Equipestockage[2].PV :=Equipestockage[4].PV;
              Equipestockage[2].niv :=Equipestockage[4].niv;
              Equipestockage[2].EXP :=EquipeStockage[4].EXP;
              Equipestockage[2].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[2].comp1 :=Equipestockage[4].comp1;
              Equipestockage[2].comp2 :=Equipestockage[4].comp2;
              Equipestockage[2].comp3 :=Equipestockage[4].comp3;
              Equipestockage[2].DEF :=Equipestockage[4].DEF;
              Equipestockage[2].accesCompetence3 :=Equipestockage[4].accesCompetence3;;

              writeln(geekequipe[3].nom,' fait d�sormais partie de votre �quipe !');
            end;
            end;
                end;
             if choixrecup=4  then
                begin
                  writeln(' A quel emplacement voulez vous r�cuperer ',EquipeStockage[3].nom,'?');
                  writeln;
                  writeln('1. A l''emplacement de votre premier geekemon');
                  writeln('2. A l''emplacement de votre second geekemon');
                  writeln('3. A l''emplacement de votre troisi�me geekemon');
                  writeln('4. A l''emplacement de votre dernier geekemon');

                readln(choixespace);
                case choixespace of
        1 : begin
              writeln('Salut ',EquipeStockage[3].nom,'!');
              Geekequipe[0].nom := EquipeStockage[3].nom;
              Geekequipe[0].PVdebase :=EquipeStockage[3].PV;
              Geekequipe[0].PVactuels := EquipeStockage[3].PV;
              Geekequipe[0].niv :=EquipeStockage[3].niv;
              Geekequipe[0].exp :=EquipeStockage[3].exp;
              Geekequipe[0].nomcomp1 :=EquipeStockage[3].nomcomp1;
              Geekequipe[0].nomcomp2 :=EquipeStockage[3].nomcomp2;
              Geekequipe[0].nomcomp3 :=EquipeStockage[3].nomcomp3;
              Geekequipe[0].comp1 :=EquipeStockage[3].comp1;
              Geekequipe[0].comp2 :=EquipeStockage[3].comp2;
              Geekequipe[0].comp3 :=EquipeStockage[3].comp3;
              Geekequipe[0].DEF :=EquipeStockage[3].DEF;
              Geekequipe[0].accesCompetence3 :=Equipestockage[3].accesCompetence3;


              Equipestockage[3].nom := Equipestockage[4].nom;
              Equipestockage[3].PV :=Equipestockage[4].PV;
              Equipestockage[3].niv :=Equipestockage[4].niv;
              Equipestockage[3].EXP :=EquipeStockage[4].EXP;
              Equipestockage[3].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].comp1 :=Equipestockage[4].comp1;
              Equipestockage[3].comp2 :=Equipestockage[4].comp2;
              Equipestockage[3].comp3 :=Equipestockage[4].comp3;
              Equipestockage[3].DEF :=Equipestockage[4].DEF;
              Equipestockage[3].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[0].nom,' fait d�sormais partie de votre �quipe !');
              end;

        2 : begin
              writeln('Salut ',EquipeStockage[3].nom,'!');
              Geekequipe[1].nom := EquipeStockage[3].nom;
              Geekequipe[1].PVdebase :=EquipeStockage[3].PV;
              Geekequipe[1].PVactuels := EquipeStockage[3].PV;
              Geekequipe[1].niv :=EquipeStockage[3].niv;
              Geekequipe[1].exp :=EquipeStockage[3].exp;
              Geekequipe[1].nomcomp1 :=EquipeStockage[3].nomcomp1;
              Geekequipe[1].nomcomp2 :=EquipeStockage[3].nomcomp2;
              Geekequipe[1].nomcomp3 :=EquipeStockage[3].nomcomp3;
              Geekequipe[1].comp1 :=EquipeStockage[3].comp1;
              Geekequipe[1].comp2 :=EquipeStockage[3].comp2;
              Geekequipe[1].comp3 :=EquipeStockage[3].comp3;
              Geekequipe[1].DEF :=EquipeStockage[3].DEF;
              Geekequipe[1].accesCompetence3 :=Equipestockage[3].accesCompetence3;

              Equipestockage[3].nom := Equipestockage[4].nom;
              Equipestockage[3].PV :=Equipestockage[4].PV;
              Equipestockage[3].niv :=Equipestockage[4].niv;
              Equipestockage[3].EXP :=EquipeStockage[4].EXP;
              Equipestockage[3].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].comp1 :=Equipestockage[4].comp1;
              Equipestockage[3].comp2 :=Equipestockage[4].comp2;
              Equipestockage[3].comp3 :=Equipestockage[4].comp3;
              Equipestockage[3].DEF :=Equipestockage[4].DEF;
              Equipestockage[3].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[1].nom,' fait d�sormais partie de votre �quipe !');
            end;

        3 : begin
              writeln('Salut ',EquipeStockage[3].nom,'!');
              Geekequipe[2].nom := EquipeStockage[3].nom;
              Geekequipe[2].PVdebase :=EquipeStockage[3].PV;
              Geekequipe[2].PVactuels := EquipeStockage[3].PV;
              Geekequipe[2].niv :=EquipeStockage[3].niv;
              Geekequipe[2].exp :=EquipeStockage[3].exp;
              Geekequipe[2].nomcomp1 :=EquipeStockage[3].nomcomp1;
              Geekequipe[2].nomcomp2 :=EquipeStockage[3].nomcomp2;
              Geekequipe[2].nomcomp3 :=EquipeStockage[3].nomcomp3;
              Geekequipe[2].comp1 :=EquipeStockage[3].comp1;
              Geekequipe[2].comp2 :=EquipeStockage[3].comp2;
              Geekequipe[2].comp3 :=EquipeStockage[3].comp3;
              Geekequipe[2].DEF :=EquipeStockage[3].DEF;
              Geekequipe[2].accesCompetence3 :=Equipestockage[3].accesCompetence3;

              Equipestockage[3].nom := Equipestockage[4].nom;
              Equipestockage[3].PV :=Equipestockage[4].PV;
              Equipestockage[3].niv :=Equipestockage[4].niv;
              Equipestockage[3].EXP :=EquipeStockage[4].EXP;
              Equipestockage[3].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].comp1 :=Equipestockage[4].comp1;
              Equipestockage[3].comp2 :=Equipestockage[4].comp2;
              Equipestockage[3].comp3 :=Equipestockage[4].comp3;
              Equipestockage[3].DEF :=Equipestockage[4].DEF;
              Equipestockage[3].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[2].nom,' fait d�sormais partie de votre �quipe !');
            end;
        4 : begin
              writeln('Salut ',EquipeStockage[3].nom,'!');
              Geekequipe[3].nom := EquipeStockage[3].nom;
              Geekequipe[3].PVdebase :=EquipeStockage[3].PV;
              Geekequipe[3].PVactuels := EquipeStockage[3].PV;
              Geekequipe[3].niv :=EquipeStockage[3].niv;
              Geekequipe[3].exp :=EquipeStockage[3].exp;
              Geekequipe[3].nomcomp1 :=EquipeStockage[3].nomcomp1;
              Geekequipe[3].nomcomp2 :=EquipeStockage[3].nomcomp2;
              Geekequipe[3].nomcomp3 :=EquipeStockage[3].nomcomp3;
              Geekequipe[3].comp1 :=EquipeStockage[3].comp1;
              Geekequipe[3].comp2 :=EquipeStockage[3].comp2;
              Geekequipe[3].comp3 :=EquipeStockage[3].comp3;
              Geekequipe[3].DEF :=EquipeStockage[3].DEF;
              Geekequipe[3].accesCompetence3 :=Equipestockage[3].accesCompetence3;

              Equipestockage[3].nom := Equipestockage[4].nom;
              Equipestockage[3].PV :=Equipestockage[4].PV;
              Equipestockage[3].niv :=Equipestockage[4].niv;
              Equipestockage[3].EXP :=EquipeStockage[4].EXP;
              Equipestockage[3].nomcomp1 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].nomcomp2 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].nomcomp3 :=Equipestockage[4].nomcomp1;
              Equipestockage[3].comp1 :=Equipestockage[4].comp1;
              Equipestockage[3].comp2 :=Equipestockage[4].comp2;
              Equipestockage[3].comp3 :=Equipestockage[4].comp3;
              Equipestockage[3].DEF :=Equipestockage[4].DEF;
              Equipestockage[3].accesCompetence3 :=Equipestockage[4].accesCompetence3;

              writeln(geekequipe[3].nom,' fait d�sormais partie de votre �quipe !');
            end;
            end;
            end;

        end;
        writeln('voulez - vous sortir du PC?');
        writeln('1 - oui');
        writeln('2 - non');
        sortie := readVerif(1,2);

  end;

  end;
end.
