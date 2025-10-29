import 'package:portfolio_components/portfolio_components.dart';

const sampleResume = PFResume(
  name: 'Denis Maina',
  title: 'Mobile Application Developer',
  email: 'hello@denismaina.com',
  phone: '+1 (123) 456-7890',
  location: 'Nairobi, Kenya',
  website: 'denismaina.portfolio',
  summary:
      'Passionate mobile developer with over 5 years of experience creating responsive, user-friendly mobile applications. Specialized in Flutter and Dart, crafting seamless user experiences across platforms with a strong focus on modern design principles and best practices.',
  workExperience: [
    PFWorkExperience(
      position: 'Senior Mobile Developer',
      company: 'Tech Solutions Inc.',
      period: '2021 - Present',
      description:
          'Lead mobile development for enterprise clients, architecting scalable Flutter applications and mentoring junior developers.',
      achievements: [
        'Reduced load times by 40% through code optimization',
        'Implemented CI/CD pipeline reducing deployment time by 60%',
        'Led team of 5 developers across 3 major client projects',
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
      company: 'StartUp Studio',
      period: '2018 - 2019',
      description:
          'Contributed to mobile app development projects and learned modern development practices.',
      achievements: [
        'Developed key features for 5 mobile applications',
        'Collaborated with design team to implement UI/UX',
        'Participated in code reviews and agile ceremonies',
      ],
    ),
  ],
  education: [
    PFEducation(
      degree: 'Bachelor of Science in Computer Science',
      institution: 'University of Nairobi',
      period: '2014 - 2018',
      description: 'Focus on Software Engineering and Mobile Development',
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
