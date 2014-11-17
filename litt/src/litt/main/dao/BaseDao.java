package litt.main.dao;

import java.util.List;

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
		return (String) this.getSession().save(entity);
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
		Criteria criteria = getSession().createCriteria(c); 
		if(conditions.isMapNull()){
			criteria.add(Restrictions.allEq(conditions.getMap()));
		}
		if(conditions.isDateNull()){
			criteria.add(Restrictions.between(conditions.getDateProp(), conditions.getStartDate(), conditions.getEndDate()));
		}
		Long count = (Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
		session.close();
		return count;	
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
		if(conditions.isMapNull()){
			criteria.add(Restrictions.allEq(conditions.getMap()));
		}
		if(conditions.isDateNull()){
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
	public List<?> queryByHql(String hql){
		return getSession().createQuery(hql).list();
	}
	
	
}
