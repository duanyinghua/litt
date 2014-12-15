package litt.main.dao;

import java.util.List;
import java.util.Map;

import litt.main.tool.LittCondition;
import litt.main.tool.LittPagination;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDao{
	
	@Autowired
	protected SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.openSession();
	}

	public void flush() {
		sessionFactory.getCurrentSession().flush();
	}

	public void clear() {
		sessionFactory.getCurrentSession().clear();
	}

	/**
	 * 根据 id 查询信息
	 * @param id
	 * @return
	 */
	public Object load(Class<?> c, String id) {
		Object obj = null;
		try {
			obj = this.getSession().get(c, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return obj;
	}
	
	/**
	 * 插入单个对象
	 * @param entity
	 * @return
	 */
	public String add(Object entity){
		Session session = getSession();
		String id = (String) session.save(entity);
		session.close();
		return id;
	}
	
	/**
	 * 更新单条数据
	 * @param entity
	 * @return
	 */
	public void update(Object entity){
		this.getSession().update(entity);
	}
	
	/**
	 * 删除单条数据
	 * @param entity
	 */
	public void delete(Object entity){
		this.getSession().delete(entity);
	}
	
	/**
	 * 所有条件精确匹配查询总数
	 * @param c  所查的对象class
	 * @param conditions 里边包含以下参数
	 * @param map  条件属性的集合
	 * @param startDate 开始时间
	 * @param endDate   结束时间
	 * @param dateProp 时间条件属性名
	 * @return
	 */
	public Long getTotalCount(Class<?> c, LittCondition conditions){
		Session session = getSession();
		Criteria criteria = session.createCriteria(c); 
		if(conditions.isMapNotNull()){
			criteria.add(Restrictions.allEq(conditions.getMap()));
		}
		if(conditions.isDateNotNull()){
			criteria.add(Restrictions.between(conditions.getDateProp(), conditions.getStartDate(), conditions.getEndDate()));
		}
		Long count = (Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
		session.close();
		return count;	
	}
	
	public boolean validObject(Class<?> c, Map<String,Object> map){
		Session session = getSession();
		Criteria criteria = session.createCriteria(c);
		if(map != null && map.size() > 0){
			criteria.add(Restrictions.allEq(map));
			Long count = (Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
			session.close();
			// 返回值是由前端控件决定，很奇葩，true是表明无值，false说明有值
			if(count > 0){
				return false;
			}else{
				return true;
			}
		}else{
			session.close();
			return true;
		}
	}
	
	/**
	 * 所有条件精确匹配查询集合
	 * @param c  所查的对象class
	 * @param conditions 里边包含以下参数
	 * @param map  条件属性的集合
	 * @param startDate 开始时间
	 * @param endDate   结束时间
	 * @param dateProp 时间条件属性名
	 * @return
	 */
	public List<?> queryByConditions(Class<?> c, LittCondition conditions, LittPagination pagination){
		Session session = getSession();
		Criteria criteria = session.createCriteria(c); 
		if(conditions.isMapNotNull()){
			criteria.add(Restrictions.allEq(conditions.getMap()));
		}
		if(conditions.isDateNotNull()){
			criteria.add(Restrictions.between(conditions.getDateProp(), conditions.getStartDate(), conditions.getEndDate()));
		}
		if(pagination.isPagination()){
			criteria.setFirstResult(pagination.getStartNum());
			criteria.setMaxResults(pagination.getRows());
		}
		List<?> resultList = criteria.list();
		session.close();
		return resultList;	
	}
	
	/**
	 * 根据hql查询结果集
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<?> queryByHql(String hql){
		Session session = getSession();
		List resultList = session.createQuery(hql).list();
		session.close();
		return resultList;
	}
	
	
}
