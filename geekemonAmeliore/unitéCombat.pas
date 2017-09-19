unit unit�Combat;
//Cette unit� contient tout le syst�me de combat du jeu, ainsi que le syst�me d'�volution des caract�ristiques des geekemons.
interface
uses geekemon, ETDDG;
procedure combatGeekemonSauvage (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofpc; quitter : integer);
procedure combat (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; num�roGeekemon : integer; var numGeekemonEquipe : integer; nom1 : string ; var avancement : avancementQuete);
procedure combatVsGeekDresseur (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var numGeekemonEquipe : integer; var numDressEquipe : integer);
procedure capture (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var numGeekemonEquipe : integer; var num�roGeekemon : integer ; var nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofpc; quitter : integer);
procedure choixDresseur (var geekedex : arrayOfGeekemon;var  geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofpc; quitter : integer);
procedure combatDresseur (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var nom1 : string; var avancement : avancementQuete; nomDresseurs : arrayofdresseurs; numDressEquipe : integer; equipeStockage : arrayofpc; quitter : integer);
procedure choixBoss (var geekedex : arrayOfGeekemon;var  geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; num�roBoss : integer; equipeStockage : arrayofpc; quitter : integer);
procedure combatBoss(var geekedex : arrayOfGeekemon;var  geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; var numDressEquipe : integer; equipeStockage : arrayofpc; quitter : integer);
procedure niveau (var geekEquipe : arrayOfEquipe; numGeekemonEquipe : integer);
procedure evolution (var geekEquipe : arrayOfEquipe; numGeekemonEquipe : integer);
procedure experience (var geekEquipe : arrayOfEquipe; numGeekemonEquipe : integer);


implementation
uses changementSalle, Am�liorations, sc�nario;
//////////////////////////////////
procedure combatGeekemonSauvage (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipestockage : arrayofpc; quitter : integer);

  var
    randomGeekemon1 : string; //Geekemon al�atoire du geekedex
    num�roGeekemon : integer; //Le num�ro du Geekemon de l'�quipe du joueur qui correspond � son indice dans le tableau
    choixSuiteCombat : integer;
    nbGeekemonEquipeRestants : integer;
    numGeekemonEquipe : integer; //Le num�ro du Geekemon de l'�quipe du joueur qui correspond � son indice dans le tableau
    pvGeekemonSauvage : integer; //Les pv de base du geekemon sauvage, pour les restaurer dans le geekedex une fois qu'il est K.O.
    nbGeekemondeBase : integer;
    //Le nombre de Geekemons de l'�quipe du joueur avant de commencer le combat.
    //Il influe sur le d�roulement des actions.

begin
    Randomize();
    num�roGeekemon := Random(23);
    //On prend un geekemon al�atoire du geekedex.
    randomGeekemon1 := geekedex[num�roGeekemon].nom;
    pvGeekemonSauvage := geekedex[num�roGeekemon].pv;
    nbGeekemonDeBase := geekEquipe[0].nbGeekemons;
    nbGeekemonEquipeRestants := geekEquipe[0].nbGeekemons;
    //Premier cas : le joueur a d�j� trois geekemons KO dans son �quipe.
    if geekEquipe[2].PVactuels <= 0 then
    begin
      numGeekemonEquipe := 3;
      //Le troisi�me geekemon du joueur est tomb� KO dans un combat pr�c�dent, il lui en reste donc un.
      nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 3;
      writeln ('Un ', randomGeekemon1, ' sauvage appara�t !');
      writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
      combat(geekedex, geekEquipe, nbPotion, DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
      //On lance le combat.
      while nbGeekemonEquipeRestants <> 0 do
      begin
        if geekedex[num�roGeekemon].PV <= 0 then
        begin
          writeln ('Le geekemon adverse est K.O. !');
          //Les pv du Geekemon sauvage sont r�attribu�s dans le geekedex et on a la possibilit� de la capturer.
          experience (geekEquipe, numGeekemonEquipe);
          niveau(geekEquipe, numGeekemonEquipe);
          geekedex[num�roGeekemon].PV := pvGeekemonSauvage;
          capture (geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, num�roGeekemon, nom1, avancement, nomDresseurs, equipeStockage, quitter);
          changementdeSalle(geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        end
        else
        begin
        writeln ('Vous n''avez plus de geekemons en forme ! Vous allez �tre renvoy� � l''ETDDG.');
        //L'�quipe du joueur est soign�e en cas de d�faite.
        readln;
        effacerEcran;
        soin (geekedex, geekEquipe, nbPotion, DressEquipe);
        changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        end;
      end;
    end
    //Second cas : le joueur a d�j� deux geekemons KO dans son �quipe
    else if geekEquipe[1].PVactuels <= 0 then
    begin
      numGeekemonEquipe := 2;
      nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 2;
      writeln ('Un ', randomGeekemon1, ' sauvage appara�t !');
      writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
      combat(geekedex, geekEquipe, nbPotion, DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
      while nbGeekemonEquipeRestants <> 0 do
      //Tant que le joueur a des geekemons en forme dans son �quipe, il envoie le suivant.
      begin
        if geekedex[num�roGeekemon].PV <= 0 then
        begin
          writeln ('Le geekemon adverse est K.O. !');
          experience (geekEquipe, numGeekemonEquipe);
          niveau(geekEquipe, numGeekemonEquipe);
          geekedex[num�roGeekemon].PV := pvGeekemonSauvage;
          capture (geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, num�roGeekemon, nom1, avancement, nomDresseurs, equipeStockage, quitter);
          changementdeSalle(geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        end
        else
        begin
          case nbGeekemonEquipeRestants of
          1 : Begin
          writeln ('Votre geekemon est K.O. ! Souhaitez vous envoyer un autre geekemon' +
               'ou fuir ?');
          writeln ('1 - envoyer un autre Geekemon');
          writeln ('2 - fuir');
          readln;
          effacerEcran;
          choixSuiteCombat := readVerif(1,2);
          if choixSuiteCombat = 1 then
          begin
          numGeekemonEquipe := 3;
          writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer !');
          combat(geekedex, geekEquipe, nbPotion,DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
          end
          else
          begin
          writeln ('Vous avez fuit !');
          readln;
          effacerEcran;
          changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
          end;
          End;
          0 : begin
          writeln ('Vous n''avez plus de geekemons en forme ! Vous allez �tre renvoy� � l''ETTDG.');
          readln;
          effacerEcran;
          soin (geekedex, geekEquipe, nbPotion, DressEquipe);
          changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
          end;
          end;
        end;
    end;
    end
    //Troisi�me cas : le joueur a d�j� un geekemon KO dans son �quipe
    else if geekEquipe[0].PVactuels <= 0 then
      begin
      numGeekemonEquipe := 1;
      nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 1;
      writeln ('Un ', randomGeekemon1, ' sauvage appara�t !');
      writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
      combat(geekedex, geekEquipe, nbPotion, DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
      while nbGeekemonEquipeRestants <> 0 do
      begin
        if geekedex[num�roGeekemon].PV <= 0 then
        begin
          writeln ('Le geekemon adverse est K.O. !');
          readln;
          effacerEcran;
          experience (geekEquipe, numGeekemonEquipe);
          niveau(geekEquipe, numGeekemonEquipe);
          geekedex[num�roGeekemon].PV := pvGeekemonSauvage;
          capture (geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, num�roGeekemon, nom1, avancement, nomDresseurs, equipeStockage, quitter);
          changementdeSalle(geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        end
        else
        begin
          case nbGeekemonEquipeRestants of
          2 : begin
          writeln ('Votre geekemon est K.O. ! Souhaitez vous envoyer un autre geekemon' +
               'ou fuir ?');
          writeln ('1 - envoyer un autre Geekemon');
          writeln ('2 - fuir');
          choixSuiteCombat := readVerif(1,2);
          effacerEcran;
            if choixSuiteCombat = 1 then
            begin
            numGeekemonEquipe := 2;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer !');
            combat(geekedex, geekEquipe, nbPotion,DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
            end
            else
            begin
            writeln ('Vous avez fuit !');
            readln;
            effacerEcran;
            changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
            end;
          end;
          1 : Begin
          //En fonction du nombre de geekemons que le joueur avait � la base,
          //s'il lui en reste un, on envoie un geekemon � un indice du tableau
          //geekEquipe diff�rent.
          case nbGeekemondeBase of
            4 : begin
              writeln ('Votre geekemon est K.O. ! Souhaitez vous envoyer un autre geekemon' +
               'ou fuir ?');
              writeln ('1 - envoyer un autre Geekemon');
              writeln ('2 - fuir');
              choixSuiteCombat := readVerif(1,2);
              effacerEcran;
              if choixSuiteCombat = 1 then
              begin
                numGeekemonEquipe := 3;
                writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer !');
                combat(geekedex, geekEquipe, nbPotion,DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
              end
              else
              begin
              writeln ('Vous avez fuit !');
              readln;
              effacerEcran;
              changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
              end;
            end;

            3 : begin
              writeln ('Votre geekemon est K.O. ! Souhaitez vous envoyer un autre geekemon' +
               'ou fuir ?');
              writeln ('1 - envoyer un autre Geekemon');
              writeln ('2 - fuir');
              choixSuiteCombat := readVerif(1,2);
              effacerEcran;
              if choixSuiteCombat = 1 then
              begin
                numGeekemonEquipe := 3;
                writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer !');
                combat(geekedex, geekEquipe, nbPotion,DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
              end
              else
              begin
              writeln ('Vous avez fuit !');
              readln;
              effacerEcran;
              changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
              end;
            end;
          end;
          end;
          0 : begin
          writeln ('Vous n''avez plus de geekemons en forme ! Vous allez �tre renvoy� � l''ETDDG.');
          readln;
          effacerEcran;
          soin (geekedex, geekEquipe, nbPotion, DressEquipe);
          changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
          end;
          end;
        end;
    end;
    end
    //Dernier cas : le joueur n'a pas de geekemon KO dans son �quipe
    else
    begin
    numGeekemonEquipe := 0;
    writeln ('Un ', randomGeekemon1, ' sauvage appara�t !');
    writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
    combat(geekedex, geekEquipe, nbPotion, DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
    while nbGeekemonEquipeRestants <> 0 do
    begin
    if geekedex[num�roGeekemon].PV <= 0 then
    begin
      writeln ('Le geekemon adverse est K.O. !');
      readln;
      effacerEcran;
      experience (geekEquipe, numGeekemonEquipe);
      niveau(geekEquipe, numGeekemonEquipe);
      geekedex[num�roGeekemon].PV := pvGeekemonSauvage;
      capture (geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, num�roGeekemon, nom1, avancement, nomDresseurs, equipeStockage, quitter);
      changementdeSalle(geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
    end
    else
    begin
      nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 1;
      case nbGeekemonEquipeRestants of
        3 : Begin
        writeln ('Votre geekemon est K.O. ! Souhaitez vous envoyer un autre geekemon' +
               'ou fuir ?');
        writeln ('1 - envoyer un autre Geekemon');
        writeln ('2 - fuir');
        choixSuiteCombat := readVerif(1,2);
        effacerEcran;
        if choixSuiteCombat = 1 then
        begin
          numGeekemonEquipe := 1;
          writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer !');
          combat(geekedex, geekEquipe, nbPotion,DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
        end
        else
        begin
          writeln ('Vous avez fuit !');
          readln;
          effacerEcran;
          changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        end;
        End;

      2 : Begin
        case nbGeekemondeBase of
        4 : begin
        writeln ('Votre geekemon est K.O. ! Souhaitez vous envoyer un autre geekemon' +
               'ou fuir ?');
        writeln ('1 - envoyer un autre Geekemon');
        writeln ('2 - fuir');
        choixSuiteCombat := readVerif(1,2);
        effacerEcran;
        if choixSuiteCombat = 1 then
        begin
          numGeekemonEquipe := 2;
          writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer !');
          combat(geekedex, geekEquipe, nbPotion,DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
        end
        else
        begin
          writeln ('Vous avez fuit !');
          readln;
          effacerEcran;
          changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        end;
        end;
        3 : begin
        writeln ('Votre geekemon est K.O. ! Souhaitez vous envoyer un autre geekemon' +
               'ou fuir ?');
        writeln ('1 - envoyer un autre Geekemon');
        writeln ('2 - fuir');
        choixSuiteCombat := readVerif(1,2);
        effacerEcran;
        if choixSuiteCombat = 1 then
        begin
          numGeekemonEquipe := 1;
          writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer !');
          combat(geekedex, geekEquipe, nbPotion,DressEquipe, num�roGeekemon, numGeekemonEquipe,nom1, avancement);
        end
        else
        begin
          writeln ('Vous avez fuit !');
          readln;
          effacerEcran;
          changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe,nom1, avancement, nomDresseurs, equipeStockage, quitter);
        end;
        end;
        end;
        End;

      1 : Begin
        case nbGeekemondeBase of
        4 : begin
        writeln ('Votre geekemon est K.O. ! Souhaitez vous envoyer un autre geekemon' +
               'ou fuir ?');
        writeln ('1 - envoyer un autre Geekemon');
        writeln ('2 - fuir');
        choixSuiteCombat := readVerif(1,2);
        effacerEcran;
        if choixSuiteCombat = 1 then
        begin
          numGeekemonEquipe := 3;
          writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer !');
          combat(geekedex, geekEquipe, nbPotion,DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
        end
        else
        begin
          writeln ('Vous avez fuit !');
          readln;
          changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        end;
        end;
        3 : begin
        writeln ('Votre geekemon est K.O. ! Souhaitez vous envoyer un autre geekemon' +
               'ou fuir ?');
        writeln ('1 - envoyer un autre Geekemon');
        writeln ('2 - fuir');
        choixSuiteCombat := readVerif(1,2);
        effacerEcran;
        if choixSuiteCombat = 1 then
        begin
          numGeekemonEquipe := 2;
          writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer !');
          combat(geekedex, geekEquipe, nbPotion,DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
        end
        else
        begin
          writeln ('Vous avez fuit !');
          readln;
          effacerEcran;
          changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        end;
        end;
        2 : begin
        writeln ('Votre geekemon est K.O. ! Souhaitez vous envoyer un autre geekemon' +
               'ou fuir ?');
        writeln ('1 - envoyer un autre Geekemon');
        writeln ('2 - fuir');
        choixSuiteCombat := readVerif(1,2);
        effacerEcran;
        if choixSuiteCombat = 1 then
        begin
          numGeekemonEquipe := 1;
          writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer !');
          combat(geekedex, geekEquipe, nbPotion,DressEquipe, num�roGeekemon, numGeekemonEquipe, nom1, avancement);
        end
        else
        begin
          writeln ('Vous avez fuit !');
          readln;
          effacerEcran;
          changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        end;
        end;
        End;
      End;
      0 : Begin
          writeln ('Vous n''avez plus de geekemons en forme ! Vous allez �tre renvoy� � l''ETTDG.');
          readln;
          effacerEcran;
          soin (geekedex, geekEquipe, nbPotion, DressEquipe);
          changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe,nom1, avancement, nomDresseurs, equipeStockage, quitter);
        End;
    end;
  end;
  end;
  end;
  end;


//////////////////////////////////////
procedure combat (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; num�roGeekemon : integer;
                  var numGeekemonEquipe : integer; nom1 :string ; var avancement : avancementQuete);

  var
    degatsInflig�s : integer;
    degatsRe�us : integer;
    choixAction : integer;


  begin
  //Le code correspond � un round de combat. On sort de la boucle quand un des deux geekemons
  // a ses pvs inf�rieurs ou �gaux � 0.
    repeat
      if (geekEquipe[numGeekemonEquipe].accesCompetence3 = False) then
      // Si le bool�en accesCompetence3 est � faux, alors le geekemon
      //ne peut utiliser que deux comp�tences.
      begin

        writeln ('Que souhaitez- vous faire ?');

        writeln ('1 - Utiliser la premiere comp�tence ' ,geekEquipe[numGeekemonEquipe].nomComp1);

        writeln ('2 - Utiliser la deuxieme comp�tence ' ,geekEquipe[numGeekemonEquipe].nomComp2);

        writeln ('3 - Utiliser une potion');

        choixAction := readVerif(1,3);
        effacerEcran;
        if choixAction = 1 then
        //On met en relation la valeur de la comp�tence et la d�fense pour calculer les d�g�ts.
        //Si les pv du geekemon attaquant sont inf�rieurs � 0, il passe son tour.
        begin
          degatsInflig�s := geekEquipe[numGeekemonEquipe].COMP1 - geekedex[num�roGeekemon].DEF;
          degatsRe�us := geekedex[num�roGeekemon].COMP1 - geekEquipe[numGeekemonEquipe].DEF;
        end;
        if choixAction = 2 then
        begin
          degatsInflig�s := geekEquipe[numGeekemonEquipe].COMP2 - geekedex[num�roGeekemon].DEF;
          degatsRe�us := geekedex[num�roGeekemon].COMP2 - geekEquipe[numGeekemonEquipe].DEF;
        end;
        if ((choixAction = 1) or (choixAction = 2)) then
        begin
          if geekEquipe[numGeekemonEquipe].PVactuels > 0 then
          begin
          writeln (geekEquipe[numGeekemonEquipe].nom, ' attaque ! Cela inflige ',degatsInflig�s, ' d�g�ts.');
          geekedex[num�roGeekemon].PV := geekedex[num�roGeekemon].PV - degatsInflig�s;
          end;
          if geekedex[num�roGeekemon].PV > 0 then
          begin
            writeln (geekedex[num�roGeekemon].nom, ' attaque ! Cela inflige ',degatsRe�us, ' d�g�ts.');
            geekEquipe[numGeekemonEquipe].PVactuels := geekEquipe[numGeekemonEquipe].PVactuels - degatsRe�us;
          end;
          end
        else
        begin
          if nbPotion = 0 then
          begin
            writeln ('Vous n''avez plus de potions dans votre sac !');
            readln;
            effacerEcran;
          end
          else
          begin
          geekEquipe[numGeekemonEquipe].PVactuels := geekEquipe[numGeekemonEquipe].PVactuels + 5;
          writeln ('F�licitations ! Votre geekemon a restaur� 5 points de vie.');
          readln;
          effacerEcran;
          nbPotion := nbPotion - 1;
          end;
        end;
      end
      else
      begin
        writeln ('Que souhaitez- vous faire ?');
        writeln ('1 - Utiliser la premi�re comp�tence ' ,geekEquipe[numGeekemonEquipe].nomComp1);
        writeln ('2 - Utiliser la deuxi�me comp�tence ' ,geekEquipe[numGeekemonEquipe].nomComp2);
        writeln ('3 - Utiliser la troisi�me comp�tence ' ,geekEquipe[numGeekemonEquipe].nomComp3);
        writeln ('4 - Utiliser une potion');
        choixAction := readVerif(1,4);
        effacerEcran;
        if choixAction = 1 then
        begin
          degatsInflig�s := geekEquipe[numGeekemonEquipe].COMP1 - geekedex[num�roGeekemon].DEF;
          degatsRe�us := geekedex[num�roGeekemon].COMP1 - geekEquipe[numGeekemonEquipe].DEF;
        end;
        if choixAction = 2 then
        begin
          degatsInflig�s := geekEquipe[numGeekemonEquipe].COMP2 - geekedex[num�roGeekemon].DEF;
          degatsRe�us := geekedex[num�roGeekemon].COMP2 - geekEquipe[numGeekemonEquipe].DEF;
        end;
        if choixAction = 3 then
        begin
          degatsInflig�s := geekEquipe[numGeekemonEquipe].COMP3 - geekedex[num�roGeekemon].DEF;
          degatsRe�us := geekedex[num�roGeekemon].COMP3 - geekEquipe[numGeekemonEquipe].DEF;
        end;
        if ((choixAction = 1) or (choixAction = 2) or (choixAction = 3)) then
        begin
          if geekEquipe[numGeekemonEquipe].PVactuels > 0 then
          begin
          writeln (geekEquipe[numGeekemonEquipe].nom, ' attaque ! Cela inflige ',
          degatsInflig�s, ' d�g�ts.');
          geekedex[num�roGeekemon].PV := geekedex[num�roGeekemon].PV - degatsInflig�s;
          end;
          if geekedex[num�roGeekemon].PV > 0 then
          begin
          writeln (geekedex[num�roGeekemon].nom, ' attaque ! Cela inflige ',degatsRe�us, ' d�g�ts.');
          geekEquipe[numGeekemonEquipe].PVactuels := geekEquipe[numGeekemonEquipe].PVactuels - degatsRe�us;
          end;
          end
        else
        begin
          if nbPotion = 0 then
          begin
            writeln ('Vous n''avez plus de potions dans votre sac !');
            readln;
            effacerEcran;
          end
          else
          begin
          geekEquipe[numGeekemonEquipe].PVactuels := geekEquipe[numGeekemonEquipe].PVactuels + 5;
          writeln ('F�licitations ! Votre geekemon a restaur� 5 points de vie.');
          readln;
          effacerEcran;
          nbPotion := nbPotion - 1;
          end;
        end;
      end

  until (geekedex[num�roGeekemon].PV <= 0) or (geekEquipe[numGeekemonEquipe].PVactuels <= 0);
  end;

 /////////////////////////////
procedure choixDresseur (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var nom1 : string; var avancement : avancementQuete; nomDresseurs : arrayofdresseurs; equipeStockage : arrayofpc; quitter : integer);

var
  choixDresseur : integer;
  numDressEquipe : integer;

begin
  writeln ('Veuillez rentrer le nom du dresseur que vous souhaitez affronter :');
  writeln ('1 - Alexis le Bon');
  writeln ('2 - Pierre le Truand');
  writeln ('3 - David la Brute');
  choixDresseur := readVerif(1,3);
  effacerEcran;
  //selon la valeur de choixDresseur, on appelle le combatDresseur avec une valeur
  //de numDressEquipe diff�rente, ce qui provoquera un combat contre un dresseur
  //pr�cis avec une �quipe pr�cise
  case choixDresseur of
  1 : begin
        numDressEquipe := 0;
        combatDresseur (geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, numDressEquipe, equipeStockage, quitter);
      end;
  2 : begin
        numDressEquipe := 4;
        combatDresseur (geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, numDressEquipe, equipeStockage, quitter);
      end;
  3 : begin
        numDressEquipe := 8;
        combatDresseur (geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, numDressEquipe, equipeStockage, quitter);
      end;
  end;

end;

/////////////////////////////
procedure combatVsGeekDresseur (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var numGeekemonEquipe : integer; var numDressEquipe : integer);

var
  degatsInflig�s : integer;
  degatsRe�us : integer;
  choixAction : integer;

begin
  repeat
        //Le combat contre le geekemon d'un dresseur est similaire au combat contre un geekemon sauvage,
        //sauf qu'on utilise
        //les donn�es du tableau DressEquipe au lieu d'utiliser celles du geekedex.
        if (geekEquipe[numGeekemonEquipe].accesCompetence3 = False) then
      begin
        writeln ('Que souhaitez- vous faire ?');
        writeln ('1 - Utiliser la premiere comp�tence ' ,geekEquipe[numGeekemonEquipe].nomComp1);
        writeln ('2 - Utiliser la deuxieme comp�tence ' ,geekEquipe[numGeekemonEquipe].nomComp2);
        writeln ('3 - Utiliser une potion');
        choixAction := readVerif(1,3);
        effacerEcran;
        if choixAction = 1 then
        begin
          degatsInflig�s := geekEquipe[numGeekemonEquipe].COMP1 - dressEquipe[numDressEquipe].DEF;
          degatsRe�us := dressEquipe[numDressEquipe].COMP1 - geekEquipe[numGeekemonEquipe].DEF;
        end;
        if choixAction = 2 then
        begin
          degatsInflig�s := geekEquipe[numGeekemonEquipe].COMP2 - dressEquipe[numDressEquipe].DEF;
          degatsRe�us := dressEquipe[numDressEquipe].COMP2 - geekEquipe[numGeekemonEquipe].DEF;
        end;
        if ((choixAction = 1) or (choixAction = 2)) then
        begin
          if geekEquipe[numGeekemonEquipe].PVactuels > 0 then
          begin
          writeln (geekEquipe[numGeekemonEquipe].nom, ' attaque ! Cela inflige ',
          degatsInflig�s, ' d�g�ts.');
          dressEquipe[numDressEquipe].PV := dressEquipe[numDressEquipe].PV - degatsInflig�s;
          end;
          if dressEquipe[numDressEquipe].PV > 0 then
          begin
            writeln (dressEquipe[numDressEquipe].nom, ' attaque ! Cela inflige ',degatsRe�us, ' d�g�ts.');
            geekEquipe[numGeekemonEquipe].PVactuels := geekEquipe[numGeekemonEquipe].PVactuels - degatsRe�us;
          end;
          end
        else
        begin
          if nbPotion = 0 then
          begin
            writeln ('Vous n''avez plus de potions dans votre sac !');
            readln;
            effacerEcran;
          end
          else
          begin
          geekEquipe[numGeekemonEquipe].PVactuels := geekEquipe[numGeekemonEquipe].PVactuels + 5;
          writeln ('F�licitations ! Votre geekemon a restaur� 5 points de vie.');
          readln;
          effacerEcran;
          nbPotion := nbPotion - 1;
          end;
        end;
      end
      else
      begin
        writeln ('Que souhaitez- vous faire ?');
        writeln ('1 - Utiliser la premi�re comp�tence ' ,geekEquipe[numGeekemonEquipe].nomComp1);
        writeln ('2 - Utiliser la deuxi�me comp�tence ' ,geekEquipe[numGeekemonEquipe].nomComp2);
        writeln ('3 - Utiliser la troisi�me comp�tence ' ,geekEquipe[numGeekemonEquipe].nomComp2);
        writeln ('4 - Utiliser une potion');
        choixAction := readVerif(1,4);
        effacerEcran;
        if choixAction = 1 then
        begin
          degatsInflig�s := geekEquipe[numGeekemonEquipe].COMP1 - dressEquipe[numDressEquipe].DEF;
          degatsRe�us := dressEquipe[numDressEquipe].COMP1 - geekEquipe[numGeekemonEquipe].DEF;
        end;
        if choixAction = 2 then
        begin
          degatsInflig�s := geekEquipe[numGeekemonEquipe].COMP2 - dressEquipe[numDressEquipe].DEF;
          degatsRe�us := dressEquipe[numDressEquipe].COMP2 - geekEquipe[numGeekemonEquipe].DEF;
        end;
        if choixAction = 3 then
        begin
          degatsInflig�s := geekEquipe[numGeekemonEquipe].COMP3 - dressEquipe[numDressEquipe].DEF;
          degatsRe�us := dressEquipe[numDressEquipe].COMP3 - geekEquipe[numGeekemonEquipe].DEF;
        end;
        if ((choixAction = 1) or (choixAction = 2) or (choixAction = 3)) then
        begin
          if geekEquipe[numGeekemonEquipe].PVactuels > 0 then
          begin
          writeln (geekEquipe[numGeekemonEquipe].nom, ' attaque ! Cela inflige ',
          degatsInflig�s, ' d�g�ts.');
          dressEquipe[numDressEquipe].PV := dressEquipe[numDressEquipe].PV - degatsInflig�s;
          end;
          if dressEquipe[numDressEquipe].PV > 0 then
          begin
            writeln (dressEquipe[numDressEquipe].nom, ' attaque ! Cela inflige ',degatsRe�us, ' d�g�ts.');
            geekEquipe[numGeekemonEquipe].PVactuels := geekEquipe[numGeekemonEquipe].PVactuels - degatsRe�us;
          end;
          end
        else
        begin
          if nbPotion = 0 then
          begin
            writeln ('Vous n''avez plus de potions dans votre sac !');
            readln;
            effacerEcran;
          end
          else
          begin
          geekEquipe[numGeekemonEquipe].PVactuels := geekEquipe[numGeekemonEquipe].PVactuels + 5;
          writeln ('F�licitations ! Votre geekemon a restaur� 5 points de vie.');
          readln;
          effacerEcran;
          nbPotion := nbPotion - 1;
          end;
        end;
      end

  until (dressEquipe[numDressEquipe].PV <= 0) or (geekEquipe[numGeekemonEquipe].PVactuels <= 0);
end;
/////////////////////
procedure capture (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var numGeekemonEquipe : integer; var num�roGeekemon : integer ; var nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; equipeStockage : arrayofpc; quitter : integer);

var
  choixCapture : integer;
  choixRemplacement : integer;

begin
  writeln ('Le ', geekedex[num�roGeekemon].nom, ' est affaibli ! Souhaitez vous le capturer ?');
  writeln ('1 - Oui');
  writeln ('2 - Non');
  choixCapture := readVerif(1,2);
  effacerEcran;
  if choixCapture = 1 then
  begin
  //Si le joueur a d�j� 4 geekemons dans son �quipe, il peut choisir lequel il souhaite remplacer.
  case geekEquipe[0].nbGeekemons of
  4 :  begin
  writeln ('F�licitations ! Vous avez captur� un ', geekedex[num�roGeekemon].nom,
  '. Quel geekemon de votre �quipe souhaitez vous remplacer ?');
  writeln ('1 -', geekEquipe[0].nom);
  writeln ('2 -', geekEquipe[1].nom);
  writeln ('3 -', geekEquipe[2].nom);
  writeln ('4 -', geekEquipe[3].nom);
  choixRemplacement := readVerif(1,4);
  effacerEcran;
      case choixRemplacement of
        //La case du tableau geekEquipe correspondant au choix du joueur
        //prend les caract�ristiques du geekemon sauvage pr�sentes dans le geekedex.
        1 : Begin
        writeln ('Byebye ', geekEquipe[0].nom, ' !');
        readln;
        effacerEcran;
        geekEquipe[0].nom := geekedex[num�roGeekemon].nom;
        geekEquipe[0].COMP1 := geekedex[num�roGeekemon].COMP1;
        geekEquipe[0].COMP2 := geekedex[num�roGeekemon].COMP2;
        geekEquipe[0].COMP3 := geekedex[num�roGeekemon].COMP3;
        geekEquipe[0].nomComp1 := geekedex[num�roGeekemon].nomComp1;
        geekEquipe[0].nomComp2 := geekedex[num�roGeekemon].nomComp2;
        geekEquipe[0].nomComp3 := geekedex[num�roGeekemon].nomComp3;
        geekEquipe[0].accesCompetence3 := false;
        geekEquipe[0].DEF := geekedex[num�roGeekemon].DEF;
        geekEquipe[0].PVdeBase := geekedex[num�roGeekemon].PV;
        geekEquipe[0].PVactuels := geekedex[num�roGeekemon].PV;
        geekEquipe[0].EXP :=0;
        geekEquipe[0].NIV :=1;
        End;
        2 : begin
        writeln ('Byebye', geekEquipe[1].nom, '!');
        readln;
        effacerEcran;
        geekEquipe[1].nom := geekedex[num�roGeekemon].nom;
        geekEquipe[1].COMP1 := geekedex[num�roGeekemon].COMP1;
        geekEquipe[1].COMP2 := geekedex[num�roGeekemon].COMP2;
        geekEquipe[1].COMP3 := geekedex[num�roGeekemon].COMP3;
        geekEquipe[1].nomComp1 := geekedex[num�roGeekemon].nomComp1;
        geekEquipe[1].nomComp2 := geekedex[num�roGeekemon].nomComp2;
        geekEquipe[1].nomComp3 := geekedex[num�roGeekemon].nomComp3;
        geekEquipe[1].accesCompetence3 := false;
        geekEquipe[1].DEF := geekedex[num�roGeekemon].DEF;
        geekEquipe[1].PVdeBase := geekedex[num�roGeekemon].PV;
        geekEquipe[1].PVactuels := geekedex[num�roGeekemon].PV;
        geekEquipe[1].EXP :=0;
        geekEquipe[1].NIV :=1;
        end;
        3 : begin
        writeln ('Byebye', geekEquipe[2].nom, '!');
        readln;
        effacerEcran;
        geekEquipe[2].nom := geekedex[num�roGeekemon].nom;
        geekEquipe[2].COMP1 := geekedex[num�roGeekemon].COMP1;
        geekEquipe[2].COMP2 := geekedex[num�roGeekemon].COMP2;
        geekEquipe[2].COMP3 := geekedex[num�roGeekemon].COMP3;
        geekEquipe[2].nomComp1 := geekedex[num�roGeekemon].nomComp1;
        geekEquipe[2].nomComp2 := geekedex[num�roGeekemon].nomComp2;
        geekEquipe[2].nomComp3 := geekedex[num�roGeekemon].nomComp3;
        geekEquipe[2].accesCompetence3 := false;
        geekEquipe[2].DEF := geekedex[num�roGeekemon].DEF;
        geekEquipe[2].PVdeBase := geekedex[num�roGeekemon].PV;
        geekEquipe[2].PVactuels := geekedex[num�roGeekemon].PV;
        geekEquipe[2].EXP :=0;
        geekEquipe[2].NIV :=1;
        end;
        4 : begin
        writeln ('Byebye', geekEquipe[3].nom, '!');
        readln;
        effacerEcran;
        geekEquipe[3].nom := geekedex[num�roGeekemon].nom;
        geekEquipe[3].COMP1 := geekedex[num�roGeekemon].COMP1;
        geekEquipe[3].COMP2 := geekedex[num�roGeekemon].COMP2;
        geekEquipe[3].COMP3 := geekedex[num�roGeekemon].COMP3;
        geekEquipe[3].nomComp1 := geekedex[num�roGeekemon].nomComp1;
        geekEquipe[3].nomComp2 := geekedex[num�roGeekemon].nomComp2;
        geekEquipe[3].nomComp3 := geekedex[num�roGeekemon].nomComp3;
        geekEquipe[3].accesCompetence3 := false;
        geekEquipe[3].DEF := geekedex[num�roGeekemon].DEF;
        geekEquipe[3].PVdeBase := geekedex[num�roGeekemon].PV;
        geekEquipe[3].PVactuels := geekedex[num�roGeekemon].PV;
        geekEquipe[3].EXP :=0;
        geekEquipe[3].NIV :=1;
        end;
    end;
  changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
  end;
  //Si l'�quipe du joueur n'est pas compl�te, les caract�ristiques du nouveau geekemon
  //sont �crites dans la case libre suivante du tableau geekEquipe.
  3 : begin
    writeln ('F�licitations ! Vous avez captur� un ', geekedex[num�roGeekemon].nom,'.');
    readln;
    effacerEcran;
    geekEquipe[3].nom := geekedex[num�roGeekemon].nom;
    geekEquipe[3].COMP1 := geekedex[num�roGeekemon].COMP1;
    geekEquipe[3].COMP2 := geekedex[num�roGeekemon].COMP2;
    geekEquipe[3].COMP3 := geekedex[num�roGeekemon].COMP3;
    geekEquipe[3].nomComp1 := geekedex[num�roGeekemon].nomComp1;
    geekEquipe[3].nomComp2 := geekedex[num�roGeekemon].nomComp2;
    geekEquipe[3].nomComp3 := geekedex[num�roGeekemon].nomComp3;
    geekEquipe[2].accesCompetence3 := false;
    geekEquipe[3].DEF := geekedex[num�roGeekemon].DEF;
    geekEquipe[3].PVdeBase := geekedex[num�roGeekemon].PV;
    geekEquipe[3].PVactuels := geekedex[num�roGeekemon].PV;
    geekEquipe[0].nbGeekemons := 4;
    readln;
    effacerEcran;
    changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
    end;
  2: begin
    writeln ('F�licitations ! Vous avez captur� un ', geekedex[num�roGeekemon].nom,'.');
    readln;
    effacerEcran;
    geekEquipe[2].nom := geekedex[num�roGeekemon].nom;
    geekEquipe[2].COMP1 := geekedex[num�roGeekemon].COMP1;
    geekEquipe[2].COMP2 := geekedex[num�roGeekemon].COMP2;
    geekEquipe[2].COMP3 := geekedex[num�roGeekemon].COMP3;
    geekEquipe[2].nomComp1 := geekedex[num�roGeekemon].nomComp1;
    geekEquipe[2].nomComp2 := geekedex[num�roGeekemon].nomComp2;
    geekEquipe[2].nomComp3 := geekedex[num�roGeekemon].nomComp3;
    geekEquipe[2].accesCompetence3 := false;
    geekEquipe[2].DEF := geekedex[num�roGeekemon].DEF;
    geekEquipe[2].PVdeBase := geekedex[num�roGeekemon].PV;
    geekEquipe[2].PVactuels := geekedex[num�roGeekemon].PV;
    geekEquipe[0].nbGeekemons := 3;
    readln;
    effacerEcran;
    changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
    end;
  1: begin
    writeln ('F�licitations ! Vous avez captur� un ', geekedex[num�roGeekemon].nom,'.');
    readln;
    effacerEcran;
    geekEquipe[1].nom := geekedex[num�roGeekemon].nom;
    geekEquipe[1].COMP1 := geekedex[num�roGeekemon].COMP1;
    geekEquipe[1].COMP2 := geekedex[num�roGeekemon].COMP2;
    geekEquipe[1].COMP3 := geekedex[num�roGeekemon].COMP3;
    geekEquipe[1].nomComp1 := geekedex[num�roGeekemon].nomComp1;
    geekEquipe[1].nomComp2 := geekedex[num�roGeekemon].nomComp2;
    geekEquipe[1].nomComp3 := geekedex[num�roGeekemon].nomComp3;
    geekEquipe[1].accesCompetence3 := false;
    geekEquipe[1].DEF := geekedex[num�roGeekemon].DEF;
    geekEquipe[1].PVdeBase := geekedex[num�roGeekemon].PV;
    geekEquipe[1].PVactuels := geekedex[num�roGeekemon].PV;
    geekEquipe[0].nbGeekemons := 2;
    changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
    end;
  end;
  end;
end;

//////////////////////
procedure combatDresseur (var geekedex : arrayOfGeekemon; var geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var nom1 : string; var avancement : avancementQuete; nomDresseurs : arrayofdresseurs; numDressEquipe : integer; equipeStockage : arrayofpc; quitter : integer);

var
  nbGeekemonEquipeRestants : integer;
  nbGeekemonDeBase : integer;
  nbGeekemonEquipeAdverse : integer; //Nombre de geekemons du joueur adverse
  pvGeekemonAdverse : integer;
  numGeekemonEquipe : integer;

begin
  writeln ('Le dresseur ', nomDresseurs[numDressEquipe], ' souhaite se battre !');
  readln;
  effacerEcran;
  numGeekemonEquipe := 0;
  nbGeekemonDeBase := geekEquipe[0].nbGeekemons;
  nbGeekemonEquipeRestants := geekEquipe[0].nbGeekemons;
  nbGeekemonEquipeAdverse := 4;
  if geekEquipe[2].PVactuels <= 0 then
  begin
  numGeekemonEquipe := 3;
  nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 3;
  writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
  writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
  readln;
  effacerEcran;
  pvGeekemonAdverse := dressEquipe[numDressEquipe].pv;
  combatVsGeekDresseur (geekedex, geekEquipe, nbPotion,DressEquipe, numGeekemonEquipe, numDressEquipe);
  while (nbGeekemonEquipeRestants or nbGeekemonEquipeAdverse) <> 0  do
  begin
    if dressEquipe[numDressEquipe].PV <= 0 then
    begin
      dressEquipe[numDressEquipe].PV := pvGeekemonAdverse;
      //La proc�dure est similaire au combatGeekemonSauvage sauf que le joueur envoie le geekemon suivant de son �quipe.
      nbGeekemonEquipeAdverse := nbGeekemonEquipeAdverse - 1;
      case nbGeekemonEquipeAdverse of
      3 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            //Si le geekemon adverse est K.O., on appelle la proc�dure
            //exp�rience et la proc�dure niveau d'affil�e pour tester
            //le niveau d'exp�rience du geekemon vainqueur.
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      2 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      1 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
      0 : Begin
        writeln (nomDresseurs[numDressEquipe], 'n'' plus de geekemons en forme ! Vous avez gagn� !');
        readln;
        effacerEcran;
        experience (geekEquipe, numGeekemonEquipe);
        niveau(geekEquipe, numGeekemonEquipe);
        changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        End;
      end;
    end
    else
    begin
    writeln ('Vous n''avez plus de geekemons en forme ! Vous avez perdu ! Vous allez �tre renvoy� � l''ETTDG.');
    readln;
    effacerEcran;
    soin (geekedex, geekEquipe, nbPotion, DressEquipe);
    changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
    End;
  end;
  end
  else if geekEquipe[1].PVactuels <= 0 then
  begin
  numGeekemonEquipe := 2;
  nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 2;
  writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
  writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
  readln;
  effacerEcran;
  pvGeekemonAdverse := dressEquipe[numDressEquipe].pv;
  combatVsGeekDresseur (geekedex, geekEquipe, nbPotion,DressEquipe, numGeekemonEquipe, numDressEquipe);
  while (nbGeekemonEquipeRestants or nbGeekemonEquipeAdverse) <> 0  do
  begin
    if dressEquipe[numDressEquipe].PV <= 0 then
    begin
      dressEquipe[numDressEquipe].PV := pvGeekemonAdverse;
      nbGeekemonEquipeAdverse := nbGeekemonEquipeAdverse - 1;
      case nbGeekemonEquipeAdverse of
      3 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      2 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      1 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
      0 : Begin
        writeln (nomDresseurs[numDressEquipe], 'n'' plus de geekemons en forme ! Vous avez gagn� !');
        readln;
        effacerEcran;
        experience (geekEquipe, numGeekemonEquipe);
        niveau(geekEquipe, numGeekemonEquipe);
        changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        End;
    end;
    end;
    if geekEquipe[numGeekemonEquipe].PVactuels <= 0 then
    begin
      nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 1;
      case nbGeekemonEquipeRestants of
      1 : Begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 3;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      0 : Begin
        writeln ('Vous n''avez plus de geekemons en forme ! Vous avez perdu ! Vous allez �tre renvoy� � l''ETTDG.');
        readln;
        effacerEcran;
        soin (geekedex, geekEquipe, nbPotion, DressEquipe);
        changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        End;
    end;
    end;
  end;
  end
  else if geekEquipe[0].pvactuels <= 0 then
  begin
  numGeekemonEquipe := 1;
  nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 1;
  writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
  writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
  readln;
  effacerEcran;
  pvGeekemonAdverse := dressEquipe[numDressEquipe].pv;
  combatVsGeekDresseur (geekedex, geekEquipe, nbPotion,DressEquipe, numGeekemonEquipe, numDressEquipe);
  while (nbGeekemonEquipeRestants or nbGeekemonEquipeAdverse) <> 0  do
  begin
    if dressEquipe[numDressEquipe].PV <= 0 then
    begin
      dressEquipe[numDressEquipe].PV := pvGeekemonAdverse;
      nbGeekemonEquipeAdverse := nbGeekemonEquipeAdverse - 1;
      case nbGeekemonEquipeAdverse of
      3 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      2 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      1 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
      0 : Begin
        writeln (nomDresseurs[numDressEquipe], 'n'' plus de geekemons en forme ! Vous avez gagn� !');
        readln;
        effacerEcran;
        experience (geekEquipe, numGeekemonEquipe);
        niveau(geekEquipe, numGeekemonEquipe);
        changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        End;
    end;
    end;
    if geekEquipe[numGeekemonEquipe].PVactuels <= 0 then
    begin
      nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 1;
      case nbGeekemonEquipeRestants of
      2 : Begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 2;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      1 : Begin
            case nbGeekemondeBase of
            4 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 3;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
            3 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 2;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            end;
            end;
          End;
      0 : Begin
        writeln ('Vous n''avez plus de geekemons en forme ! Vous avez perdu ! Vous allez �tre renvoy� � l''ETTDG.');
        readln;
        effacerEcran;
        soin (geekedex, geekEquipe, nbPotion, DressEquipe);
        changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        End;
      end;
    end;
    end;
  end
  else
  begin
  writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
  writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
  readln;
  effacerEcran;
  pvGeekemonAdverse := dressEquipe[numDressEquipe].pv;
  combatVsGeekDresseur (geekedex, geekEquipe, nbPotion,DressEquipe, numGeekemonEquipe, numDressEquipe);
  while (nbGeekemonEquipeRestants or nbGeekemonEquipeAdverse) <> 0  do
  begin
    if dressEquipe[numDressEquipe].PV <= 0 then
    begin
      dressEquipe[numDressEquipe].PV := pvGeekemonAdverse;
      nbGeekemonEquipeAdverse := nbGeekemonEquipeAdverse - 1;
      case nbGeekemonEquipeAdverse of
      3 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      2 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      1 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
      0 : Begin
        writeln (nomDresseurs[numDressEquipe], 'n'' plus de geekemons en forme ! Vous avez gagn� !');
        readln;
        effacerEcran;
        experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
        changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        End;
    end;
    end;
    if geekEquipe[numGeekemonEquipe].PVactuels <= 0 then
    begin
      nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 1;
      case nbGeekemonEquipeRestants of
        3 : Begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 1;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      2 : Begin
            case nbGeekemondeBase of
            4 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 2;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
            3 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 1;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            end;
            end;
            End;

      1 : Begin
            case nbGeekemondeBase of
            4 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 3;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
            3 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 2;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            end;
            2 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 1;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            end;
            end;
            End;
      0 : Begin
        writeln ('Vous n''avez plus de geekemons en forme ! Vous avez perdu ! Vous allez �tre renvoy� � l''ETTDG.');
        readln;
        effacerEcran;
        soin (geekedex, geekEquipe, nbPotion, DressEquipe);
        changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        End;
    end;
    end;
  end;
  end;

end;



///////////////////////////////
procedure choixBoss (var geekedex : arrayOfGeekemon;var  geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; num�roBoss : integer; equipeStockage : arrayofpc; quitter : integer);

var
  numDressEquipe : integer;

begin
  case num�roBoss of
  //selon la valeur de num�roBoss (variable pr�sente dans la proc�dure qu�te), on appelle le combatDresseur avec une valeur
  //de numDressEquipe diff�rente, ce qui provoquera un combat contre un boss
  //pr�cis avec une �quipe pr�cise
  1 : begin
        numDressEquipe := 12;
        combatBoss (geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, numDressEquipe, equipeStockage, quitter);
      end;
  2 : begin
        numDressEquipe := 16;
        combatBoss (geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, numDressEquipe, equipeStockage, quitter);
      end;
  3 : begin
        numDressEquipe := 20;
        combatBoss (geekedex, geekEquipe, nbPotion, DressEquipe, nom1, avancement, nomDresseurs, numDressEquipe, equipeStockage, quitter);
      end;
  end;

end;
/////////////////////////////
procedure combatBoss(var geekedex : arrayOfGeekemon;var  geekEquipe : arrayOfEquipe; var nbPotion : integer; var DressEquipe : arrayOfEquipeDresseur; var nom1 : string; var avancement : avancementQuete; nomdresseurs : arrayofdresseurs; var numDressEquipe : integer; equipeStockage: arrayofpc; quitter : integer);

var
  numGeekemonEquipe : integer;
  nbGeekemonEquipeRestants : integer;
  nbGeekemonEquipeAdverse : integer;
  pvGeekemonAdverse : integer;
  nbGeekemonDeBase : integer;
  finCombat : boolean;

begin
  writeln (nomDresseurs[numDressEquipe], ' souhaite se battre !');
  numGeekemonEquipe := 0;
  nbGeekemonDeBase := geekEquipe[0].nbGeekemons;
  nbGeekemonEquipeRestants := geekEquipe[0].nbGeekemons;
  nbGeekemonEquipeAdverse := 4;
  if geekEquipe[2].PVactuels <= 0 then
  begin
  numGeekemonEquipe := 3;
  nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 3;
  writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
  writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
  pvGeekemonAdverse := dressEquipe[numDressEquipe].pv;
  combatVsGeekDresseur (geekedex, geekEquipe, nbPotion,DressEquipe, numGeekemonEquipe, numDressEquipe);
  while ((nbGeekemonEquipeRestants <> 0) or (nbGeekemonEquipeAdverse <> 0)) and finCombat = false  do
  begin
    if dressEquipe[numDressEquipe].PV <= 0 then
    begin
      dressEquipe[numDressEquipe].PV := pvGeekemonAdverse;
      nbGeekemonEquipeAdverse := nbGeekemonEquipeAdverse - 1;
      case nbGeekemonEquipeAdverse of
      3 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      2 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      1 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
      0 : Begin
        writeln (nomDresseurs[numDressEquipe], 'n'' plus de geekemons en forme ! Vous avez gagn� !');
        readln;
        effacerEcran;
        experience (geekEquipe, numGeekemonEquipe);
        niveau(geekEquipe, numGeekemonEquipe);
        finCombat := true;
        End;
      end;
    end
    else
    begin
    writeln ('Vous n''avez plus de geekemons en forme ! Vous avez perdu ! Vous allez �tre renvoy� � l''ETTDG.');
    readln;
    effacerEcran;
    soin (geekedex, geekEquipe, nbPotion, DressEquipe);
    changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
    End;
  end;
  end
  else if geekEquipe[1].PVactuels <= 0 then
  begin
  numGeekemonEquipe := 2;
  nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 2;
  writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
  writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
  readln;
  effacerEcran;
  pvGeekemonAdverse := dressEquipe[numDressEquipe].pv;
  combatVsGeekDresseur (geekedex, geekEquipe, nbPotion,DressEquipe, numGeekemonEquipe, numDressEquipe);
  while ((nbGeekemonEquipeRestants <> 0) or (nbGeekemonEquipeAdverse <> 0)) and finCombat = false  do
  begin
    if dressEquipe[numDressEquipe].PV <= 0 then
    begin
      dressEquipe[numDressEquipe].PV := pvGeekemonAdverse;
      nbGeekemonEquipeAdverse := nbGeekemonEquipeAdverse - 1;
      case nbGeekemonEquipeAdverse of
      3 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      2 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      1 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
      0 : Begin
        writeln (nomDresseurs[numDressEquipe], ' n''a plus de geekemons en forme ! Vous avez gagn� !');
        readln;
        effacerEcran;
        finCombat := true;
        End;
    end;
    end;
    if geekEquipe[numGeekemonEquipe].PVactuels <= 0 then
    begin
      nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 1;
      case nbGeekemonEquipeRestants of
      1 : Begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 3;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      0 : Begin
        writeln ('Vous n''avez plus de geekemons en forme ! Vous avez perdu ! Vous allez �tre renvoy� � l''ETTDG.');
        readln;
        effacerEcran;
        soin (geekedex, geekEquipe, nbPotion, DressEquipe);
        changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        End;
    end;
    end;
  end;
  end
  else if geekEquipe[0].pvactuels <= 0 then
  begin
  numGeekemonEquipe := 1;
  nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 1;
  writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
  writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
  readln;
  effacerEcran;
  pvGeekemonAdverse := dressEquipe[numDressEquipe].pv;
  combatVsGeekDresseur (geekedex, geekEquipe, nbPotion,DressEquipe, numGeekemonEquipe, numDressEquipe);
  while ((nbGeekemonEquipeRestants <> 0) or (nbGeekemonEquipeAdverse <> 0)) and finCombat = false  do
  begin
    if dressEquipe[numDressEquipe].PV <= 0 then
    begin
      dressEquipe[numDressEquipe].PV := pvGeekemonAdverse;
      nbGeekemonEquipeAdverse := nbGeekemonEquipeAdverse - 1;
      case nbGeekemonEquipeAdverse of
      3 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      2 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      1 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
      0 : Begin
        writeln (nomDresseurs[numDressEquipe], ' n''a plus de geekemons en forme ! Vous avez gagn� !');
        readln;
        effacerEcran;
        finCombat := true;
        End;
    end;
    end;
    if geekEquipe[numGeekemonEquipe].PVactuels <= 0 then
    begin
      nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 1;
      case nbGeekemonEquipeRestants of
      2 : Begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 2;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      1 : Begin
            case nbGeekemondeBase of
            4 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 3;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
            3 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 2;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            end;
            end;
          End;
      0 : Begin
        writeln ('Vous n''avez plus de geekemons en forme ! Vous avez perdu ! Vous allez �tre renvoy� � l''ETTDG.');
        readln;
        effacerEcran;
        soin (geekedex, geekEquipe, nbPotion, DressEquipe);
        changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage, quitter);
        End;
      end;
    end;
    end;
  end
  else
  begin
  writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
  writeln (geekEquipe[numGeekemonEquipe].nom, ', go !');
  readln;
  effacerEcran;
  pvGeekemonAdverse := dressEquipe[numDressEquipe].pv;
  combatVsGeekDresseur (geekedex, geekEquipe, nbPotion,DressEquipe, numGeekemonEquipe, numDressEquipe);
  while ((nbGeekemonEquipeRestants <> 0) or (nbGeekemonEquipeAdverse <> 0)) and finCombat = false  do
  begin
    if dressEquipe[numDressEquipe].PV <= 0 then
    begin
      dressEquipe[numDressEquipe].PV := pvGeekemonAdverse;
      nbGeekemonEquipeAdverse := nbGeekemonEquipeAdverse - 1;
      case nbGeekemonEquipeAdverse of
      3 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      2 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      1 : Begin
            writeln ('Le geekemon adverse est K.O. !');
            experience (geekEquipe, numGeekemonEquipe);
            niveau(geekEquipe, numGeekemonEquipe);
            numDressEquipe := numDressEquipe + 1;
            pvGeekemonAdverse := dressEquipe[numDressEquipe].PV;
            writeln (nomDresseurs[numDressEquipe], ' envoie un ', dressEquipe[numDressEquipe].nom, ' ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
      0 : Begin
        writeln (nomDresseurs[numDressEquipe], 'n'' plus de geekemons en forme ! Vous avez gagn� !');
        readln;
        effacerEcran;
        finCombat := true;
        End;
    end;
    end;
    if geekEquipe[numGeekemonEquipe].PVactuels <= 0 then
    begin
      nbGeekemonEquipeRestants := nbGeekemonEquipeRestants - 1;
      case nbGeekemonEquipeRestants of
        3 : Begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 1;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;

      2 : Begin
            case nbGeekemondeBase of
            4 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 2;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
            3 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 1;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            end;
            end;
            End;

      1 : Begin
            case nbGeekemondeBase of
            4 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 3;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            End;
            3 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 2;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            end;
            2 : begin
            writeln ('Votre geekemon est K.O. !');
            numGeekemonEquipe := 1;
            writeln (geekEquipe[numGeekemonEquipe].nom, ' � toi de jouer ! ');
            combatvsgeekdresseur(geekedex, geekEquipe, nbPotion, DressEquipe, numGeekemonEquipe, numDressEquipe);
            end;
            end;
            End;
      0 : Begin
        writeln ('Vous n''avez plus de geekemons en forme ! Vous avez perdu ! Vous allez �tre renvoy� � l''ETTDG.');
        readln;
        effacerEcran;
        soin (geekedex, geekEquipe, nbPotion, DressEquipe);
        changementDeSalle (geekedex, geekEquipe, nbPotion,DressEquipe, nom1, avancement, nomDresseurs, equipeStockage,quitter);
        End;
    end;
    end;
  end;
  end;
end;

////////////////////////////////////
procedure experience (var geekEquipe : arrayOfEquipe; numGeekemonEquipe : integer);
begin
  geekEquipe[numGeekemonEquipe].EXP := geekEquipe[numGeekemonEquipe].EXP + 20;
  writeln('Votre geekemon a d�sormais ',geekEquipe[numGeekemonEquipe].EXP, ' points d''exp�rience.');
  //Le geekemon ne gagne que 20 points d'exp�rience � chaque combat.
  readln;
  effacerEcran;
end;

///////////////////////////////
procedure niveau (var geekEquipe : arrayOfEquipe; numGeekemonEquipe : integer);
begin
  if ((geekEquipe[numGeekemonEquipe].EXP) >= (100)) then
  begin
    geekEquipe[numGeekemonEquipe].NIV := geekEquipe[numGeekemonEquipe].NIV +1;
    geekEquipe[numGeekemonEquipe].EXP := geekEquipe[numGeekemonEquipe].EXP -100;
    //On baisse l'xp � 100 pour que le geekemon reparte de 0 au niveau suivant.
    geekEquipe[numGeekemonEquipe].COMP1 := geekEquipe[numGeekemonEquipe].COMP1 +2;
    geekEquipe[numGeekemonEquipe].COMP2 := geekEquipe[numGeekemonEquipe].COMP2 +2;
    geekEquipe[numGeekemonEquipe].COMP3 := geekEquipe[numGeekemonEquipe].COMP3 +2;
    geekEquipe[numGeekemonEquipe].DEF := geekEquipe[numGeekemonEquipe].DEF +2;
    geekEquipe[numGeekemonEquipe].PVdeBase := geekEquipe[numGeekemonEquipe].PVdeBase +3;
    geekEquipe[numGeekemonEquipe].PVactuels := geekEquipe[numGeekemonEquipe].PVdeBase;
    writeln (geekEquipe[numGeekemonEquipe].nom,' est pass� au niveau ', geekEquipe[numGeekemonEquipe].NIV, ' !');
    readln;
    effacerEcran;
  end;
end;

/////////////////////////////////////
procedure evolution (var geekEquipe : arrayOfEquipe; numGeekemonEquipe : integer);

begin
  if ((geekEquipe[numGeekemonEquipe].NIV) = (10)) then
  begin
    writeln (geekEquipe[numGeekemonEquipe].nom,' a �volu�, il peut d�sormais utilis� sa troisi�me comp�tence ',geekEquipe[numGeekemonEquipe].nomComp3, ' !');
    readln;
    effacerEcran;
    geekEquipe[numGeekemonEquipe].accesCompetence3 := True;
    //On active le d�bloquage de la troisi�me comp�tence dans le tableau geekEquipe
  end;
end;
end.
