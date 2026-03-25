import 'package:cv_flutter/models/profiles/info_profile_model.dart';
import 'package:cv_flutter/models/profiles/profile_model.dart';

/// ONLY FOR TESTING IN LOCAL
class DataResources {
  /// Profile list
  static List<ProfileModel> listProfile = <ProfileModel>[
    // information
    ProfileModel(
      title: "Information",
      detail: "Développeur d'applications mobiles et d'interface",
      fillSpace: true,
      listInfoProfile: <InfoProfileModel>[
        InfoProfileModel(title: "Résidence", text: "91120, Palaiseau"),
        InfoProfileModel(
          title: "Profil",
          text: "Créatif, curieux, Altruiste, Passionné",
        ),
      ],
    ),
    // contact
    ProfileModel(
      title: "Contact",
      listInfoProfile: <InfoProfileModel>[
        InfoProfileModel(
          title: "Mail",
          text: "florent59120@gmail.com",
          urlLink: "mailto:florent59120@gmail.com",
        ),
        InfoProfileModel(title: "Téléphone", text: "0636830715"),
      ],
    ),
    // network
    ProfileModel(
      title: "Réseaux",
      listInfoProfile: <InfoProfileModel>[
        InfoProfileModel(
          title: "LinkedIn",
          text: "Voir le profil",
          urlLink: "https://www.linkedin.com/in/florent-rousselle-bb843915b/",
          icon: "linkedin",
        ),
        InfoProfileModel(
          title: "Facebook",
          text: "Voir le profil",
          urlLink: "https://www.facebook.com/share/18DeyhzYEL/",
          icon: "facebook",
        ),
      ],
    ),
    // hobbies
    ProfileModel(
      title: "Hobbies",
      centerInfo: true,
      listInfoProfile: <InfoProfileModel>[
        InfoProfileModel(text: "Les jeux de sociétés"),
        InfoProfileModel(text: "Le design d'interface"),
        InfoProfileModel(text: "Les jeux vidéos indépendants"),
        InfoProfileModel(text: "Le vélo"),
      ],
    ),
    // language
    ProfileModel(
      title: "Langue",
      listInfoProfile: <InfoProfileModel>[
        InfoProfileModel(
          title: "Anglais technique informatique",
          text: "Bon niveau",
        ),
      ],
    ),
  ];
}
