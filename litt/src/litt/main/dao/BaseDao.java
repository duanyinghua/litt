package litt.main.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDao  extends HibernateDaoSupport{

	// 注解的方式取得sessionFactory
	@Resource  
    public void setSessionFacotry(SessionFactory sessionFacotry) {  
        super.setSessionFactory(sessionFacotry);  
    }

	/**
	 * 根据 id 查询信息
	 * 
	 * @param id
	 * @return
	 */

	@SuppressWarnings("unchecked")
	public Object load(@SuppressWarnings("rawtypes") Class c, String id) {
		return this.getHibernateTemplate().load(c, id);
	}
	
	public void del(Class<?> clazz, Object[] ob) throws Exception{
		for(int i = 0; i < ob.length; i++){
			getHibernateTemplate().delete(getHibernateTemplate().get(clazz, (String)ob[i]));
		}
	}

	public void del(Object[] ob) throws Exception{
		for(int i = 0; i < ob.length; i++){
			getHibernateTemplate().delete(ob[i]);
		}
	}
	
	public void del(Object ob) throws Exception{
		getHibernateTemplate().delete(ob);
	}
	
	public void delBySql(Object ob) throws Exception{


	}

	public int getNumbers(String hql) throws Exception{
		List<?> list = getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return Integer.valueOf(String.valueOf(list.get(0))).intValue();
		}
		return 0;
	}
	
	public Long getSeqNoMax(String hql) throws Exception{
		Long temp = Long.valueOf(String.valueOf(getHibernateTemplate().find(hql))).longValue();
		if(temp==null){
			return 1L;
		}else{
			return temp;
		}
	}

	public int getNumbers(String hql,Object[]prameters) throws Exception{
		List<?> list = getHibernateTemplate().find(hql,prameters);
		if(list != null && list.size() > 0){
			return Integer.valueOf(String.valueOf(list.get(0))).intValue();
		}
		return 0;
	}
	
	//FIXME: 待测试
	public List<?> list(final String hql,final int firstResult,final int maxResults){    
        return (List<?>) super.getHibernateTemplate().execute(new HibernateCallback<Object>(){          
            public Object doInHibernate(Session session)
            throws HibernateException {
                Query query=session.createQuery(hql);
                query.setFirstResult(firstResult);
                query.setMaxResults(maxResults);
                return query.list();
            }
        });
    }


	public Object load(String hql) throws Exception{
		List<?> ls = this.getHibernateTemplate().find(hql);
		if(ls!=null && ls.size()>0){
			return ls.get(0);
		}
		return null;
	}

	public Object load(String hql,Object[]prameters) throws Exception{
		List<?> ls = this.getHibernateTemplate().find(hql,prameters);
		if(ls!=null && ls.size()>0){
			return ls.get(0);
		}
		return null;
	}

	public void save(Object entity) throws Exception{
		this.getHibernateTemplate().save(entity);
	}


	public void saveOrUpdate(Object entity) throws Exception {
		this.getHibernateTemplate().saveOrUpdate(entity);
		
	}
	
	public String saveOrUpdateReturn(Object entity) throws Exception {
		return this.getHibernateTemplate().save(entity).toString();
		
	}
	

	//FIXME: 待测试
	public void saveOrUpdateAll(Collection<?> entities) throws Exception{
		this.getHibernateTemplate().saveOrUpdate(entities);	

	}


	public void update(Object entity) throws Exception{
		this.getHibernateTemplate().update(entity);
	}

	public List<?> list(String hql) throws Exception{
		return getHibernateTemplate().find(hql);
	}

	public List<?> list(String hql,Object[]prameters) throws Exception{
		return getHibernateTemplate().find(hql,prameters);
	}

	public String getP2ValueByP1(String tableName,String p1,String p1Value,String p2) throws Exception{
		String hql = "";
		hql += " select a."+p2+" from "+tableName
		+" a where 1=1 and a."+p1+"='"+p1Value+"'";
		List<?> list = this.getHibernateTemplate().find(hql);
		String p2Value = String.valueOf((Object)list.get(0));
		return p2Value;
	}


	public String getColumnValue(String tableName,String column,String parameters) throws Exception{
		String hql = "";
		hql += " select a."+column+" from "+tableName
		+" a where 1=1 "+parameters;
		List<?> list = this.getHibernateTemplate().find(hql);
		String p2Value = String.valueOf((Object)list.get(0));
		return p2Value;
	}

	public List<?> getCommDictPublicCharDict(String classCode) throws Exception{
		String hql = "from SecurityDict a where 1=1 and a.classCode='"+classCode+"' order by a.seqNo";
		return (List<?>)this.getHibernateTemplate().find(hql);

	}

	public List<?> getCommDict(String dictName) throws Exception{

		String hql = "from "+dictName+" a where 1=1 order by a.seqNo";
		return this.getHibernateTemplate().find(hql);
	}


	public Criteria createCriteria(Class<?> entityClass,Criterion... criterions) {
		 Criteria criteria = currentSession().createCriteria(entityClass);
	        for (Criterion c : criterions) {
	            criteria.add(c);
	        }
	        return criteria;
	}

/**
 * 此方法存在bug[连续请求9次后，停止执行],请使用其他替代方法
 */
	@SuppressWarnings("unchecked")
	public <T> List<T> findBy(Class<T> entityClass, String name, Object value) {
		System.out.println("===systemcode============444444===");
		 return this.createCriteria(entityClass,Restrictions.eq(name, value)).list();
	}


	public Criteria createCriteria(Class<?> entityClass) {
		return currentSession().createCriteria(entityClass);
	}
	
	/**
	 * 增加后返回对象
	 * @param obj
	 * @return
	 */
	public Object add(Object obj){
		this.getHibernateTemplate().save(obj);
		return obj;
	}

}
