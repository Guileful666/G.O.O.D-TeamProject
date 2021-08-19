package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.model.UserTrafficLog;
import study.spring.goodspring.service.UserTrafficLogService;

@Service
@Slf4j
public class UserTrafficLogServiceImpl implements UserTrafficLogService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void pageIn(UserTrafficLog input) throws Exception {
		int result = 0;
		try {

			result = sqlSession.insert("UserTrafficLogMapper.pageIn", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new RuntimeException("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void pageOut(UserTrafficLog input) throws Exception {
		try {

			sqlSession.insert("UserTrafficLogMapper.pageOut", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void enterBrowser(UserTrafficLog input) throws Exception {
		try {

			sqlSession.insert("UserTrafficLogMapper.enterBrowser", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void addBookmark(UserTrafficLog input) throws Exception {
		try {

			sqlSession.insert("UserTrafficLogMapper.addBookmark", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void removeBookmark(UserTrafficLog input) throws Exception {
		try {

			sqlSession.insert("UserTrafficLogMapper.removeBookmark", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void walkRecordStart(UserTrafficLog input) throws Exception {
		try {

			sqlSession.insert("UserTrafficLogMapper.walkRecordStart", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}
	@Override
	public void walkRecordEnd(UserTrafficLog input) throws Exception {
		try {

			sqlSession.insert("UserTrafficLogMapper.walkRecordEnd", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void casExLink(UserTrafficLog input) throws Exception {
		try {

			sqlSession.insert("UserTrafficLogMapper.casExLink", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void walkExLink(UserTrafficLog input) throws Exception {
		try {

			sqlSession.insert("UserTrafficLogMapper.walkExLink", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void userLogin(UserTrafficLog input) throws Exception {
		int result = 0;
		try {

			result=sqlSession.insert("UserTrafficLogMapper.userLogin", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void userLogout(UserTrafficLog input) throws Exception {
		int result = 0;
		try {

			result=sqlSession.insert("UserTrafficLogMapper.userLogout", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void addKeyword(UserTrafficLog input) throws Exception {
		int result = 0;
		try {
			result=sqlSession.insert("UserTrafficLogMapper.keyword", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new RuntimeException("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public int login_count(UserTrafficLog input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserTrafficLogMapper.logincount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<UserTrafficLog> loginHourCount(UserTrafficLog input) throws Exception {
		List<UserTrafficLog> result = null;

		try {
			result = sqlSession.selectList("UserTrafficLogMapper.loginHourCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<UserTrafficLog> loginCountInterval(UserTrafficLog input) throws Exception {
		List<UserTrafficLog> result = null;

		try {
			result = sqlSession.selectList("UserTrafficLogMapper.loginCountInterval", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	
	@Override
	public int join_count(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserTrafficLogMapper.joincount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<UserTrafficLog> joinHourCount(UserTrafficLog input) throws Exception {
		List<UserTrafficLog> result = null;

		try {
			result = sqlSession.selectList("UserTrafficLogMapper.joinHourCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public UserTrafficLog TopSearchKeyword(UserTrafficLog input) throws Exception {
		UserTrafficLog result = null;

		try {
			result = sqlSession.selectOne("UserTrafficLogMapper.TopSearchKeyword", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<UserTrafficLog> Top10SearchKeyword(UserTrafficLog input) throws Exception {
		List<UserTrafficLog> result = null;

		try {
			result = sqlSession.selectList("UserTrafficLogMapper.Top10SearchKeyword", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	@Override
	public int AddBookMarkCount(UserTrafficLog input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserTrafficLogMapper.AddBookMarkCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<UserTrafficLog> AddBookMarkHourCount(UserTrafficLog input) throws Exception {
		List<UserTrafficLog> result = null;

		try {
			result = sqlSession.selectList("UserTrafficLogMapper.AddBookMarkHourCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int ExLinkCount(UserTrafficLog input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserTrafficLogMapper.ExLinkCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<UserTrafficLog> ExLinkHourCount(UserTrafficLog input) throws Exception {
		List<UserTrafficLog> result = null;

		try {
			result = sqlSession.selectList("UserTrafficLogMapper.ExLinkHourCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public int RecordCount(UserTrafficLog input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserTrafficLogMapper.RecordCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<UserTrafficLog> RecordHourCount(UserTrafficLog input) throws Exception {
		List<UserTrafficLog> result = null;

		try {
			result = sqlSession.selectList("UserTrafficLogMapper.RecordHourCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int MakeLogMapCount(UserTrafficLog input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserTrafficLogMapper.MakeLogMapCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<UserTrafficLog> MakeLogMapHourCount(UserTrafficLog input) throws Exception {
		List<UserTrafficLog> result = null;

		try {
			result = sqlSession.selectList("UserTrafficLogMapper.MakeLogMapHourCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
}
