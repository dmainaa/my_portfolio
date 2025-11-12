import 'package:portfolio_components/portfolio_components.dart';

const sampleResume = PFResume(
  name: 'Denis Maina',
  title: 'Mobile Application Developer',
  email: 'dmainaofficial@gmail.com',
  phone: '+254790090073',
  location: 'Nairobi, Kenya',
  website: 'https://portfolio-d9f60.web.app/',
  summary:
      'Passionate mobile developer with over 5 years of experience creating responsive, user-friendly mobile applications. Specialized in Flutter and Dart, crafting seamless user experiences across platforms with a strong focus on modern design principles and best practices.',
  workExperience: [
    PFWorkExperience(
      position: 'Lead Mobile Engineer',
      company: 'Aliensoft Technologies',
      period: '2022 - Present',
      description:
          'Leads mobile development for enterprise clients, architecting scalable Flutter applications and mentoring junior developers.',
      achievements: [
        'Reduced load times by 40% through code optimization',
        'Implemented CI/CD pipeline reducing deployment time by 60%',
        'Led team of 5 developers across 3 major client projects',
        'Manage the deployment and maintenance of mobile applications on both PlayStore and AppStore',

      ],
    ),
    PFWorkExperience(
      position: 'Mobile Developer',
      company: 'Digital Innovations Ltd.',
      period: '2019 - 2021',
      description:
          'Developed and maintained multiple mobile applications for iOS and Android platforms using Flutter and native technologies.',
      achievements: [
        'Built 10+ production apps with 500K+ total downloads',
        'Implemented real-time features using Firebase',
        'Improved app performance by 35% through optimization',
      ],
    ),
    PFWorkExperience(
      position: 'Junior Mobile Developer',
      company: 'DirectCore Technologies',
      period: '2018 - 2019',
      description:
          'Contributed to mobile app development projects and learned modern development practices.',
      achievements: [
        '',
        'Developed key features for 5 mobile applications',
        'Collaborated with design team to implement UI/UX',
        'Participated in code reviews and agile ceremonies',
      ],
    ),
  ],
  education: [
    PFEducation(
      degree: 'Bachelor of Science in Computer Technology',
      institution: 'Meru University of Science and Technology',
      period: '2014 - 2019',
      description: 'Focus on Software Engineering',
    ),
  ],
  skills: [
    'Flutter',
    'Dart',
    'Firebase',
    'REST APIs',
    'State Management',
    'Git',
    'Agile/Scrum',
    'UI/UX Design',
    'Java',
    'Kotlin',
    'Swift',
    'React Native',
    'Node.js',
    'MongoDB',
    'GraphQL',
  ],
);
