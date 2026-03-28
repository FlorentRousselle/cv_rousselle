import 'package:cv_flutter/models/educations/education_model.dart';
import 'package:cv_flutter/models/experiences/experience_model.dart';
import 'package:cv_flutter/models/experiences/experience_info_model.dart';
import 'package:cv_flutter/models/profiles/profile_info_model.dart';
import 'package:cv_flutter/models/profiles/profile_model.dart';
import 'package:cv_flutter/models/projects/project_model.dart';
import 'package:cv_flutter/models/skills/skill_model.dart';
import 'package:cv_flutter/resources/image_resources.dart';

/// ONLY FOR TESTING IN LOCAL
class DataResources {
  /// Profile list
  static List<ProfileModel> listProfile = <ProfileModel>[
    // information
    ProfileModel(
      title: "Information",
      detail: "Développeur d'applications mobiles et d'interface",
      fillSpace: true,
      listProfileInfo: <ProfileInfoModel>[
        ProfileInfoModel(title: "Résidence", text: "91120, Palaiseau"),
        ProfileInfoModel(
          title: "Profil",
          text: "Créatif, curieux, Altruiste, Passionné",
        ),
      ],
    ),
    // contact
    ProfileModel(
      title: "Contact",
      listProfileInfo: <ProfileInfoModel>[
        ProfileInfoModel(
          title: "Mail",
          text: "florent59120@gmail.com",
          urlLink: "mailto:florent59120@gmail.com",
        ),
        ProfileInfoModel(title: "Téléphone", text: "0636830715"),
      ],
    ),
    // network
    ProfileModel(
      title: "Réseaux",
      listProfileInfo: <ProfileInfoModel>[
        ProfileInfoModel(
          title: "LinkedIn",
          text: "Voir le profil",
          urlLink: "https://www.linkedin.com/in/florent-rousselle-bb843915b/",
          imageLink: ImageResources.linkedin,
        ),
        ProfileInfoModel(
          title: "Facebook",
          text: "Voir le profil",
          urlLink: "https://www.facebook.com/share/18DeyhzYEL/",
          imageLink: ImageResources.facebook,
        ),
      ],
    ),
    // hobbies
    ProfileModel(
      title: "Hobbies",
      centerInfo: true,
      listProfileInfo: <ProfileInfoModel>[
        ProfileInfoModel(text: "Les jeux de sociétés"),
        ProfileInfoModel(text: "Le design d'interface"),
        ProfileInfoModel(text: "Les jeux vidéos indépendants"),
        ProfileInfoModel(text: "Le vélo"),
      ],
    ),
    // language
    ProfileModel(
      title: "Langue",
      listProfileInfo: <ProfileInfoModel>[
        ProfileInfoModel(
          title: "Anglais technique informatique",
          text: "Bon niveau",
        ),
      ],
    ),
  ];

  /// experience list
  static List<ExperienceModel> listExperience = <ExperienceModel>[
    // ssisoft 2022 - 2026
    ExperienceModel(
      title: "Développeur d’application mobile et UI designer",
      location: "SSI-Soft, à Massy (91120)",
      startYear: 2022,
      endYear: 2026,
      companyImage: ImageResources.ssisoftLogo,
      listActivity: [
        "Développement de plusieurs applications mobiles avec le framework Flutter, maintenance des applications et mise à jour sur les dernières versions iOS et Android",
        "Mise en place d’outil de qualimétrie (Sonarqube, GoCD)",
        "Création d’interface avec Figma pour chaque application mobile, création de charte graphique pour l’entreprise",
        "Management d’une équipe de développeur mobile",
      ],
      listExperienceInfo: [
        ExperienceInfoModel(
          title: "Mon SSI Facile",
          description:
              "Application mobile permettant de reçevoir par notification les évènements d’un système de sécurité incendie",
          imageLink: ImageResources.monSsiFacile,
          urlLink:
              "https://play.google.com/store/apps/details?id=com.ssisoft.myeasyfas",
        ),
        ExperienceInfoModel(
          title: "My Beam",
          description:
              "Application d’appairage bluetooth pour détecteur de fumée linéaires",
          imageLink: ImageResources.myBeam,
          urlLink:
              "https://play.google.com/store/apps/details?id=com.detectomat.app.mira",
        ),
        ExperienceInfoModel(
          title: "SHDQR",
          description: "Application d'appairage de détecteurs avec un QR Code",
          imageLink: ImageResources.shd,
          urlLink:
              "https://play.google.com/store/apps/details?id=com.shd.shdqr",
        ),
        ExperienceInfoModel(
          title: "D-Loop",
          description:
              "Application d'appairage de détecteurs avec un QR Code avec différent mode de fonctionnement",
          imageLink: ImageResources.dloop,
          urlLink:
              "https://play.google.com/store/apps/details?id=com.detectomat.dloop",
        ),
      ],
    ),
    // coopere (2022 - 2023)
    ExperienceModel(
      title: "Développeur d’application mobile",
      location: "Coop-ère, à Massy (91120)",
      startYear: 2022,
      endYear: 2023,
      companyImage: ImageResources.coopere,
      listActivity: [
        "Intervention en tant qu’auto-entrepreneur sur la solution multi-plateforme Coop-ère en Flutter",
        "Développement d’interface sous Flutter et gestion du Git",
      ],
      listExperienceInfo: [
        ExperienceInfoModel(
          title: "Coop-ère",
          description:
              "Application associatif pour créer un réseau de quartier permettant d’échanger, s’entraider, créer des projets...",
          imageLink: ImageResources.coopereApp,
          urlLink:
              "https://play.google.com/store/apps/details?id=fr.coopere.dev",
        ),
      ],
    ),
    // ssisoft (2020-2022)
    ExperienceModel(
      title: "Développeur logiciel en alternance",
      location: "SSI-Soft, à Massy (91120)",
      startYear: 2020,
      endYear: 2022,
      companyImage: ImageResources.ssisoftLogo,
      listActivity: [
        "Développement d’application mobile avec Xamarin",
        "Design d’application avec Figma",
        "Développement d’un simulateur de communication MQTT avec Flutter",
      ],
    ),
    // dbcall (2018-2019)
    ExperienceModel(
      title: "Développeur full stack à temps plein",
      location: "DBCall, à Roubaix (59100)",
      startYear: 2018,
      endYear: 2019,
      companyImage: ImageResources.dbcall,
      listActivity: [
        "Développement d’une application mobile avec le framework Flutter",
        "Développement d’un serveur sous Java",
      ],
      listExperienceInfo: [
        ExperienceInfoModel(
          title: "Dispatch mobile",
          description:
              "Application pour consulter les demandes de dépannage pour les techniciens incendies",
          imageLink: ImageResources.dbcallApp,
          urlLink:
              "https://play.google.com/store/apps/details?id=io.wyattapp.dbcall.dispatch",
        ),
      ],
    ),
  ];

  /// project list
  static List<ProjectModel> listProject = <ProjectModel>[
    ProjectModel(
      title: "Création de jeu de société",
      imageLink: ImageResources.emulife,
      listDetail: <String>[
        "Création d’un jeu de société qui fonctionne par principe de combinaisons de cartes",
        "Participation à des événements pour présentation de prototype de mon jeu",
        "Création entièrement faite à la main, impression des cartes et design",
      ],
    ),
    ProjectModel(
      title: "Loup garou local",
      imageLink: ImageResources.loupGarouLocal,
      urlLink:
          "https://play.google.com/store/apps/details?id=flowster.loup_garou_mobile",
      listDetail: <String>[
        "Application du jeu de loup garou gratuit pour jouer sur téléphone ",
        "Utilisation de Firebase et des bases de données en temps réel pour communication",
      ],
    ),
    ProjectModel(
      title: "Landing page - Sapeurs pompiers",
      imageLink: ImageResources.sapeursPompiers,
      urlLink: "https://sdwsapeur.web.app/#/",
      listDetail: <String>[
        "Site web réalisé pour un projet scolaire pour mettre en avant les sapeurs pompiers",
        "Site réalisé sous Flutter et hébergé sur Firebase",
      ],
    ),
  ];

  /// skill list
  static List<SkillModel> listSkill = <SkillModel>[
    SkillModel(
      title: "Kotlin",
      rating: 4,
      imageLink: ImageResources.kotlin,
      category: "Langage et framework",
    ),
    SkillModel(
      title: "Xamarin",
      rating: 4,
      imageLink: ImageResources.xamarin,
      category: "Langage et framework",
    ),
    SkillModel(
      title: "Java",
      rating: 4,
      imageLink: ImageResources.java,
      category: "Langage et framework",
    ),
    SkillModel(
      title: ".NET MAUI",
      rating: 4,
      imageLink: ImageResources.maui,
      category: "Langage et framework",
    ),
    SkillModel(
      title: "Swift",
      rating: 3,
      imageLink: ImageResources.swift,
      category: "Langage et framework",
    ),
    SkillModel(
      title: "React Native",
      rating: 3,
      imageLink: ImageResources.react,
      category: "Langage et framework",
    ),
    SkillModel(
      title: "Flutter",
      rating: 5,
      imageLink: ImageResources.flutter,
      category: "Langage et framework",
    ),
    SkillModel(
      title: "Figma",
      rating: 5,
      imageLink: ImageResources.figma,
      category: "Stack technique",
    ),
    SkillModel(
      title: "Firebase",
      rating: 4,
      imageLink: ImageResources.firebase,
      category: "Stack technique",
    ),
    SkillModel(
      title: "Git",
      rating: 4,
      imageLink: ImageResources.git,
      category: "Stack technique",
    ),
  ];

  /// education list
  static List<EducationModel> listEducation = <EducationModel>[
    // Supdeweb - master (2022)
    EducationModel(
      title: "Master développement mobile",
      location: "Supdeweb, Paris (75016)",
      year: 2022,
      schoolImage: ImageResources.supdeweb,
      listActivity: [
        "Manager en stratégie et développement de projet digital",
        "Diplôme sur 2 ans",
        "Développement d’application mobile (Android, iOS, Multi-plateforme), UX Design, IOT, marketing informatique",
      ],
    ),
    // IUT, Lens - licence pro (2018)
    EducationModel(
      title: "Lience professionnelle, D.I.O.C",
      location: "IUT, Lens (62300)",
      year: 2020,
      schoolImage: ImageResources.iutLens,
      listActivity: [
        "Licence professionnelle, métiers de l’informatique conception, développement et test de logiciels",
        "Diplôme sur 1 an",
        "Développement d’applications web, bases de données, cybersécurité, Gestion de projet",
      ],
    ),
    // IUT A, Lille - D.U.T Informatique (2018)
    EducationModel(
      title: "D.U.T Informatique",
      location: "IUT A, Lille (59120)",
      year: 2018,
      schoolImage: ImageResources.iutLille,
      listActivity: [
        "Diplôme universitaire technologique, spécialité informatique",
        "Diplôme sur 2 ans",
        "Algorithmique et programmation, architecture système et Conception",
      ],
    ),
  ];
}
