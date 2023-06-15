import 'package:get/route_manager.dart';

// 다중언어 등록
class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': {
          'find_pass': '비밀번호 찾기',
          'sing_up': '회원가입',
          'log_in': '로그인',
          'infomation_email': '가입하신 이메일 주소를 입력해 주시면 임시 비밀번호를 메일로 보내드리겠습니다.',
        },
        'en_US': {
          'find_pass': 'Forget Password',
          'sing_up': 'Sign Up',
          'log_in': 'Sign In',
          'infomation_email':
              'Enter your registered email address and we will send you a temporary password via email.',
        }
      };
}
