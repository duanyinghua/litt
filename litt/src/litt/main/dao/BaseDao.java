package litt.main.dao;

import litt.main.pojo.LittCondition;
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
		return sessionFactory.getCurrentSession();
	}

	public Session getNewSession() {
		return sessionFactory.openSession();
	}

	public void flush() {
		getSession().flush();
	}

	public void clear() {
		getSession().clear();
	}

	/**
	 * 根据 id 查询信息
	 * @param id
	 * @return
	 */
	public Object load(Class<?> c, String id) {
		return this.getSession().get(c, id);
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
	 * 所有条件精确匹配查询
	 * @param c 对象class
	 * @param map  条件属性的集合
	 * @param startDate 开始时间
	 * @param endDate   结束时间
	 * @param dateProp 时间条件属性名
	 * @return
	 */
	public Long getTotalCount(Class<?> c, LittCondition conditions){
		Criteria criteria = getSession().createCriteria(c); 
		if(conditions.isMapNull()){
			criteria.add(Restrictions.allEq(conditions.getMap()));
		}
		if(conditions.isDateNull()){
			criteria.add(Restrictions.between(conditions.getDateProp(), conditions.getStartDate(), conditions.getEndDate()));
		}
		return (Long)criteria.setProjection(Projections.rowCount()).uniqueResult();	
	}
}
