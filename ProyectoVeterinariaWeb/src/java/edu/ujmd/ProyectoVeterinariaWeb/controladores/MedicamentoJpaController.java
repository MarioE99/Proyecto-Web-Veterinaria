/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ujmd.ProyectoVeterinariaWeb.controladores;

import edu.ujmd.ProyectoVeterinariaWeb.controladores.exceptions.IllegalOrphanException;
import edu.ujmd.ProyectoVeterinariaWeb.controladores.exceptions.NonexistentEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import edu.ujmd.ProyectoVeterinariaWeb.entidades.Historialmedico;
import edu.ujmd.ProyectoVeterinariaWeb.entidades.Medicamento;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author meev9
 */
public class MedicamentoJpaController implements Serializable {

    public MedicamentoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Medicamento medicamento) {
        if (medicamento.getHistorialmedicoList() == null) {
            medicamento.setHistorialmedicoList(new ArrayList<Historialmedico>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Historialmedico> attachedHistorialmedicoList = new ArrayList<Historialmedico>();
            for (Historialmedico historialmedicoListHistorialmedicoToAttach : medicamento.getHistorialmedicoList()) {
                historialmedicoListHistorialmedicoToAttach = em.getReference(historialmedicoListHistorialmedicoToAttach.getClass(), historialmedicoListHistorialmedicoToAttach.getCodHistorial());
                attachedHistorialmedicoList.add(historialmedicoListHistorialmedicoToAttach);
            }
            medicamento.setHistorialmedicoList(attachedHistorialmedicoList);
            em.persist(medicamento);
            for (Historialmedico historialmedicoListHistorialmedico : medicamento.getHistorialmedicoList()) {
                Medicamento oldCodMedicamentoOfHistorialmedicoListHistorialmedico = historialmedicoListHistorialmedico.getCodMedicamento();
                historialmedicoListHistorialmedico.setCodMedicamento(medicamento);
                historialmedicoListHistorialmedico = em.merge(historialmedicoListHistorialmedico);
                if (oldCodMedicamentoOfHistorialmedicoListHistorialmedico != null) {
                    oldCodMedicamentoOfHistorialmedicoListHistorialmedico.getHistorialmedicoList().remove(historialmedicoListHistorialmedico);
                    oldCodMedicamentoOfHistorialmedicoListHistorialmedico = em.merge(oldCodMedicamentoOfHistorialmedicoListHistorialmedico);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Medicamento medicamento) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Medicamento persistentMedicamento = em.find(Medicamento.class, medicamento.getCodMedicamento());
            List<Historialmedico> historialmedicoListOld = persistentMedicamento.getHistorialmedicoList();
            List<Historialmedico> historialmedicoListNew = medicamento.getHistorialmedicoList();
            List<String> illegalOrphanMessages = null;
            for (Historialmedico historialmedicoListOldHistorialmedico : historialmedicoListOld) {
                if (!historialmedicoListNew.contains(historialmedicoListOldHistorialmedico)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Historialmedico " + historialmedicoListOldHistorialmedico + " since its codMedicamento field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Historialmedico> attachedHistorialmedicoListNew = new ArrayList<Historialmedico>();
            for (Historialmedico historialmedicoListNewHistorialmedicoToAttach : historialmedicoListNew) {
                historialmedicoListNewHistorialmedicoToAttach = em.getReference(historialmedicoListNewHistorialmedicoToAttach.getClass(), historialmedicoListNewHistorialmedicoToAttach.getCodHistorial());
                attachedHistorialmedicoListNew.add(historialmedicoListNewHistorialmedicoToAttach);
            }
            historialmedicoListNew = attachedHistorialmedicoListNew;
            medicamento.setHistorialmedicoList(historialmedicoListNew);
            medicamento = em.merge(medicamento);
            for (Historialmedico historialmedicoListNewHistorialmedico : historialmedicoListNew) {
                if (!historialmedicoListOld.contains(historialmedicoListNewHistorialmedico)) {
                    Medicamento oldCodMedicamentoOfHistorialmedicoListNewHistorialmedico = historialmedicoListNewHistorialmedico.getCodMedicamento();
                    historialmedicoListNewHistorialmedico.setCodMedicamento(medicamento);
                    historialmedicoListNewHistorialmedico = em.merge(historialmedicoListNewHistorialmedico);
                    if (oldCodMedicamentoOfHistorialmedicoListNewHistorialmedico != null && !oldCodMedicamentoOfHistorialmedicoListNewHistorialmedico.equals(medicamento)) {
                        oldCodMedicamentoOfHistorialmedicoListNewHistorialmedico.getHistorialmedicoList().remove(historialmedicoListNewHistorialmedico);
                        oldCodMedicamentoOfHistorialmedicoListNewHistorialmedico = em.merge(oldCodMedicamentoOfHistorialmedicoListNewHistorialmedico);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = medicamento.getCodMedicamento();
                if (findMedicamento(id) == null) {
                    throw new NonexistentEntityException("The medicamento with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Medicamento medicamento;
            try {
                medicamento = em.getReference(Medicamento.class, id);
                medicamento.getCodMedicamento();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The medicamento with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Historialmedico> historialmedicoListOrphanCheck = medicamento.getHistorialmedicoList();
            for (Historialmedico historialmedicoListOrphanCheckHistorialmedico : historialmedicoListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Medicamento (" + medicamento + ") cannot be destroyed since the Historialmedico " + historialmedicoListOrphanCheckHistorialmedico + " in its historialmedicoList field has a non-nullable codMedicamento field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(medicamento);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Medicamento> findMedicamentoEntities() {
        return findMedicamentoEntities(true, -1, -1);
    }

    public List<Medicamento> findMedicamentoEntities(int maxResults, int firstResult) {
        return findMedicamentoEntities(false, maxResults, firstResult);
    }

    private List<Medicamento> findMedicamentoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Medicamento.class));
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

    public Medicamento findMedicamento(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Medicamento.class, id);
        } finally {
            em.close();
        }
    }

    public int getMedicamentoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Medicamento> rt = cq.from(Medicamento.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
