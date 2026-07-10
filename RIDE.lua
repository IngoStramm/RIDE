local ADDON_NAME = ...

local RIDE = CreateFrame("Frame", "RIDEFrame")
_G.RIDE = RIDE

BINDING_HEADER_RIDE = "RIDE"

local LOCALE = GetLocale and GetLocale() or "enUS"

local LOCALES = {
    enUS = {
        BINDING_SMART_TRAVEL = "Smart Travel",
        LOADED = "loaded. Use /ride to open options.",
        HELP_HEADER = "RIDE commands:",
        HELP_OPEN = "/ride - open options",
        HELP_STATUS = "/ride status - show current setup",
        HELP_GROUND = "/ride ground <item link or name> - set ground mount",
        HELP_FLYING = "/ride flying <item link or name> - set flying mount",
        HELP_CURSOR = "/ride ground or /ride flying while holding a mount item - set from cursor",
        HELP_CLEAR = "/ride clear ground|flying - clear a mount",
        HELP_DRUID = "/ride druid - toggle Druid travel forms",
        HELP_CLASS_MOUNT = "/ride classmount - toggle Paladin/Warlock class mounts",
        HELP_BIND = "/ride bind <key> - bind Smart Travel, e.g. /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - clear the Smart Travel keybind",
        HELP_UPDATE = "/ride update - rebuild the secure action",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "Ground mount",
        FLYING_MOUNT = "Flying mount",
        MOUNT_HINT = "Drag a mount item from your bag onto a slot, or pick it up and click the slot.",
        SLOT_EMPTY = "+",
        CLEAR = "Clear",
        DRUID_FORMS = "Use Druid travel forms",
        DRUID_AQUATIC = "Use Aquatic Form while swimming",
        DRUID_FLIGHT = "Use Flight Form in flyable areas",
        DRUID_TRAVEL = "Use Travel Form in combat",
        CLASS_MOUNT = "Use class mount",
        PREVENT_FLYING_DISMOUNT = "Prevent dismount while flying",
        SET_BINDING = "Set key",
        CLEAR_BINDING = "Clear key",
        STATUS = "Status",
        KEYBIND = "Keybind",
        KEYBIND_CAPTURE = "Press a key for RIDE Smart Travel. Press Esc to cancel.",
        CURRENT_ACTION = "Current action",
        FLYABLE_AREA = "Flyable area",
        YES = "yes",
        NO = "no",
        NOT_SET = "not set",
        MISSING = "missing from bags",
        PRESENT = "in bags",
        UNUSABLE = "not usable",
        SLOT_HINT = "Right-click a slot to clear it.",
        WRONG_GROUND_SLOT = "That looks like a flying mount. Put it in the flying slot.",
        WRONG_FLYING_SLOT = "That does not look like a flying mount.",
        SET_GROUND = "Ground mount set to %s.",
        SET_FLYING = "Flying mount set to %s.",
        CLEARED_GROUND = "Ground mount cleared.",
        CLEARED_FLYING = "Flying mount cleared.",
        NO_CURSOR_ITEM = "Hold a mount item on the cursor first.",
        DRUID_ON = "Druid travel forms enabled.",
        DRUID_OFF = "Druid travel forms disabled.",
        CLASS_MOUNT_ON = "Class mount enabled.",
        CLASS_MOUNT_OFF = "Class mount disabled.",
        BINDING_SET = "Smart Travel bound to %s.",
        BINDING_CLEARED = "Smart Travel keybind cleared.",
        BINDING_CANCELLED = "Keybind capture cancelled.",
        BINDING_FAILED = "Could not set keybind.",
        BINDING_COMBAT = "Cannot change keybinds in combat.",
        UPDATED = "Secure travel action updated.",
        UPDATE_DEFERRED = "In combat; secure action will update after combat.",
        NO_ACTION = "No travel action is configured for this situation.",
    },
    ptBR = {
        BINDING_SMART_TRAVEL = "Viagem inteligente",
        LOADED = "carregado. Use /ride para abrir as opcoes.",
        HELP_HEADER = "Comandos do RIDE:",
        HELP_OPEN = "/ride - abrir opcoes",
        HELP_STATUS = "/ride status - mostrar configuracao atual",
        HELP_GROUND = "/ride ground <link ou nome do item> - definir montaria terrestre",
        HELP_FLYING = "/ride flying <link ou nome do item> - definir montaria voadora",
        HELP_CURSOR = "/ride ground ou /ride flying segurando um item no cursor - definir pelo cursor",
        HELP_CLEAR = "/ride clear ground|flying - limpar uma montaria",
        HELP_DRUID = "/ride druid - alternar formas de viagem do druida",
        HELP_CLASS_MOUNT = "/ride classmount - alternar montaria de classe de Paladino/Bruxo",
        HELP_BIND = "/ride bind <tecla> - definir a tecla, ex: /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - limpar a tecla do Smart Travel",
        HELP_UPDATE = "/ride update - reconstruir a acao segura",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "Montaria terrestre",
        FLYING_MOUNT = "Montaria voadora",
        MOUNT_HINT = "Arraste o item da montaria da bag para um slot, ou pegue o item e clique no slot.",
        SLOT_EMPTY = "+",
        CLEAR = "Limpar",
        DRUID_FORMS = "Usar formas de viagem do druida",
        DRUID_AQUATIC = "Usar Forma Aquatica ao nadar",
        DRUID_FLIGHT = "Usar Forma de Voo em areas voaveis",
        DRUID_TRAVEL = "Usar Forma de Viagem em combate",
        CLASS_MOUNT = "Usar montaria de classe",
        PREVENT_FLYING_DISMOUNT = "Prevenir desmontar enquanto voa",
        SET_BINDING = "Definir tecla",
        CLEAR_BINDING = "Limpar tecla",
        STATUS = "Status",
        KEYBIND = "Tecla",
        KEYBIND_CAPTURE = "Pressione uma tecla para o Smart Travel do RIDE. Pressione Esc para cancelar.",
        CURRENT_ACTION = "Acao atual",
        FLYABLE_AREA = "Area voavel",
        YES = "sim",
        NO = "nao",
        NOT_SET = "nao definido",
        MISSING = "fora das bags",
        PRESENT = "nas bags",
        UNUSABLE = "nao usavel",
        SLOT_HINT = "Clique direito em um slot para limpar.",
        WRONG_GROUND_SLOT = "Isso parece uma montaria voadora. Coloque no slot voador.",
        WRONG_FLYING_SLOT = "Isso nao parece uma montaria voadora.",
        SET_GROUND = "Montaria terrestre definida: %s.",
        SET_FLYING = "Montaria voadora definida: %s.",
        CLEARED_GROUND = "Montaria terrestre limpa.",
        CLEARED_FLYING = "Montaria voadora limpa.",
        NO_CURSOR_ITEM = "Segure um item de montaria no cursor primeiro.",
        DRUID_ON = "Formas de viagem do druida ativadas.",
        DRUID_OFF = "Formas de viagem do druida desativadas.",
        CLASS_MOUNT_ON = "Montaria de classe ativada.",
        CLASS_MOUNT_OFF = "Montaria de classe desativada.",
        BINDING_SET = "Smart Travel definido em %s.",
        BINDING_CLEARED = "Tecla do Smart Travel limpa.",
        BINDING_CANCELLED = "Captura de tecla cancelada.",
        BINDING_FAILED = "Nao foi possivel definir a tecla.",
        BINDING_COMBAT = "Nao e possivel alterar keybinds em combate.",
        UPDATED = "Acao segura de viagem atualizada.",
        UPDATE_DEFERRED = "Em combate; a acao segura sera atualizada depois do combate.",
        NO_ACTION = "Nenhuma acao de viagem configurada para esta situacao.",
    },
    deDE = {
        BINDING_SMART_TRAVEL = "Intelligentes Reisen",
        LOADED = "geladen. Benutze /ride, um die Optionen zu öffnen.",
        HELP_HEADER = "RIDE-Befehle:",
        HELP_OPEN = "/ride - Optionen öffnen",
        HELP_STATUS = "/ride status - aktuelle Konfiguration anzeigen",
        HELP_GROUND = "/ride ground <Gegenstandslink oder Name> - Bodenreittier festlegen",
        HELP_FLYING = "/ride flying <Gegenstandslink oder Name> - Flugreittier festlegen",
        HELP_CURSOR = "/ride ground oder /ride flying mit einem Reittiergegenstand am Mauszeiger - vom Mauszeiger festlegen",
        HELP_CLEAR = "/ride clear ground|flying - Reittier löschen",
        HELP_DRUID = "/ride druid - Reisegestalten des Druiden umschalten",
        HELP_CLASS_MOUNT = "/ride classmount - Klassenreittiere von Paladin/Hexenmeister umschalten",
        HELP_BIND = "/ride bind <Taste> - Smart Travel binden, z. B. /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - Smart-Travel-Taste löschen",
        HELP_UPDATE = "/ride update - sichere Aktion neu aufbauen",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "Bodenreittier",
        FLYING_MOUNT = "Flugreittier",
        MOUNT_HINT = "Ziehe einen Reittiergegenstand aus deiner Tasche auf einen Platz oder nimm ihn auf und klicke den Platz an.",
        SLOT_EMPTY = "+",
        CLEAR = "Löschen",
        DRUID_FORMS = "Druiden-Reisegestalten verwenden",
        DRUID_AQUATIC = "Wassergestalt beim Schwimmen verwenden",
        DRUID_FLIGHT = "Fluggestalt in flugfähigen Gebieten verwenden",
        DRUID_TRAVEL = "Reisegestalt im Kampf verwenden",
        CLASS_MOUNT = "Klassenreittier verwenden",
        PREVENT_FLYING_DISMOUNT = "Absteigen im Flug verhindern",
        SET_BINDING = "Taste setzen",
        CLEAR_BINDING = "Taste löschen",
        STATUS = "Status",
        KEYBIND = "Tastenbelegung",
        KEYBIND_CAPTURE = "Drücke eine Taste für RIDE Smart Travel. Drücke Esc zum Abbrechen.",
        CURRENT_ACTION = "Aktuelle Aktion",
        FLYABLE_AREA = "Flugfähiges Gebiet",
        YES = "ja",
        NO = "nein",
        NOT_SET = "nicht gesetzt",
        MISSING = "nicht in den Taschen",
        PRESENT = "in den Taschen",
        UNUSABLE = "nicht benutzbar",
        SLOT_HINT = "Rechtsklicke einen Platz, um ihn zu löschen.",
        WRONG_GROUND_SLOT = "Das sieht wie ein Flugreittier aus. Lege es in den Flugplatz.",
        WRONG_FLYING_SLOT = "Das sieht nicht wie ein Flugreittier aus.",
        SET_GROUND = "Bodenreittier auf %s gesetzt.",
        SET_FLYING = "Flugreittier auf %s gesetzt.",
        CLEARED_GROUND = "Bodenreittier gelöscht.",
        CLEARED_FLYING = "Flugreittier gelöscht.",
        NO_CURSOR_ITEM = "Halte zuerst einen Reittiergegenstand am Mauszeiger.",
        DRUID_ON = "Druiden-Reisegestalten aktiviert.",
        DRUID_OFF = "Druiden-Reisegestalten deaktiviert.",
        CLASS_MOUNT_ON = "Klassenreittier aktiviert.",
        CLASS_MOUNT_OFF = "Klassenreittier deaktiviert.",
        BINDING_SET = "Smart Travel auf %s gebunden.",
        BINDING_CLEARED = "Smart-Travel-Taste gelöscht.",
        BINDING_CANCELLED = "Tastenerfassung abgebrochen.",
        BINDING_FAILED = "Taste konnte nicht gesetzt werden.",
        BINDING_COMBAT = "Tastenbelegungen können im Kampf nicht geändert werden.",
        UPDATED = "Sichere Reiseaktion aktualisiert.",
        UPDATE_DEFERRED = "Im Kampf; die sichere Aktion wird nach dem Kampf aktualisiert.",
        NO_ACTION = "Für diese Situation ist keine Reiseaktion konfiguriert.",
    },
    esES = {
        BINDING_SMART_TRAVEL = "Viaje inteligente",
        LOADED = "cargado. Usa /ride para abrir las opciones.",
        HELP_HEADER = "Comandos de RIDE:",
        HELP_OPEN = "/ride - abrir opciones",
        HELP_STATUS = "/ride status - mostrar configuración actual",
        HELP_GROUND = "/ride ground <enlace o nombre de objeto> - definir montura terrestre",
        HELP_FLYING = "/ride flying <enlace o nombre de objeto> - definir montura voladora",
        HELP_CURSOR = "/ride ground o /ride flying sosteniendo un objeto de montura - definir desde el cursor",
        HELP_CLEAR = "/ride clear ground|flying - borrar una montura",
        HELP_DRUID = "/ride druid - alternar formas de viaje del druida",
        HELP_CLASS_MOUNT = "/ride classmount - alternar monturas de clase de paladín/brujo",
        HELP_BIND = "/ride bind <tecla> - asignar Smart Travel, p. ej. /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - borrar la tecla de Smart Travel",
        HELP_UPDATE = "/ride update - reconstruir la acción segura",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "Montura terrestre",
        FLYING_MOUNT = "Montura voladora",
        MOUNT_HINT = "Arrastra un objeto de montura desde la bolsa a una casilla, o recógelo y haz clic en la casilla.",
        SLOT_EMPTY = "+",
        CLEAR = "Borrar",
        DRUID_FORMS = "Usar formas de viaje del druida",
        DRUID_AQUATIC = "Usar Forma acuática al nadar",
        DRUID_FLIGHT = "Usar Forma de vuelo en zonas volables",
        DRUID_TRAVEL = "Usar Forma de viaje en combate",
        CLASS_MOUNT = "Usar montura de clase",
        PREVENT_FLYING_DISMOUNT = "Evitar desmontar mientras vuelas",
        SET_BINDING = "Asignar tecla",
        CLEAR_BINDING = "Borrar tecla",
        STATUS = "Estado",
        KEYBIND = "Tecla",
        KEYBIND_CAPTURE = "Pulsa una tecla para RIDE Smart Travel. Pulsa Esc para cancelar.",
        CURRENT_ACTION = "Acción actual",
        FLYABLE_AREA = "Zona volable",
        YES = "sí",
        NO = "no",
        NOT_SET = "sin definir",
        MISSING = "no está en las bolsas",
        PRESENT = "en las bolsas",
        UNUSABLE = "no utilizable",
        SLOT_HINT = "Clic derecho en una casilla para borrarla.",
        WRONG_GROUND_SLOT = "Eso parece una montura voladora. Ponla en la casilla voladora.",
        WRONG_FLYING_SLOT = "Eso no parece una montura voladora.",
        SET_GROUND = "Montura terrestre definida como %s.",
        SET_FLYING = "Montura voladora definida como %s.",
        CLEARED_GROUND = "Montura terrestre borrada.",
        CLEARED_FLYING = "Montura voladora borrada.",
        NO_CURSOR_ITEM = "Primero sostén un objeto de montura en el cursor.",
        DRUID_ON = "Formas de viaje del druida activadas.",
        DRUID_OFF = "Formas de viaje del druida desactivadas.",
        CLASS_MOUNT_ON = "Montura de clase activada.",
        CLASS_MOUNT_OFF = "Montura de clase desactivada.",
        BINDING_SET = "Smart Travel asignado a %s.",
        BINDING_CLEARED = "Tecla de Smart Travel borrada.",
        BINDING_CANCELLED = "Captura de tecla cancelada.",
        BINDING_FAILED = "No se pudo asignar la tecla.",
        BINDING_COMBAT = "No puedes cambiar teclas en combate.",
        UPDATED = "Acción segura de viaje actualizada.",
        UPDATE_DEFERRED = "En combate; la acción segura se actualizará al salir del combate.",
        NO_ACTION = "No hay ninguna acción de viaje configurada para esta situación.",
    },
    esMX = {
        BINDING_SMART_TRAVEL = "Viaje inteligente",
        LOADED = "cargado. Usa /ride para abrir las opciones.",
        HELP_HEADER = "Comandos de RIDE:",
        HELP_OPEN = "/ride - abrir opciones",
        HELP_STATUS = "/ride status - mostrar configuración actual",
        HELP_GROUND = "/ride ground <enlace o nombre de objeto> - configurar montura terrestre",
        HELP_FLYING = "/ride flying <enlace o nombre de objeto> - configurar montura voladora",
        HELP_CURSOR = "/ride ground o /ride flying sosteniendo un objeto de montura - configurar desde el cursor",
        HELP_CLEAR = "/ride clear ground|flying - borrar una montura",
        HELP_DRUID = "/ride druid - alternar formas de viaje del druida",
        HELP_CLASS_MOUNT = "/ride classmount - alternar monturas de clase de paladín/brujo",
        HELP_BIND = "/ride bind <tecla> - asignar Smart Travel, ej. /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - borrar la tecla de Smart Travel",
        HELP_UPDATE = "/ride update - reconstruir la acción segura",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "Montura terrestre",
        FLYING_MOUNT = "Montura voladora",
        MOUNT_HINT = "Arrastra un objeto de montura desde tu bolsa a una ranura, o tómalo y haz clic en la ranura.",
        SLOT_EMPTY = "+",
        CLEAR = "Borrar",
        DRUID_FORMS = "Usar formas de viaje del druida",
        DRUID_AQUATIC = "Usar Forma acuática al nadar",
        DRUID_FLIGHT = "Usar Forma de vuelo en zonas donde se puede volar",
        DRUID_TRAVEL = "Usar Forma de viaje en combate",
        CLASS_MOUNT = "Usar montura de clase",
        PREVENT_FLYING_DISMOUNT = "Evitar desmontar mientras vuelas",
        SET_BINDING = "Asignar tecla",
        CLEAR_BINDING = "Borrar tecla",
        STATUS = "Estado",
        KEYBIND = "Tecla",
        KEYBIND_CAPTURE = "Presiona una tecla para RIDE Smart Travel. Presiona Esc para cancelar.",
        CURRENT_ACTION = "Acción actual",
        FLYABLE_AREA = "Zona volable",
        YES = "sí",
        NO = "no",
        NOT_SET = "sin configurar",
        MISSING = "no está en las bolsas",
        PRESENT = "en las bolsas",
        UNUSABLE = "no se puede usar",
        SLOT_HINT = "Clic derecho en una ranura para borrarla.",
        WRONG_GROUND_SLOT = "Eso parece una montura voladora. Ponla en la ranura voladora.",
        WRONG_FLYING_SLOT = "Eso no parece una montura voladora.",
        SET_GROUND = "Montura terrestre configurada como %s.",
        SET_FLYING = "Montura voladora configurada como %s.",
        CLEARED_GROUND = "Montura terrestre borrada.",
        CLEARED_FLYING = "Montura voladora borrada.",
        NO_CURSOR_ITEM = "Primero sostén un objeto de montura en el cursor.",
        DRUID_ON = "Formas de viaje del druida activadas.",
        DRUID_OFF = "Formas de viaje del druida desactivadas.",
        CLASS_MOUNT_ON = "Montura de clase activada.",
        CLASS_MOUNT_OFF = "Montura de clase desactivada.",
        BINDING_SET = "Smart Travel asignado a %s.",
        BINDING_CLEARED = "Tecla de Smart Travel borrada.",
        BINDING_CANCELLED = "Captura de tecla cancelada.",
        BINDING_FAILED = "No se pudo asignar la tecla.",
        BINDING_COMBAT = "No puedes cambiar teclas en combate.",
        UPDATED = "Acción segura de viaje actualizada.",
        UPDATE_DEFERRED = "En combate; la acción segura se actualizará al salir del combate.",
        NO_ACTION = "No hay ninguna acción de viaje configurada para esta situación.",
    },
    frFR = {
        BINDING_SMART_TRAVEL = "Voyage intelligent",
        LOADED = "chargé. Utilisez /ride pour ouvrir les options.",
        HELP_HEADER = "Commandes RIDE :",
        HELP_OPEN = "/ride - ouvrir les options",
        HELP_STATUS = "/ride status - afficher la configuration actuelle",
        HELP_GROUND = "/ride ground <lien ou nom d'objet> - définir la monture terrestre",
        HELP_FLYING = "/ride flying <lien ou nom d'objet> - définir la monture volante",
        HELP_CURSOR = "/ride ground ou /ride flying avec un objet de monture sur le curseur - définir depuis le curseur",
        HELP_CLEAR = "/ride clear ground|flying - effacer une monture",
        HELP_DRUID = "/ride druid - activer/désactiver les formes de voyage du druide",
        HELP_CLASS_MOUNT = "/ride classmount - activer/désactiver les montures de classe paladin/démoniste",
        HELP_BIND = "/ride bind <touche> - assigner Smart Travel, ex. /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - effacer le raccourci Smart Travel",
        HELP_UPDATE = "/ride update - reconstruire l'action sécurisée",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "Monture terrestre",
        FLYING_MOUNT = "Monture volante",
        MOUNT_HINT = "Glissez un objet de monture depuis votre sac vers un emplacement, ou prenez-le et cliquez sur l'emplacement.",
        SLOT_EMPTY = "+",
        CLEAR = "Effacer",
        DRUID_FORMS = "Utiliser les formes de voyage du druide",
        DRUID_AQUATIC = "Utiliser Forme aquatique en nageant",
        DRUID_FLIGHT = "Utiliser Forme de vol dans les zones de vol",
        DRUID_TRAVEL = "Utiliser Forme de voyage en combat",
        CLASS_MOUNT = "Utiliser la monture de classe",
        PREVENT_FLYING_DISMOUNT = "Empêcher de descendre en vol",
        SET_BINDING = "Définir touche",
        CLEAR_BINDING = "Effacer touche",
        STATUS = "État",
        KEYBIND = "Raccourci",
        KEYBIND_CAPTURE = "Appuyez sur une touche pour RIDE Smart Travel. Appuyez sur Échap pour annuler.",
        CURRENT_ACTION = "Action actuelle",
        FLYABLE_AREA = "Zone de vol",
        YES = "oui",
        NO = "non",
        NOT_SET = "non défini",
        MISSING = "absent des sacs",
        PRESENT = "dans les sacs",
        UNUSABLE = "inutilisable",
        SLOT_HINT = "Clic droit sur un emplacement pour l'effacer.",
        WRONG_GROUND_SLOT = "Cela ressemble à une monture volante. Placez-la dans l'emplacement volant.",
        WRONG_FLYING_SLOT = "Cela ne ressemble pas à une monture volante.",
        SET_GROUND = "Monture terrestre définie sur %s.",
        SET_FLYING = "Monture volante définie sur %s.",
        CLEARED_GROUND = "Monture terrestre effacée.",
        CLEARED_FLYING = "Monture volante effacée.",
        NO_CURSOR_ITEM = "Placez d'abord un objet de monture sur le curseur.",
        DRUID_ON = "Formes de voyage du druide activées.",
        DRUID_OFF = "Formes de voyage du druide désactivées.",
        CLASS_MOUNT_ON = "Monture de classe activée.",
        CLASS_MOUNT_OFF = "Monture de classe désactivée.",
        BINDING_SET = "Smart Travel assigné à %s.",
        BINDING_CLEARED = "Raccourci Smart Travel effacé.",
        BINDING_CANCELLED = "Capture de touche annulée.",
        BINDING_FAILED = "Impossible d'assigner la touche.",
        BINDING_COMBAT = "Impossible de modifier les raccourcis en combat.",
        UPDATED = "Action de voyage sécurisée mise à jour.",
        UPDATE_DEFERRED = "En combat ; l'action sécurisée sera mise à jour après le combat.",
        NO_ACTION = "Aucune action de voyage n'est configurée pour cette situation.",
    },
    itIT = {
        BINDING_SMART_TRAVEL = "Viaggio intelligente",
        LOADED = "caricato. Usa /ride per aprire le opzioni.",
        HELP_HEADER = "Comandi di RIDE:",
        HELP_OPEN = "/ride - apri opzioni",
        HELP_STATUS = "/ride status - mostra la configurazione attuale",
        HELP_GROUND = "/ride ground <link o nome oggetto> - imposta cavalcatura terrestre",
        HELP_FLYING = "/ride flying <link o nome oggetto> - imposta cavalcatura volante",
        HELP_CURSOR = "/ride ground o /ride flying tenendo un oggetto cavalcatura sul cursore - imposta dal cursore",
        HELP_CLEAR = "/ride clear ground|flying - cancella una cavalcatura",
        HELP_DRUID = "/ride druid - attiva/disattiva forme di viaggio del druido",
        HELP_CLASS_MOUNT = "/ride classmount - attiva/disattiva cavalcature di classe paladino/stregone",
        HELP_BIND = "/ride bind <tasto> - assegna Smart Travel, es. /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - cancella il tasto di Smart Travel",
        HELP_UPDATE = "/ride update - ricostruisci l'azione sicura",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "Cavalcatura terrestre",
        FLYING_MOUNT = "Cavalcatura volante",
        MOUNT_HINT = "Trascina un oggetto cavalcatura dalla borsa a uno slot, oppure prendilo e clicca lo slot.",
        SLOT_EMPTY = "+",
        CLEAR = "Cancella",
        DRUID_FORMS = "Usa forme di viaggio del druido",
        DRUID_AQUATIC = "Usa Forma Acquatica mentre nuoti",
        DRUID_FLIGHT = "Usa Forma di Volo nelle aree volabili",
        DRUID_TRAVEL = "Usa Forma di Viaggio in combattimento",
        CLASS_MOUNT = "Usa cavalcatura di classe",
        PREVENT_FLYING_DISMOUNT = "Impedisci discesa in volo",
        SET_BINDING = "Imposta tasto",
        CLEAR_BINDING = "Cancella tasto",
        STATUS = "Stato",
        KEYBIND = "Tasto",
        KEYBIND_CAPTURE = "Premi un tasto per RIDE Smart Travel. Premi Esc per annullare.",
        CURRENT_ACTION = "Azione attuale",
        FLYABLE_AREA = "Area volabile",
        YES = "sì",
        NO = "no",
        NOT_SET = "non impostato",
        MISSING = "non nelle borse",
        PRESENT = "nelle borse",
        UNUSABLE = "non utilizzabile",
        SLOT_HINT = "Clic destro su uno slot per cancellarlo.",
        WRONG_GROUND_SLOT = "Sembra una cavalcatura volante. Mettila nello slot volante.",
        WRONG_FLYING_SLOT = "Non sembra una cavalcatura volante.",
        SET_GROUND = "Cavalcatura terrestre impostata su %s.",
        SET_FLYING = "Cavalcatura volante impostata su %s.",
        CLEARED_GROUND = "Cavalcatura terrestre cancellata.",
        CLEARED_FLYING = "Cavalcatura volante cancellata.",
        NO_CURSOR_ITEM = "Tieni prima un oggetto cavalcatura sul cursore.",
        DRUID_ON = "Forme di viaggio del druido attivate.",
        DRUID_OFF = "Forme di viaggio del druido disattivate.",
        CLASS_MOUNT_ON = "Cavalcatura di classe attivata.",
        CLASS_MOUNT_OFF = "Cavalcatura di classe disattivata.",
        BINDING_SET = "Smart Travel assegnato a %s.",
        BINDING_CLEARED = "Tasto Smart Travel cancellato.",
        BINDING_CANCELLED = "Acquisizione tasto annullata.",
        BINDING_FAILED = "Impossibile impostare il tasto.",
        BINDING_COMBAT = "Non puoi cambiare tasti in combattimento.",
        UPDATED = "Azione di viaggio sicura aggiornata.",
        UPDATE_DEFERRED = "In combattimento; l'azione sicura verrà aggiornata dopo il combattimento.",
        NO_ACTION = "Nessuna azione di viaggio configurata per questa situazione.",
    },
    koKR = {
        BINDING_SMART_TRAVEL = "스마트 이동",
        LOADED = "로드됨. 옵션을 열려면 /ride를 사용하세요.",
        HELP_HEADER = "RIDE 명령어:",
        HELP_OPEN = "/ride - 옵션 열기",
        HELP_STATUS = "/ride status - 현재 설정 표시",
        HELP_GROUND = "/ride ground <아이템 링크 또는 이름> - 지상 탈것 설정",
        HELP_FLYING = "/ride flying <아이템 링크 또는 이름> - 나는 탈것 설정",
        HELP_CURSOR = "/ride ground 또는 /ride flying 사용 시 커서에 탈것 아이템을 들고 있으면 커서에서 설정",
        HELP_CLEAR = "/ride clear ground|flying - 탈것 지우기",
        HELP_DRUID = "/ride druid - 드루이드 이동 변신 전환",
        HELP_CLASS_MOUNT = "/ride classmount - 성기사/흑마법사 직업 탈것 전환",
        HELP_BIND = "/ride bind <키> - Smart Travel 단축키 설정, 예: /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - Smart Travel 단축키 지우기",
        HELP_UPDATE = "/ride update - 보안 동작 다시 만들기",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "지상 탈것",
        FLYING_MOUNT = "나는 탈것",
        MOUNT_HINT = "가방의 탈것 아이템을 슬롯으로 끌어오거나, 아이템을 집어 슬롯을 클릭하세요.",
        SLOT_EMPTY = "+",
        CLEAR = "지우기",
        DRUID_FORMS = "드루이드 이동 변신 사용",
        DRUID_AQUATIC = "수영 중 바다표범 변신 사용",
        DRUID_FLIGHT = "비행 가능 지역에서 폭풍까마귀 변신 사용",
        DRUID_TRAVEL = "전투 중 치타 변신 사용",
        CLASS_MOUNT = "직업 탈것 사용",
        PREVENT_FLYING_DISMOUNT = "비행 중 탈것 해제 방지",
        SET_BINDING = "키 설정",
        CLEAR_BINDING = "키 지우기",
        STATUS = "상태",
        KEYBIND = "단축키",
        KEYBIND_CAPTURE = "RIDE Smart Travel에 사용할 키를 누르세요. 취소하려면 Esc를 누르세요.",
        CURRENT_ACTION = "현재 동작",
        FLYABLE_AREA = "비행 가능 지역",
        YES = "예",
        NO = "아니요",
        NOT_SET = "설정 안 됨",
        MISSING = "가방에 없음",
        PRESENT = "가방에 있음",
        UNUSABLE = "사용 불가",
        SLOT_HINT = "슬롯을 지우려면 우클릭하세요.",
        WRONG_GROUND_SLOT = "나는 탈것처럼 보입니다. 나는 탈것 슬롯에 넣으세요.",
        WRONG_FLYING_SLOT = "나는 탈것처럼 보이지 않습니다.",
        SET_GROUND = "지상 탈것을 %s로 설정했습니다.",
        SET_FLYING = "나는 탈것을 %s로 설정했습니다.",
        CLEARED_GROUND = "지상 탈것을 지웠습니다.",
        CLEARED_FLYING = "나는 탈것을 지웠습니다.",
        NO_CURSOR_ITEM = "먼저 커서에 탈것 아이템을 들어 주세요.",
        DRUID_ON = "드루이드 이동 변신을 활성화했습니다.",
        DRUID_OFF = "드루이드 이동 변신을 비활성화했습니다.",
        CLASS_MOUNT_ON = "직업 탈것을 활성화했습니다.",
        CLASS_MOUNT_OFF = "직업 탈것을 비활성화했습니다.",
        BINDING_SET = "Smart Travel을 %s에 설정했습니다.",
        BINDING_CLEARED = "Smart Travel 단축키를 지웠습니다.",
        BINDING_CANCELLED = "키 입력이 취소되었습니다.",
        BINDING_FAILED = "단축키를 설정할 수 없습니다.",
        BINDING_COMBAT = "전투 중에는 단축키를 변경할 수 없습니다.",
        UPDATED = "보안 이동 동작이 업데이트되었습니다.",
        UPDATE_DEFERRED = "전투 중입니다. 전투가 끝나면 보안 동작을 업데이트합니다.",
        NO_ACTION = "이 상황에 설정된 이동 동작이 없습니다.",
    },
    ruRU = {
        BINDING_SMART_TRAVEL = "Умное путешествие",
        LOADED = "загружен. Используйте /ride, чтобы открыть настройки.",
        HELP_HEADER = "Команды RIDE:",
        HELP_OPEN = "/ride - открыть настройки",
        HELP_STATUS = "/ride status - показать текущие настройки",
        HELP_GROUND = "/ride ground <ссылка или имя предмета> - задать наземное средство передвижения",
        HELP_FLYING = "/ride flying <ссылка или имя предмета> - задать летающее средство передвижения",
        HELP_CURSOR = "/ride ground или /ride flying с предметом средства передвижения на курсоре - задать с курсора",
        HELP_CLEAR = "/ride clear ground|flying - очистить средство передвижения",
        HELP_DRUID = "/ride druid - переключить дорожные облики друида",
        HELP_CLASS_MOUNT = "/ride classmount - переключить классовые средства передвижения паладина/чернокнижника",
        HELP_BIND = "/ride bind <клавиша> - назначить Smart Travel, например /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - удалить клавишу Smart Travel",
        HELP_UPDATE = "/ride update - пересобрать защищенное действие",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "Наземное средство",
        FLYING_MOUNT = "Летающее средство",
        MOUNT_HINT = "Перетащите предмет средства передвижения из сумки в ячейку или возьмите его и щелкните ячейку.",
        SLOT_EMPTY = "+",
        CLEAR = "Очистить",
        DRUID_FORMS = "Использовать дорожные облики друида",
        DRUID_AQUATIC = "Использовать водный облик при плавании",
        DRUID_FLIGHT = "Использовать облик полета в летных зонах",
        DRUID_TRAVEL = "Использовать походный облик в бою",
        CLASS_MOUNT = "Использовать классовое средство",
        PREVENT_FLYING_DISMOUNT = "Запретить спешивание в полете",
        SET_BINDING = "Назначить",
        CLEAR_BINDING = "Очистить",
        STATUS = "Статус",
        KEYBIND = "Клавиша",
        KEYBIND_CAPTURE = "Нажмите клавишу для RIDE Smart Travel. Нажмите Esc для отмены.",
        CURRENT_ACTION = "Текущее действие",
        FLYABLE_AREA = "Летная зона",
        YES = "да",
        NO = "нет",
        NOT_SET = "не задано",
        MISSING = "нет в сумках",
        PRESENT = "в сумках",
        UNUSABLE = "нельзя использовать",
        SLOT_HINT = "Щелкните ячейку правой кнопкой, чтобы очистить ее.",
        WRONG_GROUND_SLOT = "Это похоже на летающее средство. Поместите его в ячейку для полета.",
        WRONG_FLYING_SLOT = "Это не похоже на летающее средство.",
        SET_GROUND = "Наземное средство задано: %s.",
        SET_FLYING = "Летающее средство задано: %s.",
        CLEARED_GROUND = "Наземное средство очищено.",
        CLEARED_FLYING = "Летающее средство очищено.",
        NO_CURSOR_ITEM = "Сначала возьмите предмет средства передвижения на курсор.",
        DRUID_ON = "Дорожные облики друида включены.",
        DRUID_OFF = "Дорожные облики друида выключены.",
        CLASS_MOUNT_ON = "Классовое средство включено.",
        CLASS_MOUNT_OFF = "Классовое средство выключено.",
        BINDING_SET = "Smart Travel назначен на %s.",
        BINDING_CLEARED = "Клавиша Smart Travel очищена.",
        BINDING_CANCELLED = "Назначение клавиши отменено.",
        BINDING_FAILED = "Не удалось назначить клавишу.",
        BINDING_COMBAT = "Нельзя менять клавиши в бою.",
        UPDATED = "Защищенное действие путешествия обновлено.",
        UPDATE_DEFERRED = "Вы в бою; защищенное действие обновится после боя.",
        NO_ACTION = "Для этой ситуации не настроено действие путешествия.",
    },
    zhCN = {
        BINDING_SMART_TRAVEL = "智能旅行",
        LOADED = "已加载。使用 /ride 打开选项。",
        HELP_HEADER = "RIDE 命令：",
        HELP_OPEN = "/ride - 打开选项",
        HELP_STATUS = "/ride status - 显示当前设置",
        HELP_GROUND = "/ride ground <物品链接或名称> - 设置地面坐骑",
        HELP_FLYING = "/ride flying <物品链接或名称> - 设置飞行坐骑",
        HELP_CURSOR = "/ride ground 或 /ride flying，鼠标拿着坐骑物品时从光标设置",
        HELP_CLEAR = "/ride clear ground|flying - 清除坐骑",
        HELP_DRUID = "/ride druid - 切换德鲁伊旅行形态",
        HELP_CLASS_MOUNT = "/ride classmount - 切换圣骑士/术士职业坐骑",
        HELP_BIND = "/ride bind <按键> - 绑定 Smart Travel，例如 /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - 清除 Smart Travel 按键",
        HELP_UPDATE = "/ride update - 重建安全动作",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "地面坐骑",
        FLYING_MOUNT = "飞行坐骑",
        MOUNT_HINT = "将背包中的坐骑物品拖到槽位，或拿起物品后点击槽位。",
        SLOT_EMPTY = "+",
        CLEAR = "清除",
        DRUID_FORMS = "使用德鲁伊旅行形态",
        DRUID_AQUATIC = "游泳时使用水栖形态",
        DRUID_FLIGHT = "在可飞行区域使用飞行形态",
        DRUID_TRAVEL = "战斗中使用旅行形态",
        CLASS_MOUNT = "使用职业坐骑",
        PREVENT_FLYING_DISMOUNT = "飞行中防止下坐骑",
        SET_BINDING = "设置按键",
        CLEAR_BINDING = "清除按键",
        STATUS = "状态",
        KEYBIND = "按键绑定",
        KEYBIND_CAPTURE = "按下一个按键用于 RIDE Smart Travel。按 Esc 取消。",
        CURRENT_ACTION = "当前动作",
        FLYABLE_AREA = "可飞行区域",
        YES = "是",
        NO = "否",
        NOT_SET = "未设置",
        MISSING = "不在背包中",
        PRESENT = "在背包中",
        UNUSABLE = "不可用",
        SLOT_HINT = "右键点击槽位可清除。",
        WRONG_GROUND_SLOT = "这看起来像飞行坐骑。请放入飞行槽位。",
        WRONG_FLYING_SLOT = "这看起来不像飞行坐骑。",
        SET_GROUND = "地面坐骑已设置为 %s。",
        SET_FLYING = "飞行坐骑已设置为 %s。",
        CLEARED_GROUND = "地面坐骑已清除。",
        CLEARED_FLYING = "飞行坐骑已清除。",
        NO_CURSOR_ITEM = "请先用鼠标拿起一个坐骑物品。",
        DRUID_ON = "德鲁伊旅行形态已启用。",
        DRUID_OFF = "德鲁伊旅行形态已禁用。",
        CLASS_MOUNT_ON = "职业坐骑已启用。",
        CLASS_MOUNT_OFF = "职业坐骑已禁用。",
        BINDING_SET = "Smart Travel 已绑定到 %s。",
        BINDING_CLEARED = "Smart Travel 按键已清除。",
        BINDING_CANCELLED = "按键捕获已取消。",
        BINDING_FAILED = "无法设置按键。",
        BINDING_COMBAT = "战斗中无法更改按键绑定。",
        UPDATED = "安全旅行动作已更新。",
        UPDATE_DEFERRED = "战斗中；安全动作将在脱离战斗后更新。",
        NO_ACTION = "当前情况没有配置旅行动作。",
    },
    zhTW = {
        BINDING_SMART_TRAVEL = "智慧旅行",
        LOADED = "已載入。使用 /ride 開啟選項。",
        HELP_HEADER = "RIDE 指令：",
        HELP_OPEN = "/ride - 開啟選項",
        HELP_STATUS = "/ride status - 顯示目前設定",
        HELP_GROUND = "/ride ground <物品連結或名稱> - 設定地面坐騎",
        HELP_FLYING = "/ride flying <物品連結或名稱> - 設定飛行坐騎",
        HELP_CURSOR = "/ride ground 或 /ride flying，游標拿著坐騎物品時從游標設定",
        HELP_CLEAR = "/ride clear ground|flying - 清除坐騎",
        HELP_DRUID = "/ride druid - 切換德魯伊旅行形態",
        HELP_CLASS_MOUNT = "/ride classmount - 切換聖騎士/術士職業坐騎",
        HELP_BIND = "/ride bind <按鍵> - 綁定 Smart Travel，例如 /ride bind CTRL-F",
        HELP_UNBIND = "/ride unbind - 清除 Smart Travel 按鍵",
        HELP_UPDATE = "/ride update - 重建安全動作",
        OPTIONS_TITLE = "RIDE",
        OPTIONS_DESC = "Ride Intelligent Dispatch Engine",
        GROUND_MOUNT = "地面坐騎",
        FLYING_MOUNT = "飛行坐騎",
        MOUNT_HINT = "將背包中的坐騎物品拖到欄位，或拿起物品後點擊欄位。",
        SLOT_EMPTY = "+",
        CLEAR = "清除",
        DRUID_FORMS = "使用德魯伊旅行形態",
        DRUID_AQUATIC = "游泳時使用水棲形態",
        DRUID_FLIGHT = "在可飛行區域使用飛行形態",
        DRUID_TRAVEL = "戰鬥中使用旅行形態",
        CLASS_MOUNT = "使用職業坐騎",
        PREVENT_FLYING_DISMOUNT = "飛行中防止下坐騎",
        SET_BINDING = "設定按鍵",
        CLEAR_BINDING = "清除按鍵",
        STATUS = "狀態",
        KEYBIND = "按鍵綁定",
        KEYBIND_CAPTURE = "按下一個按鍵用於 RIDE Smart Travel。按 Esc 取消。",
        CURRENT_ACTION = "目前動作",
        FLYABLE_AREA = "可飛行區域",
        YES = "是",
        NO = "否",
        NOT_SET = "未設定",
        MISSING = "不在背包中",
        PRESENT = "在背包中",
        UNUSABLE = "不可用",
        SLOT_HINT = "右鍵點擊欄位可清除。",
        WRONG_GROUND_SLOT = "這看起來像飛行坐騎。請放入飛行欄位。",
        WRONG_FLYING_SLOT = "這看起來不像飛行坐騎。",
        SET_GROUND = "地面坐騎已設定為 %s。",
        SET_FLYING = "飛行坐騎已設定為 %s。",
        CLEARED_GROUND = "地面坐騎已清除。",
        CLEARED_FLYING = "飛行坐騎已清除。",
        NO_CURSOR_ITEM = "請先用游標拿起一個坐騎物品。",
        DRUID_ON = "德魯伊旅行形態已啟用。",
        DRUID_OFF = "德魯伊旅行形態已停用。",
        CLASS_MOUNT_ON = "職業坐騎已啟用。",
        CLASS_MOUNT_OFF = "職業坐騎已停用。",
        BINDING_SET = "Smart Travel 已綁定到 %s。",
        BINDING_CLEARED = "Smart Travel 按鍵已清除。",
        BINDING_CANCELLED = "按鍵擷取已取消。",
        BINDING_FAILED = "無法設定按鍵。",
        BINDING_COMBAT = "戰鬥中無法變更按鍵綁定。",
        UPDATED = "安全旅行動作已更新。",
        UPDATE_DEFERRED = "戰鬥中；安全動作將在脫離戰鬥後更新。",
        NO_ACTION = "目前情況沒有設定旅行動作。",
    },
}

LOCALES.enGB = LOCALES.enUS

local function GetLocalizedStrings(locale)
    local strings = LOCALES[locale] or LOCALES.enUS
    if strings ~= LOCALES.enUS then
        setmetatable(strings, { __index = LOCALES.enUS })
    end
    return strings
end

local L = GetLocalizedStrings(LOCALE)

_G["BINDING_NAME_RIDE_SMART_TRAVEL"] = L.BINDING_SMART_TRAVEL
_G["BINDING_NAME_CLICK RIDEButton:LeftButton"] = L.BINDING_SMART_TRAVEL

local DEFAULT_DB = {
    version = 1,
    ground = {
        name = "",
        itemID = nil,
        link = "",
        icon = nil,
    },
    flying = {
        name = "",
        itemID = nil,
        link = "",
        icon = nil,
    },
    useDruidForms = true,
    useDruidAquatic = true,
    useDruidFlight = true,
    useDruidTravel = true,
    useClassMount = true,
    dismount = false,
    preventDismountFlying = true,
}

local DRUID_SPELLS = {
    aquatic = 1066,
    travel = 783,
    flight = 33943,
    swiftFlight = 40120,
}

local CLASS_MOUNT_SPELLS = {
    PALADIN = {
        23214, -- Summon Charger
        34767, -- Summon Thalassian Charger
        13819, -- Summon Warhorse
        34769, -- Summon Thalassian Warhorse
    },
    WARLOCK = {
        23161, -- Summon Dreadsteed
        5784, -- Summon Felsteed
    },
}

local ICONS = {
    preventDismount = "Interface\\Icons\\Ability_Mount_Gryphon_01",
}

local OUTLAND_MAPS = {
    [100] = true, -- Hellfire Peninsula
    [101] = true, -- Outland on some clients
    [102] = true, -- Zangarmarsh
    [104] = true, -- Shadowmoon Valley
    [105] = true, -- Blade's Edge Mountains
    [107] = true, -- Nagrand
    [108] = true, -- Terokkar Forest
    [109] = true, -- Netherstorm
    [111] = true, -- Shattrath City
    [1945] = true, -- Outland on Anniversary clients
}

local db
local optionsPanel
local standaloneWindow
local settingsCategory
local statusLines = {}
local pendingSecureUpdate
local pendingBindingOverride
local lastActionText = ""
local lastMacroText = ""
local bindingCaptureFrame

local playerClass
local isDruid
local hasClassMounts

local BINDING_COMMAND = "CLICK RIDEButton:LeftButton"
local VISIBLE_BINDING_COMMAND = "RIDE_SMART_TRAVEL"
local CreateText
local CreateButton

local function CopyDefaults(source)
    local copy = {}
    for key, value in pairs(source) do
        if type(value) == "table" then
            copy[key] = CopyDefaults(value)
        else
            copy[key] = value
        end
    end
    return copy
end

local function MergeDefaults(target, defaults)
    for key, value in pairs(defaults) do
        if type(value) == "table" then
            if type(target[key]) ~= "table" then
                target[key] = CopyDefaults(value)
            else
                MergeDefaults(target[key], value)
            end
        elseif type(target[key]) ~= type(value) then
            target[key] = value
        end
    end
end

local function EnsureDb()
    if type(RIDEDB) ~= "table" then
        RIDEDB = CopyDefaults(DEFAULT_DB)
    else
        MergeDefaults(RIDEDB, DEFAULT_DB)
    end
    db = RIDEDB
end

local function Print(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cff66ccffRIDE:|r " .. tostring(message))
end

local function Trim(text)
    text = tostring(text or "")
    text = text:gsub("^%s+", ""):gsub("%s+$", "")
    return text
end

local function ExtractItemID(link)
    if type(link) ~= "string" then
        return nil
    end
    return tonumber(link:match("item:(%d+)"))
end

local function ExtractItemName(text)
    if type(text) ~= "string" then
        return ""
    end
    return text:match("|Hitem:.-|h%[(.-)%]|h") or text:match("%[(.-)%]") or text
end

local function NormalizeMountInput(text)
    text = Trim(text)
    if text == "" then
        return "", nil, ""
    end

    local link = text:match("(|c%x+|Hitem:.-|h%[.-%]|h|r)") or text:match("(|Hitem:.-|h%[.-%]|h)")
    local itemID = ExtractItemID(link or text)
    local name = ""

    if link and GetItemInfo then
        name = GetItemInfo(link) or ExtractItemName(link)
    else
        name = ExtractItemName(text)
    end

    return Trim(name), itemID, link or ""
end

local function GetItemTextureFromMount(name, itemID, link)
    if GetItemIcon and (itemID or link or name) then
        return GetItemIcon(itemID or link or name)
    end

    if GetItemInfo then
        return select(10, GetItemInfo(link or itemID or name))
    end

    return nil
end

local StoreMount

local scanTooltip
local scanTooltipLines = {}

local function EnsureScanTooltip()
    if scanTooltip then
        return scanTooltip
    end

    local tooltipName = "RIDEScanTooltip"
    scanTooltip = CreateFrame("GameTooltip", tooltipName, UIParent, "GameTooltipTemplate")
    scanTooltip:SetOwner(UIParent, "ANCHOR_NONE")

    for i = 1, 12 do
        scanTooltipLines[i] = _G[tooltipName .. "TextLeft" .. i]
    end

    return scanTooltip
end

local function ScanTooltipText(itemRef)
    if not itemRef then
        return ""
    end

    local tooltip = EnsureScanTooltip()
    tooltip:ClearLines()
    if type(itemRef) == "string" and itemRef:find("item:") then
        tooltip:SetHyperlink(itemRef)
    elseif tooltip.SetItemByID then
        tooltip:SetItemByID(itemRef)
    else
        tooltip:SetHyperlink("item:" .. tostring(itemRef))
    end

    local text = ""
    for i = 1, #scanTooltipLines do
        local line = scanTooltipLines[i]
        if line and line:GetText() then
            text = text .. "\n" .. line:GetText()
        end
    end

    return text:lower()
end

local function IsFlyingMountItem(itemRef, itemName)
    local tooltipText = ScanTooltipText(itemRef)
    if tooltipText ~= "" then
        if tooltipText:find("300") or tooltipText:find("225")
            or tooltipText:find("expert riding")
            or tooltipText:find("artisan riding")
            or tooltipText:find("perito")
            or tooltipText:find("artes") then
            return true
        end

        if tooltipText:find("150") or tooltipText:find("75") then
            return false
        end
    end

    itemName = (itemName or ""):lower()
    if itemName:find("gryphon") or itemName:find("wind rider") or itemName:find("nether")
        or itemName:find("ray") or itemName:find("hippogryph") or itemName:find("phoenix")
        or itemName:find("gyrocopter") or itemName:find("flying") then
        return true
    end

    return false
end

local function ValidateMountForSlot(kind, itemRef, itemName)
    local isFlyingMount = IsFlyingMountItem(itemRef, itemName)

    if kind == "flying" and not isFlyingMount then
        Print(L.WRONG_FLYING_SLOT)
        return false
    end

    if kind == "ground" and isFlyingMount then
        Print(L.WRONG_GROUND_SLOT)
        return false
    end

    return true
end

local function ClearInvalidSlotMounts()
    if not db then
        return
    end

    if db.ground and db.ground.name and db.ground.name ~= ""
        and IsFlyingMountItem(db.ground.link ~= "" and db.ground.link or db.ground.itemID or db.ground.name, db.ground.name) then
        StoreMount("ground", "", nil, "")
    end

    if db.flying and db.flying.name and db.flying.name ~= ""
        and not IsFlyingMountItem(db.flying.link ~= "" and db.flying.link or db.flying.itemID or db.flying.name, db.flying.name) then
        StoreMount("flying", "", nil, "")
    end
end

function StoreMount(kind, name, itemID, link)
    db[kind].name = name or ""
    db[kind].itemID = itemID
    db[kind].link = link or ""
    db[kind].icon = GetItemTextureFromMount(name, itemID, link)
end

local function GetContainerSlotLink(bag, slot)
    if C_Container and C_Container.GetContainerItemLink then
        return C_Container.GetContainerItemLink(bag, slot)
    end
    if GetContainerItemLink then
        return GetContainerItemLink(bag, slot)
    end
    return nil
end

local function GetContainerSlots(bag)
    if C_Container and C_Container.GetContainerNumSlots then
        return C_Container.GetContainerNumSlots(bag) or 0
    end
    if GetContainerNumSlots then
        return GetContainerNumSlots(bag) or 0
    end
    return 0
end

local function IsMountInBags(mount)
    if type(mount) ~= "table" or not mount.name or mount.name == "" then
        return false
    end

    for bag = 0, NUM_BAG_SLOTS or 4 do
        for slot = 1, GetContainerSlots(bag) do
            local link = GetContainerSlotLink(bag, slot)
            if link then
                local itemID = ExtractItemID(link)
                if mount.itemID and itemID == mount.itemID then
                    return true
                end
                local itemName = GetItemInfo and GetItemInfo(link)
                if itemName and itemName == mount.name then
                    return true
                end
            end
        end
    end

    return false
end

local function GetMountItemRef(mount)
    if type(mount) ~= "table" then
        return nil
    end
    return mount.itemID or mount.name
end

local function IsMountUsable(mount)
    if type(mount) ~= "table" or not mount.name or mount.name == "" then
        return false, L.NOT_SET
    end

    if not IsMountInBags(mount) then
        return false, L.MISSING
    end

    if IsUsableItem then
        local usable = IsUsableItem(GetMountItemRef(mount))
        if usable == false then
            return false, L.UNUSABLE
        end
    end

    return true, L.PRESENT
end

local function IsMountConfiguredAndInBags(mount)
    return type(mount) == "table"
        and mount.name
        and mount.name ~= ""
        and IsMountInBags(mount)
end

local function IsSpellKnownByID(spellID)
    if not spellID then
        return false
    end

    if IsSpellKnown and IsSpellKnown(spellID) then
        return true
    end

    if IsPlayerSpell and IsPlayerSpell(spellID) then
        return true
    end

    local spellName = GetSpellInfo and GetSpellInfo(spellID)
    if not spellName or not GetNumSpellTabs or not GetSpellTabInfo or not GetSpellBookItemName then
        return false
    end

    for tab = 1, GetNumSpellTabs() do
        local _, _, offset, numSlots = GetSpellTabInfo(tab)
        for index = (offset or 0) + 1, (offset or 0) + (numSlots or 0) do
            local bookName = GetSpellBookItemName(index, BOOKTYPE_SPELL)
            if bookName == spellName then
                return true
            end
        end
    end

    return false
end

local function GetKnownSpellName(spellID)
    if IsSpellKnownByID(spellID) and GetSpellInfo then
        return GetSpellInfo(spellID)
    end
    return nil
end

local function GetBestFlightForm()
    return GetKnownSpellName(DRUID_SPELLS.swiftFlight) or GetKnownSpellName(DRUID_SPELLS.flight)
end

local function GetBestClassMountSpellID()
    local spells = playerClass and CLASS_MOUNT_SPELLS[playerClass]
    if not spells then
        return nil
    end

    for _, spellID in ipairs(spells) do
        if IsSpellKnownByID(spellID) then
            return spellID
        end
    end

    return nil
end

local function GetBestClassMountName()
    local spellID = GetBestClassMountSpellID()
    if spellID and GetSpellInfo then
        return GetSpellInfo(spellID)
    end
    return nil
end

local function GetBestClassMountIcon()
    local spellID = GetBestClassMountSpellID()
    if spellID and GetSpellInfo then
        return select(3, GetSpellInfo(spellID))
    end
    return nil
end

local function GetClassMountIcon()
    local icon = GetBestClassMountIcon()
    if icon then
        return icon
    end

    local spells = playerClass and CLASS_MOUNT_SPELLS[playerClass]
    if spells and GetSpellInfo then
        return select(3, GetSpellInfo(spells[1]))
    end
    return nil
end

local function UpdatePlayerClass()
    _, playerClass = UnitClass("player")
    isDruid = playerClass == "DRUID"
    hasClassMounts = CLASS_MOUNT_SPELLS[playerClass] and true or false
end

local function IsInRestrictedInstance()
    if IsInInstance then
        local inInstance, instanceType = IsInInstance()
        if inInstance and instanceType and instanceType ~= "none" then
            return true
        end
    end

    if GetInstanceInfo then
        local _, instanceType = GetInstanceInfo()
        if instanceType and instanceType ~= "none" then
            return true
        end
    end

    return false
end

local function GetInstanceMapID()
    if not GetInstanceInfo then
        return nil
    end
    local _, _, _, _, _, _, _, mapID = GetInstanceInfo()
    return mapID
end

function RIDE:IsFlyableArea()
    if IsInRestrictedInstance() then
        return false
    end

    local instanceMapID = GetInstanceMapID()
    if instanceMapID == 530 then
        return true
    end

    if C_Map and C_Map.GetBestMapForUnit then
        local mapID = C_Map.GetBestMapForUnit("player")
        local safety = 0

        while mapID and safety < 12 do
            if OUTLAND_MAPS[mapID] then
                return true
            end

            if not C_Map.GetMapInfo then
                break
            end

            local info = C_Map.GetMapInfo(mapID)
            mapID = info and info.parentMapID
            safety = safety + 1
        end
    end

    if GetCurrentMapContinent then
        local continent = GetCurrentMapContinent()
        if continent == 3 then
            return true
        end
    end

    return false
end

local function AddLine(lines, line)
    if line and line ~= "" then
        lines[#lines + 1] = line
    end
end

local function EscapeMacroArg(text)
    return tostring(text or ""):gsub("\n", " ")
end

local function BuildMacro()
    local lines = {}
    local actionText = L.NO_ACTION

    if db.preventDismountFlying then
        AddLine(lines, "/stopmacro [flying]")
    end
    AddLine(lines, "/dismount [mounted]")

    if isDruid and db.useDruidAquatic then
        local aquaticName = GetKnownSpellName(DRUID_SPELLS.aquatic)
        if aquaticName then
            AddLine(lines, "/cast [swimming] " .. aquaticName)
            AddLine(lines, "/stopmacro [swimming]")
        end
    end

    if isDruid and db.useDruidTravel then
        local travelName = GetKnownSpellName(DRUID_SPELLS.travel)
        if travelName then
            AddLine(lines, "/cast [combat,outdoors,nomounted] " .. travelName)
            AddLine(lines, "/stopmacro [combat,outdoors,nomounted]")
        end
    end

    if RIDE:IsFlyableArea() then
        if isDruid and db.useDruidFlight then
            local flightName = GetBestFlightForm()
            if flightName then
                AddLine(lines, "/cast [outdoors,nomounted] " .. flightName)
                actionText = flightName
                return table.concat(lines, "\n"), actionText
            end
        end

        if IsMountConfiguredAndInBags(db.flying) then
            AddLine(lines, "/use [nomounted] " .. EscapeMacroArg(db.flying.name))
            actionText = db.flying.name
            return table.concat(lines, "\n"), actionText
        end
    end

    if hasClassMounts and db.useClassMount then
        local classMountName = GetBestClassMountName()
        if classMountName then
            AddLine(lines, "/cast [outdoors,nomounted] " .. classMountName)
            actionText = classMountName
            return table.concat(lines, "\n"), actionText
        end
    end

    if IsMountConfiguredAndInBags(db.ground) then
        AddLine(lines, "/use [nomounted] " .. EscapeMacroArg(db.ground.name))
        actionText = db.ground.name
        return table.concat(lines, "\n"), actionText
    end

    AddLine(lines, "/run RIDE:NoActionFeedback()")
    return table.concat(lines, "\n"), actionText
end

local secureButton = CreateFrame("Button", "RIDEButton", UIParent, "SecureActionButtonTemplate")
secureButton:SetSize(1, 1)
secureButton:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -20, 20)
secureButton:SetAlpha(0)
secureButton:RegisterForClicks("AnyUp", "AnyDown")
secureButton:SetAttribute("type", "macro")
secureButton:SetAttribute("macrotext", "")
secureButton:Show()

function RIDE:NoActionFeedback()
    Print(L.NO_ACTION)
end

local function GetBindingSet()
    if GetCurrentBindingSet then
        return GetCurrentBindingSet()
    end
    return 2
end

local function GetSmartTravelKey()
    if GetBindingKey then
        local key1, key2 = GetBindingKey(BINDING_COMMAND)
        if key1 or key2 then
            return key1, key2
        end
        return GetBindingKey(VISIBLE_BINDING_COMMAND)
    end
    return nil
end

local function SaveBindingSet()
    if SaveBindings then
        SaveBindings(GetBindingSet())
    end
end

local function NormalizeKey(key)
    key = Trim(key):upper()
    key = key:gsub("%s+", "")
    key = key:gsub("MIDDLEBUTTON", "BUTTON3")
    key = key:gsub("BUTTON3", "BUTTON3")
    key = key:gsub("BUTTON4", "BUTTON4")
    key = key:gsub("BUTTON5", "BUTTON5")
    key = key:gsub("MOUSEWHEELUP", "MOUSEWHEELUP")
    key = key:gsub("MOUSEWHEELDOWN", "MOUSEWHEELDOWN")
    key = key:gsub("CTRL%-", "CTRL-")
    key = key:gsub("CONTROL%-", "CTRL-")
    key = key:gsub("SHIFT%-", "SHIFT-")
    key = key:gsub("ALT%-", "ALT-")
    return key
end

local BUTTON_BINDINGS = {
    LeftButton = "BUTTON1",
    RightButton = "BUTTON2",
    MiddleButton = "BUTTON3",
    Button4 = "BUTTON4",
    Button5 = "BUTTON5",
}

local function BuildKeyFromInput(key)
    key = tostring(key or "")
    if key == "" then
        return ""
    end

    key = BUTTON_BINDINGS[key] or key
    local upper = key:upper()
    if upper == "LSHIFT" or upper == "RSHIFT" or upper == "LCTRL" or upper == "RCTRL"
        or upper == "LALT" or upper == "RALT" or upper == "UNKNOWN" then
        return ""
    end

    local prefix = ""
    if IsControlKeyDown and IsControlKeyDown() then
        prefix = prefix .. "CTRL-"
    end
    if IsAltKeyDown and IsAltKeyDown() then
        prefix = prefix .. "ALT-"
    end
    if IsShiftKeyDown and IsShiftKeyDown() then
        prefix = prefix .. "SHIFT-"
    end

    return NormalizeKey(prefix .. upper)
end

function RIDE:SetSmartTravelBinding(key)
    if InCombatLockdown and InCombatLockdown() then
        Print(L.BINDING_COMBAT)
        return false
    end

    key = NormalizeKey(key)
    if key == "" then
        return false
    end

    if SetBinding then
        SetBinding(key)
    end

    if SetBindingClick and SetBindingClick(key, "RIDEButton", "LeftButton") then
        SaveBindingSet()
        Print(string.format(L.BINDING_SET, key))
        self:RefreshOptions()
        return true
    end

    Print(L.BINDING_FAILED)
    return false
end

function RIDE:ClearSmartTravelBinding()
    if InCombatLockdown and InCombatLockdown() then
        Print(L.BINDING_COMBAT)
        return false
    end

    local key1, key2 = GetSmartTravelKey()
    if key1 and SetBinding then
        SetBinding(key1)
    end
    if key2 and SetBinding then
        SetBinding(key2)
    end
    key1, key2 = GetBindingKey and GetBindingKey(VISIBLE_BINDING_COMMAND)
    if key1 and SetBinding then
        SetBinding(key1)
    end
    if key2 and SetBinding then
        SetBinding(key2)
    end
    SaveBindingSet()
    if ClearOverrideBindings then
        ClearOverrideBindings(self)
    end
    Print(L.BINDING_CLEARED)
    self:RefreshOptions()
    return true
end

function RIDE:ApplyVisibleBindingOverride()
    if InCombatLockdown and InCombatLockdown() then
        pendingBindingOverride = true
        return
    end

    pendingBindingOverride = nil

    if not ClearOverrideBindings or not SetOverrideBindingClick or not GetBindingKey then
        return
    end

    ClearOverrideBindings(self)

    local key1, key2 = GetBindingKey(VISIBLE_BINDING_COMMAND)
    if key1 then
        SetOverrideBindingClick(self, false, key1, "RIDEButton", "LeftButton")
    end
    if key2 then
        SetOverrideBindingClick(self, false, key2, "RIDEButton", "LeftButton")
    end

    self:RefreshOptions()
end

function RIDE:StopBindingCapture(cancelled)
    if bindingCaptureFrame then
        bindingCaptureFrame:Hide()
    end
    if cancelled then
        Print(L.BINDING_CANCELLED)
    end
end

function RIDE:StartBindingCapture()
    if InCombatLockdown and InCombatLockdown() then
        Print(L.BINDING_COMBAT)
        return
    end

    if not bindingCaptureFrame then
        local ok, frame = pcall(CreateFrame, "Frame", "RIDEBindingCaptureFrame", UIParent, "BackdropTemplate")
        if not ok or not frame then
            ok, frame = pcall(CreateFrame, "Frame", "RIDEBindingCaptureFrame", UIParent, "BasicFrameTemplateWithInset")
        end
        if not ok or not frame then
            frame = CreateFrame("Frame", "RIDEBindingCaptureFrame", UIParent)
        end

        frame:SetSize(470, 130)
        frame:SetPoint("CENTER")
        frame:SetFrameStrata("FULLSCREEN_DIALOG")
        frame:SetFrameLevel(900)
        frame:SetToplevel(true)
        frame:EnableMouse(true)
        frame:EnableKeyboard(true)
        if frame.EnableMouseWheel then
            frame:EnableMouseWheel(true)
        end
        if frame.SetPropagateKeyboardInput then
            frame:SetPropagateKeyboardInput(false)
        end

        if frame.SetBackdrop then
            frame:SetBackdrop({
                bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = true,
                tileSize = 32,
                edgeSize = 32,
                insets = { left = 11, right = 12, top = 12, bottom = 11 },
            })
            frame:SetBackdropColor(0, 0, 0, 0.94)
            frame:SetBackdropBorderColor(0.65, 0.55, 0.35, 1)
        end

        local title = CreateText(frame, L.SET_BINDING, "GameFontNormal")
        title:SetPoint("TOP", frame, "TOP", 0, -20)
        title:SetJustifyH("CENTER")
        frame.title = title

        local text = CreateText(frame, L.KEYBIND_CAPTURE, "GameFontHighlight")
        text:SetPoint("TOP", frame, "TOP", 0, -48)
        text:SetWidth(410)
        text:SetJustifyH("CENTER")
        frame.text = text

        local cancel = CreateButton(frame, CANCEL or "Cancel", 90)
        cancel:SetPoint("BOTTOM", frame, "BOTTOM", 0, 20)
        cancel:SetScript("OnClick", function()
            RIDE:StopBindingCapture(true)
        end)

        frame:SetScript("OnKeyDown", function(_, key)
            if key == "ESCAPE" then
                RIDE:StopBindingCapture(true)
                return
            end

            local binding = BuildKeyFromInput(key)
            if binding ~= "" then
                RIDE:SetSmartTravelBinding(binding)
                RIDE:StopBindingCapture(false)
            end
        end)

        frame:SetScript("OnMouseDown", function(_, button)
            local binding = BuildKeyFromInput(button)
            if binding ~= "" then
                RIDE:SetSmartTravelBinding(binding)
                RIDE:StopBindingCapture(false)
            end
        end)

        frame:SetScript("OnMouseWheel", function(_, delta)
            local binding = BuildKeyFromInput(delta and delta > 0 and "MOUSEWHEELUP" or "MOUSEWHEELDOWN")
            if binding ~= "" then
                RIDE:SetSmartTravelBinding(binding)
                RIDE:StopBindingCapture(false)
            end
        end)

        bindingCaptureFrame = frame
    end

    if bindingCaptureFrame.text then
        bindingCaptureFrame.text:SetText(L.KEYBIND_CAPTURE)
    end
    bindingCaptureFrame:Show()
end

function RIDE:UpdateSecureAction(silent)
    if InCombatLockdown and InCombatLockdown() then
        pendingSecureUpdate = true
        if not silent then
            Print(L.UPDATE_DEFERRED)
        end
        return
    end

    ClearInvalidSlotMounts()

    local macroText, actionText = BuildMacro()
    secureButton:SetAttribute("type", "macro")
    secureButton:SetAttribute("macrotext", macroText)
    lastMacroText = macroText
    lastActionText = actionText
    pendingSecureUpdate = nil

    self:RefreshOptions()

    if not silent then
        Print(L.UPDATED)
    end
end

function RIDE:ActivateFromBinding()
    secureButton:Click("LeftButton")
end

function RIDE:SetMount(kind, input)
    local name, itemID, link = NormalizeMountInput(input)
    if name == "" then
        return false
    end

    if not ValidateMountForSlot(kind, link or itemID or name, name) then
        return false
    end

    StoreMount(kind, name, itemID, link)
    self:UpdateSecureAction()

    if kind == "ground" then
        Print(string.format(L.SET_GROUND, name))
    else
        Print(string.format(L.SET_FLYING, name))
    end

    self:RefreshOptions()
    return true
end

function RIDE:SetMountFromCursor(kind)
    local cursorType, value1, value2 = GetCursorInfo()
    if cursorType ~= "item" then
        Print(L.NO_CURSOR_ITEM)
        return
    end

    local link = type(value1) == "string" and value1 or type(value2) == "string" and value2 or nil
    local itemID = tonumber(value1) or tonumber(value2) or ExtractItemID(link)
    local itemRef = link or itemID
    local name = GetItemInfo and GetItemInfo(itemRef) or ExtractItemName(link)
    if not name or name == "" then
        Print(L.NO_CURSOR_ITEM)
        return
    end

    if not ValidateMountForSlot(kind, itemRef, name) then
        return
    end

    StoreMount(kind, name, itemID, link or "")
    ClearCursor()
    self:UpdateSecureAction()

    if kind == "ground" then
        Print(string.format(L.SET_GROUND, name))
    else
        Print(string.format(L.SET_FLYING, name))
    end

    self:RefreshOptions()
end

function RIDE:ClearMount(kind)
    StoreMount(kind, "", nil, "")
    self:UpdateSecureAction()

    if kind == "ground" then
        Print(L.CLEARED_GROUND)
    else
        Print(L.CLEARED_FLYING)
    end

    self:RefreshOptions()
end

local function FormatMountStatus(mount)
    if not mount or not mount.name or mount.name == "" then
        return L.NOT_SET
    end

    local _, bagStatus = IsMountUsable(mount)
    return mount.name .. " (" .. bagStatus .. ")"
end

function RIDE:GetStatusText()
    local flyable = self:IsFlyableArea() and L.YES or L.NO
    local lines = {
        L.FLYABLE_AREA .. ": " .. flyable,
        L.KEYBIND .. ": " .. (GetSmartTravelKey() or L.NOT_SET),
        L.GROUND_MOUNT .. ": " .. FormatMountStatus(db.ground),
        L.FLYING_MOUNT .. ": " .. FormatMountStatus(db.flying),
        L.CURRENT_ACTION .. ": " .. (lastActionText or L.NO_ACTION),
    }

    if isDruid then
        lines[#lines + 1] = L.DRUID_AQUATIC .. ": " .. (db.useDruidAquatic and L.YES or L.NO)
        lines[#lines + 1] = L.DRUID_FLIGHT .. ": " .. (db.useDruidFlight and L.YES or L.NO)
        lines[#lines + 1] = L.DRUID_TRAVEL .. ": " .. (db.useDruidTravel and L.YES or L.NO)
    end

    if hasClassMounts and GetBestClassMountName() then
        lines[#lines + 1] = L.CLASS_MOUNT .. ": " .. GetBestClassMountName() .. " (" .. (db.useClassMount and L.YES or L.NO) .. ")"
    end

    return table.concat(lines, "\n")
end

function RIDE:PrintStatus()
    Print(L.STATUS)
    for line in string.gmatch(self:GetStatusText(), "[^\n]+") do
        Print(line)
    end
end

function CreateText(parent, text, template)
    local label = parent:CreateFontString(nil, "ARTWORK", template or "GameFontHighlight")
    label:SetText(text)
    label:SetJustifyH("LEFT")
    return label
end

function CreateButton(parent, text, width)
    local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    button:SetSize(width or 120, 24)
    button:SetText(text)
    return button
end

local optionCheckIndex = 0

local function CreateCheckbox(parent, text, tooltip, getter, setter, icon)
    optionCheckIndex = optionCheckIndex + 1
    local check = CreateFrame("CheckButton", "RIDEOptionCheck" .. optionCheckIndex, parent, "InterfaceOptionsCheckButtonTemplate")
    local label = check.Text or _G[check:GetName() .. "Text"]
    if label then
        label:SetText(text)
        check.label = label
        if icon then
            label:ClearAllPoints()
            label:SetPoint("LEFT", check, "RIGHT", 24, 0)
        end
    end

    if icon then
        local texture = check:CreateTexture(nil, "ARTWORK")
        texture:SetSize(18, 18)
        texture:SetPoint("LEFT", check, "RIGHT", 3, 0)
        texture:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        texture:SetTexture(icon)
        check.icon = texture
    end

    check.tooltipText = tooltip or text
    check:SetScript("OnClick", function(self)
        setter(self:GetChecked() and true or false)
        RIDE:UpdateSecureAction(true)
        RIDE:RefreshOptions()
    end)
    check.Refresh = function(self)
        self:SetChecked(getter() and true or false)
    end
    return check
end

local function SetSlotBackdrop(frame, filled)
    if not frame.SetBackdrop then
        return
    end

    frame:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false,
        edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    frame:SetBackdropColor(0, 0, 0, filled and 0.82 or 0.42)
    frame:SetBackdropBorderColor(filled and 0.85 or 0.45, filled and 0.72 or 0.45, filled and 0.35 or 0.45, 1)
end

local function RefreshMountSlot(slot)
    if not slot or not db then
        return
    end

    local mount = db[slot.rideMountKind]
    local hasMount = mount and mount.name and mount.name ~= ""
    local icon = hasMount and (mount.icon or GetItemTextureFromMount(mount.name, mount.itemID, mount.link))

    if hasMount and icon then
        slot.icon:SetTexture(icon)
        slot.icon:Show()
        slot.emptyText:Hide()
    else
        slot.icon:SetTexture(nil)
        slot.icon:Hide()
        slot.emptyText:Show()
    end

    SetSlotBackdrop(slot, hasMount)
end

local function CreateMountSlot(parent, kind)
    local ok, slot = pcall(CreateFrame, "Button", nil, parent, "BackdropTemplate")
    if not ok or not slot then
        slot = CreateFrame("Button", nil, parent)
    end

    slot.rideMountKind = kind
    slot:SetSize(54, 54)
    slot:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    slot:EnableMouse(true)

    local icon = slot:CreateTexture(nil, "ARTWORK")
    icon:SetPoint("TOPLEFT", slot, "TOPLEFT", 5, -5)
    icon:SetPoint("BOTTOMRIGHT", slot, "BOTTOMRIGHT", -5, 5)
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    slot.icon = icon

    local emptyText = slot:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    emptyText:SetPoint("CENTER", slot, "CENTER", 0, 0)
    emptyText:SetWidth(46)
    emptyText:SetJustifyH("CENTER")
    emptyText:SetText(L.SLOT_EMPTY)
    slot.emptyText = emptyText

    slot:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
            RIDE:ClearMount(self.rideMountKind)
            return
        end

        local cursorType = GetCursorInfo and GetCursorInfo()
        if cursorType == "item" then
            RIDE:SetMountFromCursor(self.rideMountKind)
        end
    end)

    slot:SetScript("OnReceiveDrag", function(self)
        RIDE:SetMountFromCursor(self.rideMountKind)
    end)

    slot:SetScript("OnEnter", function(self)
        local mount = db and db[self.rideMountKind]
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        if mount and mount.link and mount.link ~= "" then
            GameTooltip:SetHyperlink(mount.link)
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine(L.SLOT_HINT, 0.8, 0.8, 0.8, true)
        elseif mount and mount.name and mount.name ~= "" then
            GameTooltip:SetText(mount.name)
            GameTooltip:AddLine(L.SLOT_HINT, 0.8, 0.8, 0.8, true)
        else
            GameTooltip:SetText(L.SLOT_EMPTY)
            GameTooltip:AddLine(L.MOUNT_HINT, 0.8, 0.8, 0.8, true)
        end
        GameTooltip:Show()
    end)

    slot:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    RefreshMountSlot(slot)
    return slot
end

local function RefreshMountSlots()
    if not optionsPanel then
        return
    end

    RefreshMountSlot(optionsPanel.groundSlot)
    RefreshMountSlot(optionsPanel.flyingSlot)
end

local function CreateOptionsPanel()
    if optionsPanel then
        return optionsPanel
    end

    local panel = CreateFrame("Frame", "RIDEOptionsPanel", UIParent)
    panel.name = L.OPTIONS_TITLE

    local title = CreateText(panel, L.OPTIONS_TITLE, "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, -16)

    local desc = CreateText(panel, L.OPTIONS_DESC, "GameFontHighlightSmall")
    desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)

    local hint = CreateText(panel, L.MOUNT_HINT, "GameFontHighlightSmall")
    hint:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -14)
    hint:SetWidth(560)

    local slotHint = CreateText(panel, L.SLOT_HINT, "GameFontHighlightSmall")
    slotHint:SetPoint("TOPLEFT", hint, "BOTTOMLEFT", 0, -4)
    slotHint:SetWidth(560)

    local y = -104

    local groundLabel = CreateText(panel, L.GROUND_MOUNT, "GameFontNormal")
    groundLabel:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, y)

    local groundSlot = CreateMountSlot(panel, "ground")
    groundSlot:SetPoint("TOPLEFT", groundLabel, "BOTTOMLEFT", 0, -8)
    panel.groundSlot = groundSlot

    local flyingLabel = CreateText(panel, L.FLYING_MOUNT, "GameFontNormal")
    flyingLabel:SetPoint("TOPLEFT", groundLabel, "TOPLEFT", 110, 0)

    local flyingSlot = CreateMountSlot(panel, "flying")
    flyingSlot:SetPoint("TOPLEFT", flyingLabel, "BOTTOMLEFT", 0, -8)
    panel.flyingSlot = flyingSlot

    y = y - 88

    panel.druidAquatic = CreateCheckbox(panel, L.DRUID_AQUATIC, nil,
        function() return db.useDruidAquatic end,
        function(value) db.useDruidAquatic = value end,
        select(3, GetSpellInfo(DRUID_SPELLS.aquatic)))
    panel.druidAquatic:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, y)

    panel.druidFlight = CreateCheckbox(panel, L.DRUID_FLIGHT, nil,
        function() return db.useDruidFlight end,
        function(value) db.useDruidFlight = value end,
        select(3, GetSpellInfo(DRUID_SPELLS.flight)))
    panel.druidFlight:SetPoint("TOPLEFT", panel.druidAquatic, "BOTTOMLEFT", 0, -8)

    panel.druidTravel = CreateCheckbox(panel, L.DRUID_TRAVEL, nil,
        function() return db.useDruidTravel end,
        function(value) db.useDruidTravel = value end,
        select(3, GetSpellInfo(DRUID_SPELLS.travel)))
    panel.druidTravel:SetPoint("TOPLEFT", panel.druidFlight, "BOTTOMLEFT", 0, -8)

    panel.classMount = CreateCheckbox(panel, L.CLASS_MOUNT, nil,
        function() return db.useClassMount end,
        function(value) db.useClassMount = value end,
        GetClassMountIcon())
    panel.classMount:SetPoint("TOPLEFT", panel.druidTravel, "BOTTOMLEFT", 0, -8)

    panel.preventDismountFlying = CreateCheckbox(panel, L.PREVENT_FLYING_DISMOUNT, nil,
        function() return db.preventDismountFlying end,
        function(value) db.preventDismountFlying = value end,
        ICONS.preventDismount)
    panel.preventDismountFlying:SetPoint("TOPLEFT", panel.classMount, "BOTTOMLEFT", 0, -8)

    local bindingsButton = CreateButton(panel, L.SET_BINDING, 150)
    bindingsButton:SetPoint("TOPLEFT", panel.preventDismountFlying, "BOTTOMLEFT", 0, -20)
    bindingsButton:SetScript("OnClick", function()
        RIDE:StartBindingCapture()
    end)

    local clearBindingButton = CreateButton(panel, L.CLEAR_BINDING, 110)
    clearBindingButton:SetPoint("LEFT", bindingsButton, "RIGHT", 8, 0)
    clearBindingButton:SetScript("OnClick", function()
        RIDE:ClearSmartTravelBinding()
    end)

    local statusLabel = CreateText(panel, L.STATUS, "GameFontNormal")
    statusLabel:SetPoint("TOPLEFT", bindingsButton, "BOTTOMLEFT", 0, -24)

    local statusPanel = CreateFrame("Frame", nil, panel)
    statusPanel:SetPoint("TOPLEFT", statusLabel, "BOTTOMLEFT", 0, -8)
    statusPanel:SetSize(560, 160)
    panel.statusPanel = statusPanel

    for i = 1, 10 do
        local line = CreateText(statusPanel, "", "GameFontHighlight")
        line:SetPoint("TOPLEFT", statusPanel, "TOPLEFT", 0, -((i - 1) * 18))
        line:SetWidth(560)
        line:SetHeight(17)
        local font, _, flags = GameFontHighlight:GetFont()
        line:SetFont(font, 12, flags)
        statusLines[i] = line
    end

    optionsPanel = panel
    panel:SetScript("OnShow", function()
        RIDE:RefreshOptions()
    end)
    RIDE:RefreshOptions()
    return optionsPanel
end

local function RegisterInterfaceOptions()
    local panel = CreateOptionsPanel()

    if Settings and Settings.RegisterCanvasLayoutCategory and Settings.RegisterAddOnCategory then
        settingsCategory = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(settingsCategory)
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    end
end

local function DetachOptionsPanel()
    if not optionsPanel then
        return
    end

    optionsPanel:SetParent(UIParent)
    optionsPanel:ClearAllPoints()
    optionsPanel:Hide()
end

local function CreateStandaloneWindow()
    if standaloneWindow then
        return standaloneWindow
    end

    local ok, window = pcall(CreateFrame, "Frame", "RIDEConfigWindow", UIParent, "BasicFrameTemplateWithInset")
    if not ok or not window then
        ok, window = pcall(CreateFrame, "Frame", "RIDEConfigWindow", UIParent, "BackdropTemplate")
    end
    if not ok or not window then
        window = CreateFrame("Frame", "RIDEConfigWindow", UIParent)
    end

    window:SetSize(700, 610)
    window:SetPoint("CENTER")
    window:SetFrameStrata("FULLSCREEN_DIALOG")
    window:SetToplevel(true)
    window:EnableMouse(true)
    window:SetMovable(true)
    window:RegisterForDrag("LeftButton")
    window:SetScript("OnDragStart", window.StartMoving)
    window:SetScript("OnDragStop", window.StopMovingOrSizing)
    window:SetScript("OnHide", function()
        if optionsPanel and optionsPanel:GetParent() == window.content then
            DetachOptionsPanel()
        end
    end)
    window:Hide()

    if window.SetBackdrop then
        window:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true,
            tileSize = 32,
            edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 },
        })
        window:SetBackdropColor(0, 0, 0, 0.94)
        window:SetBackdropBorderColor(0.65, 0.55, 0.35, 1)
    end

    if UISpecialFrames then
        UISpecialFrames[#UISpecialFrames + 1] = "RIDEConfigWindow"
    end

    local title = CreateText(window, L.OPTIONS_TITLE, "GameFontHighlight")
    title:SetPoint("TOP", window, "TOP", 0, -6)

    local content = CreateFrame("Frame", nil, window)
    content:SetPoint("TOPLEFT", window, "TOPLEFT", 20, -38)
    content:SetPoint("BOTTOMRIGHT", window, "BOTTOMRIGHT", -20, 18)
    window.content = content

    standaloneWindow = window
    return standaloneWindow
end

function RIDE:RefreshOptions()
    if not optionsPanel or not db then
        return
    end

    RefreshMountSlots()

    if optionsPanel.druidForms then
        optionsPanel.druidForms:Refresh()
    end

    if optionsPanel.druidAquatic then
        local hasAquatic = isDruid and IsSpellKnownByID(DRUID_SPELLS.aquatic)
        local hasFlight = isDruid and (IsSpellKnownByID(DRUID_SPELLS.flight) or IsSpellKnownByID(DRUID_SPELLS.swiftFlight))
        local hasTravel = isDruid and IsSpellKnownByID(DRUID_SPELLS.travel)

        optionsPanel.druidAquatic:Refresh()
        optionsPanel.druidFlight:Refresh()
        optionsPanel.druidTravel:Refresh()

        if isDruid then
            optionsPanel.druidAquatic:Show()
            optionsPanel.druidFlight:Show()
            optionsPanel.druidTravel:Show()
        else
            optionsPanel.druidAquatic:Hide()
            optionsPanel.druidFlight:Hide()
            optionsPanel.druidTravel:Hide()
        end
        optionsPanel.druidAquatic:SetEnabled(hasAquatic and true or false)
        optionsPanel.druidFlight:SetEnabled(hasFlight and true or false)
        optionsPanel.druidTravel:SetEnabled(hasTravel and true or false)
        if optionsPanel.druidAquatic.icon then
            optionsPanel.druidAquatic.icon:SetAlpha(hasAquatic and 1 or 0.35)
        end
        if optionsPanel.druidFlight.icon then
            optionsPanel.druidFlight.icon:SetAlpha(hasFlight and 1 or 0.35)
        end
        if optionsPanel.druidTravel.icon then
            optionsPanel.druidTravel.icon:SetAlpha(hasTravel and 1 or 0.35)
        end

        if optionsPanel.druidAquatic.label then
            optionsPanel.druidAquatic.label:SetTextColor(hasAquatic and 1 or 0.55, hasAquatic and 0.82 or 0.55, hasAquatic and 0 or 0.55)
        end
        if optionsPanel.druidFlight.label then
            optionsPanel.druidFlight.label:SetTextColor(hasFlight and 1 or 0.55, hasFlight and 0.82 or 0.55, hasFlight and 0 or 0.55)
        end
        if optionsPanel.druidTravel.label then
            optionsPanel.druidTravel.label:SetTextColor(hasTravel and 1 or 0.55, hasTravel and 0.82 or 0.55, hasTravel and 0 or 0.55)
        end
    end

    if optionsPanel.classMount then
        local classMountName = GetBestClassMountName()
        local hasClassMount = hasClassMounts and classMountName

        optionsPanel.classMount:Refresh()
        if hasClassMount then
            optionsPanel.classMount:Show()
            optionsPanel.classMount:SetEnabled(true)
            optionsPanel.classMount:ClearAllPoints()
            if isDruid then
                optionsPanel.classMount:SetPoint("TOPLEFT", optionsPanel.druidTravel, "BOTTOMLEFT", 0, -8)
            else
                optionsPanel.classMount:SetPoint("TOPLEFT", optionsPanel.groundSlot, "BOTTOMLEFT", 0, -24)
            end
        else
            optionsPanel.classMount:Hide()
            optionsPanel.classMount:SetEnabled(false)
        end
        if optionsPanel.classMount.icon then
            optionsPanel.classMount.icon:SetTexture(GetClassMountIcon())
            optionsPanel.classMount.icon:SetAlpha(hasClassMount and 1 or 0.35)
        end
        if optionsPanel.classMount.label then
            optionsPanel.classMount.label:SetTextColor(hasClassMount and 1 or 0.55, hasClassMount and 0.82 or 0.55, hasClassMount and 0 or 0.55)
        end
    end

    if optionsPanel.preventDismountFlying then
        optionsPanel.preventDismountFlying:ClearAllPoints()
        if optionsPanel.classMount and optionsPanel.classMount:IsShown() then
            optionsPanel.preventDismountFlying:SetPoint("TOPLEFT", optionsPanel.classMount, "BOTTOMLEFT", 0, -8)
        elseif isDruid then
            optionsPanel.preventDismountFlying:SetPoint("TOPLEFT", optionsPanel.druidTravel, "BOTTOMLEFT", 0, -8)
        else
            optionsPanel.preventDismountFlying:SetPoint("TOPLEFT", optionsPanel.groundSlot, "BOTTOMLEFT", 0, -24)
        end
        optionsPanel.preventDismountFlying:Refresh()
    end

    if statusLines[1] then
        local index = 1
        for line in string.gmatch(self:GetStatusText(), "[^\n]+") do
            if statusLines[index] then
                statusLines[index]:SetText(line)
                statusLines[index]:Show()
            end
            index = index + 1
        end

        while statusLines[index] do
            statusLines[index]:SetText("")
            statusLines[index]:Hide()
            index = index + 1
        end
    end
end

function RIDE:OpenOptions()
    CreateOptionsPanel()
    self:RefreshOptions()

    local window = CreateStandaloneWindow()
    optionsPanel:SetParent(window.content)
    optionsPanel:ClearAllPoints()
    optionsPanel:SetPoint("TOPLEFT", window.content, "TOPLEFT", 0, 0)
    optionsPanel:SetSize(640, 540)
    optionsPanel:Show()
    window:Show()
    window:Raise()
end

function RIDE:OpenInterfaceOptions()
    CreateOptionsPanel()
    if standaloneWindow and standaloneWindow:IsShown() then
        standaloneWindow:Hide()
    elseif standaloneWindow and optionsPanel:GetParent() == standaloneWindow.content then
        DetachOptionsPanel()
    end
    optionsPanel:SetParent(UIParent)
    optionsPanel:ClearAllPoints()
    optionsPanel:Show()
    self:RefreshOptions()

    if Settings and Settings.OpenToCategory and settingsCategory then
        local id = settingsCategory.GetID and settingsCategory:GetID() or settingsCategory.ID or settingsCategory
        Settings.OpenToCategory(id)
    elseif InterfaceOptionsFrame_OpenToCategory then
        InterfaceOptionsFrame_OpenToCategory(optionsPanel)
        InterfaceOptionsFrame_OpenToCategory(optionsPanel)
    end
end

local function PrintHelp()
    Print(L.HELP_HEADER)
    Print(L.HELP_OPEN)
    Print(L.HELP_STATUS)
    Print(L.HELP_GROUND)
    Print(L.HELP_FLYING)
    Print(L.HELP_CURSOR)
    Print(L.HELP_CLEAR)
    Print(L.HELP_DRUID)
    Print(L.HELP_CLASS_MOUNT)
    Print(L.HELP_BIND)
    Print(L.HELP_UNBIND)
    Print(L.HELP_UPDATE)
end

local function ParseCommand(msg)
    msg = Trim(msg)
    local command, rest = msg:match("^(%S+)%s*(.*)$")
    command = command and string.lower(command) or ""
    rest = Trim(rest)
    return command, rest
end

function RIDE:HandleSlash(msg)
    local command, rest = ParseCommand(msg)

    if command == "" or command == "config" or command == "options" then
        self:OpenOptions()
    elseif command == "help" then
        PrintHelp()
    elseif command == "status" then
        self:PrintStatus()
    elseif command == "ground" then
        if rest == "" then
            self:SetMountFromCursor("ground")
        else
            self:SetMount("ground", rest)
        end
    elseif command == "flying" or command == "fly" then
        if rest == "" then
            self:SetMountFromCursor("flying")
        else
            self:SetMount("flying", rest)
        end
    elseif command == "clear" then
        rest = string.lower(rest)
        if rest == "ground" then
            self:ClearMount("ground")
        elseif rest == "flying" or rest == "fly" then
            self:ClearMount("flying")
        else
            Print(L.HELP_CLEAR)
        end
    elseif command == "druid" then
        local enabled = not (db.useDruidAquatic or db.useDruidFlight or db.useDruidTravel)
        db.useDruidAquatic = enabled
        db.useDruidFlight = enabled
        db.useDruidTravel = enabled
        self:UpdateSecureAction()
        Print(enabled and L.DRUID_ON or L.DRUID_OFF)
    elseif command == "classmount" or command == "class" then
        if hasClassMounts and GetBestClassMountName() then
            db.useClassMount = not db.useClassMount
            self:UpdateSecureAction()
            Print(db.useClassMount and L.CLASS_MOUNT_ON or L.CLASS_MOUNT_OFF)
        else
            Print(L.NO_ACTION)
        end
    elseif command == "bind" then
        if rest == "" then
            self:StartBindingCapture()
        else
            self:SetSmartTravelBinding(rest)
        end
    elseif command == "unbind" then
        self:ClearSmartTravelBinding()
    elseif command == "update" or command == "refresh" then
        self:UpdateSecureAction()
    else
        PrintHelp()
    end
end

local function RegisterSlashCommands()
    SLASH_RIDE1 = "/ride"
    SlashCmdList.RIDE = function(msg)
        RIDE:HandleSlash(msg)
    end
end

RIDE:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
        EnsureDb()
        ClearInvalidSlotMounts()
        UpdatePlayerClass()
        RegisterSlashCommands()
        RegisterInterfaceOptions()
        self:UpdateSecureAction(true)
        self:ApplyVisibleBindingOverride()
        Print(L.LOADED)
    elseif event == "PLAYER_LOGIN" then
        UpdatePlayerClass()
        self:UpdateSecureAction(true)
        self:ApplyVisibleBindingOverride()
    elseif event == "PLAYER_REGEN_ENABLED" then
        if pendingSecureUpdate then
            self:UpdateSecureAction(true)
        end
        if pendingBindingOverride then
            self:ApplyVisibleBindingOverride()
        end
    elseif event == "PLAYER_ENTERING_WORLD"
        or event == "ZONE_CHANGED"
        or event == "ZONE_CHANGED_NEW_AREA"
        or event == "ZONE_CHANGED_INDOORS"
        or event == "LEARNED_SPELL_IN_TAB"
        or event == "SPELLS_CHANGED"
        or event == "BAG_UPDATE_DELAYED" then
        if event == "LEARNED_SPELL_IN_TAB" or event == "SPELLS_CHANGED" then
            UpdatePlayerClass()
        end
        self:UpdateSecureAction(true)
        self:RefreshOptions()
    elseif event == "UPDATE_BINDINGS" then
        self:ApplyVisibleBindingOverride()
        self:RefreshOptions()
    end
end)

local function RegisterEventIfValid(frame, event)
    if C_EventUtils and C_EventUtils.IsEventValid and not C_EventUtils.IsEventValid(event) then
        return
    end
    frame:RegisterEvent(event)
end

RegisterEventIfValid(RIDE, "ADDON_LOADED")
RegisterEventIfValid(RIDE, "PLAYER_LOGIN")
RegisterEventIfValid(RIDE, "PLAYER_ENTERING_WORLD")
RegisterEventIfValid(RIDE, "ZONE_CHANGED")
RegisterEventIfValid(RIDE, "ZONE_CHANGED_NEW_AREA")
RegisterEventIfValid(RIDE, "ZONE_CHANGED_INDOORS")
RegisterEventIfValid(RIDE, "PLAYER_REGEN_ENABLED")
RegisterEventIfValid(RIDE, "LEARNED_SPELL_IN_TAB")
RegisterEventIfValid(RIDE, "SPELLS_CHANGED")
RegisterEventIfValid(RIDE, "BAG_UPDATE_DELAYED")
RegisterEventIfValid(RIDE, "UPDATE_BINDINGS")
