package Persistencia;

import Logica.CantidadLibroPedido;
import Persistencia.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author joel
 */
public class CantidadLibroPedidoJpaController implements Serializable {

    public CantidadLibroPedidoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public CantidadLibroPedidoJpaController() {
        emf = Persistence.createEntityManagerFactory("BookStoreCatalog_war_PU");
    }

    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(CantidadLibroPedido cantidadLibroPedido) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(cantidadLibroPedido);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(CantidadLibroPedido cantidadLibroPedido) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            cantidadLibroPedido = em.merge(cantidadLibroPedido);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                long id = cantidadLibroPedido.getId();
                if (findCantidadLibroPedido(id) == null) {
                    throw new NonexistentEntityException("The cantidadLibroPedido with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(long id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            CantidadLibroPedido cantidadLibroPedido;
            try {
                cantidadLibroPedido = em.getReference(CantidadLibroPedido.class, id);
                cantidadLibroPedido.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The cantidadLibroPedido with id " + id + " no longer exists.", enfe);
            }
            em.remove(cantidadLibroPedido);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<CantidadLibroPedido> findCantidadLibroPedidoEntities() {
        return findCantidadLibroPedidoEntities(true, -1, -1);
    }

    public List<CantidadLibroPedido> findCantidadLibroPedidoEntities(int maxResults, int firstResult) {
        return findCantidadLibroPedidoEntities(false, maxResults, firstResult);
    }

    private List<CantidadLibroPedido> findCantidadLibroPedidoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(CantidadLibroPedido.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public CantidadLibroPedido findCantidadLibroPedido(long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(CantidadLibroPedido.class, id);
        } finally {
            em.close();
        }
    }

    public int getCantidadLibroPedidoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<CantidadLibroPedido> rt = cq.from(CantidadLibroPedido.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
