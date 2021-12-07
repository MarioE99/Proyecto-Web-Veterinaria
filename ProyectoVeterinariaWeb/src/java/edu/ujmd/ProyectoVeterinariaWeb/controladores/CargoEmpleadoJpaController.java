/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ujmd.ProyectoVeterinariaWeb.controladores;

import edu.ujmd.ProyectoVeterinariaWeb.controladores.exceptions.NonexistentEntityException;
import edu.ujmd.ProyectoVeterinariaWeb.entidades.CargoEmpleado;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import edu.ujmd.ProyectoVeterinariaWeb.entidades.Empleados;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author meev9
 */
public class CargoEmpleadoJpaController implements Serializable {

    public CargoEmpleadoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(CargoEmpleado cargoEmpleado) {
        if (cargoEmpleado.getEmpleadosList() == null) {
            cargoEmpleado.setEmpleadosList(new ArrayList<Empleados>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Empleados> attachedEmpleadosList = new ArrayList<Empleados>();
            for (Empleados empleadosListEmpleadosToAttach : cargoEmpleado.getEmpleadosList()) {
                empleadosListEmpleadosToAttach = em.getReference(empleadosListEmpleadosToAttach.getClass(), empleadosListEmpleadosToAttach.getCodEmpleados());
                attachedEmpleadosList.add(empleadosListEmpleadosToAttach);
            }
            cargoEmpleado.setEmpleadosList(attachedEmpleadosList);
            em.persist(cargoEmpleado);
            for (Empleados empleadosListEmpleados : cargoEmpleado.getEmpleadosList()) {
                CargoEmpleado oldCodCargoOfEmpleadosListEmpleados = empleadosListEmpleados.getCodCargo();
                empleadosListEmpleados.setCodCargo(cargoEmpleado);
                empleadosListEmpleados = em.merge(empleadosListEmpleados);
                if (oldCodCargoOfEmpleadosListEmpleados != null) {
                    oldCodCargoOfEmpleadosListEmpleados.getEmpleadosList().remove(empleadosListEmpleados);
                    oldCodCargoOfEmpleadosListEmpleados = em.merge(oldCodCargoOfEmpleadosListEmpleados);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(CargoEmpleado cargoEmpleado) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            CargoEmpleado persistentCargoEmpleado = em.find(CargoEmpleado.class, cargoEmpleado.getCodCargo());
            List<Empleados> empleadosListOld = persistentCargoEmpleado.getEmpleadosList();
            List<Empleados> empleadosListNew = cargoEmpleado.getEmpleadosList();
            List<Empleados> attachedEmpleadosListNew = new ArrayList<Empleados>();
            for (Empleados empleadosListNewEmpleadosToAttach : empleadosListNew) {
                empleadosListNewEmpleadosToAttach = em.getReference(empleadosListNewEmpleadosToAttach.getClass(), empleadosListNewEmpleadosToAttach.getCodEmpleados());
                attachedEmpleadosListNew.add(empleadosListNewEmpleadosToAttach);
            }
            empleadosListNew = attachedEmpleadosListNew;
            cargoEmpleado.setEmpleadosList(empleadosListNew);
            cargoEmpleado = em.merge(cargoEmpleado);
            for (Empleados empleadosListOldEmpleados : empleadosListOld) {
                if (!empleadosListNew.contains(empleadosListOldEmpleados)) {
                    empleadosListOldEmpleados.setCodCargo(null);
                    empleadosListOldEmpleados = em.merge(empleadosListOldEmpleados);
                }
            }
            for (Empleados empleadosListNewEmpleados : empleadosListNew) {
                if (!empleadosListOld.contains(empleadosListNewEmpleados)) {
                    CargoEmpleado oldCodCargoOfEmpleadosListNewEmpleados = empleadosListNewEmpleados.getCodCargo();
                    empleadosListNewEmpleados.setCodCargo(cargoEmpleado);
                    empleadosListNewEmpleados = em.merge(empleadosListNewEmpleados);
                    if (oldCodCargoOfEmpleadosListNewEmpleados != null && !oldCodCargoOfEmpleadosListNewEmpleados.equals(cargoEmpleado)) {
                        oldCodCargoOfEmpleadosListNewEmpleados.getEmpleadosList().remove(empleadosListNewEmpleados);
                        oldCodCargoOfEmpleadosListNewEmpleados = em.merge(oldCodCargoOfEmpleadosListNewEmpleados);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = cargoEmpleado.getCodCargo();
                if (findCargoEmpleado(id) == null) {
                    throw new NonexistentEntityException("The cargoEmpleado with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            CargoEmpleado cargoEmpleado;
            try {
                cargoEmpleado = em.getReference(CargoEmpleado.class, id);
                cargoEmpleado.getCodCargo();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The cargoEmpleado with id " + id + " no longer exists.", enfe);
            }
            List<Empleados> empleadosList = cargoEmpleado.getEmpleadosList();
            for (Empleados empleadosListEmpleados : empleadosList) {
                empleadosListEmpleados.setCodCargo(null);
                empleadosListEmpleados = em.merge(empleadosListEmpleados);
            }
            em.remove(cargoEmpleado);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<CargoEmpleado> findCargoEmpleadoEntities() {
        return findCargoEmpleadoEntities(true, -1, -1);
    }

    public List<CargoEmpleado> findCargoEmpleadoEntities(int maxResults, int firstResult) {
        return findCargoEmpleadoEntities(false, maxResults, firstResult);
    }

    private List<CargoEmpleado> findCargoEmpleadoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(CargoEmpleado.class));
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

    public CargoEmpleado findCargoEmpleado(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(CargoEmpleado.class, id);
        } finally {
            em.close();
        }
    }

    public int getCargoEmpleadoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<CargoEmpleado> rt = cq.from(CargoEmpleado.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
