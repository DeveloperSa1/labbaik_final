enum UserType {
  admin,
  guardian,
  teacher,
  specialest,
  undefiend,
}

class UserTypeHelper {
  static String getCollectionValue(UserType uType) {
     String collection = '';

    switch (uType) {
      case UserType.admin:
        return collection = 'admin';
      case UserType.guardian:
        return collection = 'guardians';
      case UserType.specialest:
        return collection = 'specialests';
      case UserType.teacher:
        return collection = 'teachers';
      case UserType.undefiend:
        return collection = 'undefiend';
      default:
    }  
      return collection;

  }
  // ['طالب', 'إخصائية', 'معلمة'],

   static UserType convert(String uType) {
     UserType collection = UserType.undefiend;
    switch (uType) {
      case 'طالب':
        return collection = UserType.guardian ;
      case  'إخصائية':
      return collection = UserType.specialest; 
      case  'معلمة':
      return collection = UserType.teacher; 
      case  'ولي امر':
      return collection = UserType.guardian; 
     
      
      
      default: 
    }  
      return collection;

  }
  
   static UserType convertTouType(String uType) {
     UserType collection = UserType.undefiend;
    switch (uType) {
      case 'admin':
        return collection = UserType.admin ;
      case  'specialests':
      return collection = UserType.specialest; 
      case  'teachers':
      return collection = UserType.teacher; 
      case  'guardians':
      return collection = UserType.guardian; 
     
      
      
      default: 
    }  
      return collection;

  }

   static String getChoosenAccountTitle(UserType uType) {
     String collection = '';

    switch (uType) {
      case UserType.admin:
        return collection = 'حساب الإدارة';
      case UserType.guardian:
        return collection = 'حساب اولياء الأمور';
      case UserType.specialest:
        return collection = 'حساب فريق العمل';
      case UserType.teacher:
        return collection = 'حساب فريق العمل';
      case UserType.undefiend:
        return collection = 'undefiend';
        
      default:
    }  
      return collection;

  }
}
