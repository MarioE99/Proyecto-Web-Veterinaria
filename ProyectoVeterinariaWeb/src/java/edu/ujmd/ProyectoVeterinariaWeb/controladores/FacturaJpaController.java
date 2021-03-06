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
import edu.ujmd.ProyectoVeterinariaWeb.entidades.Clientes;
import edu.ujmd.ProyectoVeterinariaWeb.entidades.Sucursal;
import edu.ujmd.ProyectoVeterinariaWeb.entidades.Detallefactura;
import edu.ujmd.ProyectoVeterinariaWeb.entidades.Factura;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author meev9
 */
public class FacturaJpaController implements Serializable {

    public FacturaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Factura factura) {
        if (factura.getDetallefacturaList() == null) {
            factura.setDetallefacturaList(new ArrayList<Detallefactura>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Clientes codClientes = factura.getCodClientes();
            if (codClientes != null) {
                codClientes = em.getReference(codClientes.getClass(), codClientes.getCodClientes());
                factura.setCodClientes(codClientes);
            }
            Sucursal codSucursal = factura.getCodSucursal();
            if (codSucursal != null) {
                codSucursal = em.getReference(codSucursal.getClass(), codSucursal.getCodSucursal());
                factura.setCodSucursal(codSucursal);
            }
            List<Detallefactura> attachedDetallefacturaList = new ArrayList<Detallefactura>();
            for (Detallefactura detallefacturaListDetallefacturaToAttach : factura.getDetallefacturaList()) {
                detallefacturaListDetallefacturaToAttach = em.getReference(detallefacturaListDetallefacturaToAttach.getClass(), detallefacturaListDetallefacturaToAttach.getCodDetalle());
                attachedDetallefacturaList.add(detallefacturaListDetallefacturaToAttach);
            }
            factura.setDetallefacturaList(attachedDetallefacturaList);
            em.persist(factura);
            if (codClientes != null) {
                codClientes.getFacturaList().add(factura);
                codClientes = em.merge(codClientes);
            }
            if (codSucursal != null) {
                codSucursal.getFacturaList().add(factura);
                codSucursal = em.merge(codSucursal);
            }
            for (Detallefactura detallefacturaListDetallefactura : factura.getDetallefacturaList()) {
                Factura oldCodFacturaOfDetallefacturaListDetallefactura = detallefacturaListDetallefactura.getCodFactura();
                detallefacturaListDetallefactura.setCodFactura(factura);
                detallefacturaListDetallefactura = em.merge(detallefacturaListDetallefactura);
                if (oldCodFacturaOfDetallefacturaListDetallefactura != null) {
                    oldCodFacturaOfDetallefacturaListDetallefactura.getDetallefacturaList().remove(detallefacturaListDetallefactura);
                    oldCodFacturaOfDetallefacturaListDetallefactura = em.merge(oldCodFacturaOfDetallefacturaListDetallefactura);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Factura factura) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Factura persistentFactura = em.find(Factura.class, factura.getCodFactura());
            Clientes codClientesOld = persistentFactura.getCodClientes();
            Clientes codClientesNew = factura.getCodClientes();
            Sucursal codSucursalOld = persistentFactura.getCodSucursal();
            Sucursal codSucursalNew = factura.getCodSucursal();
            List<Detallefactura> detallefacturaListOld = persistentFactura.getDetallefacturaList();
            List<Detallefactura> detallefacturaListNew = factura.getDetallefacturaList();
            List<String> illegalOrphanMessages = null;
            for (Detallefactura detallefacturaListOldDetallefactura : detallefacturaListOld) {
                if (!detallefacturaListNew.contains(detallefacturaListOldDetallefactura)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Detallefactura " + detallefacturaListOldDetallefactura + " since its codFactura field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (codClientesNew != null) {
                codClientesNew = em.getReference(codClientesNew.getClass(), codClientesNew.getCodClientes());
                factura.setCodClientes(codClientesNew);
            }
            if (codSucursalNew != null) {
                codSucursalNew = em.getReference(codSucursalNew.getClass(), codSucursalNew.getCodSucursal());
                factura.setCodSucursal(codSucursalNew);
            }
            List<Detallefactura> attachedDetallefacturaListNew = new ArrayList<Detallefactura>();
            for (Detallefactura detallefacturaListNewDetallefacturaToAttach : detallefacturaListNew) {
                detallefacturaListNewDetallefacturaToAttach = em.getReference(detallefacturaListNewDetallefacturaToAttach.getClass(), detallefacturaListNewDetallefacturaToAttach.getCodDetalle());
                attachedDetallefacturaListNew.add(detallefacturaListNewDetallefacturaToAttach);
            }
            detallefacturaListNew = attachedDetallefacturaListNew;
            factura.setDetallefacturaList(detallefacturaListNew);
            factura = em.merge(factura);
            if (codClientesOld != null && !codClientesOld.equals(codClientesNew)) {
                codClientesOld.getFacturaList().remove(factura);
                codClientesOld = em.merge(codClientesOld);
            }
            if (codClientesNew != null && !codClientesNew.equals(codClientesOld)) {
                codClientesNew.getFacturaList().add(factura);
                codClientesNew = em.merge(codClientesNew);
            }
            if (codSucursalOld != null && !codSucursalOld.equals(codSucursalNew)) {
                codSucursalOld.getFacturaList().remove(factura);
                codSucursalOld = em.merge(codSucursalOld);
            }
            if (codSucursalNew != null && !codSucursalNew.equals(codSucursalOld)) {
                codSucursalNew.getFacturaList().add(factura);
                codSucursalNew = em.merge(codSucursalNew);
            }
            for (Detallefactura detallefacturaListNewDetallefactura : detallefacturaListNew) {
                if (!detallefacturaListOld.contains(detallefacturaListNewDetallefactura)) {
                    Factura oldCodFacturaOfDetallefacturaListNewDetallefactura = detallefacturaListNewDetallefactura.getCodFactura();
                    detallefacturaListNewDetallefactura.setCodFactura(factura);
                    detallefacturaListNewDetallefactura = em.merge(detallefacturaListNewDetallefactura);
                    if (oldCodFacturaOfDetallefacturaListNewDetallefactura != null && !oldCodFacturaOfDetallefacturaListNewDetallefactura.equals(factura)) {
                        oldCodFacturaOfDetallefacturaListNewDetallefactura.getDetallefacturaList().remove(detallefacturaListNewDetallefactura);
                        oldCodFacturaOfDetallefacturaListNewDetallefactura = em.merge(oldCodFacturaOfDetallefacturaListNewDetallefactura);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = factura.getCodFactura();
                if (findFactura(id) == null) {
                    throw new NonexistentEntityException("The factura with id " + id + " no longer exists.");
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
            Factura factura;
            try {
                factura = em.getReference(Factura.class, id);
                factura.getCodFactura();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The factura with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Detallefactura> detallefacturaListOrphanCheck = factura.getDetallefacturaList();
            for (Detallefactura detallefacturaListOrphanCheckDetallefactura : detallefacturaListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Factura (" + factura + ") cannot be destroyed since the Detallefactura " + detallefacturaListOrphanCheckDetallefactura + " in its detallefacturaList field has a non-nullable codFactura field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Clientes codClientes = factura.getCodClientes();
            if (codClientes != null) {
                codClientes.getFacturaList().remove(factura);
                codClientes = em.merge(codClientes);
            }
            Sucursal codSucursal = factura.getCodSucursal();
            if (codSucursal != null) {
                codSucursal.getFacturaList().remove(factura);
                codSucursal = em.merge(codSucursal);
            }
            em.remove(factura);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Factura> findFacturaEntities() {
        return findFacturaEntities(true, -1, -1);
    }

    public List<Factura> findFacturaEntities(int maxResults, int firstResult) {
        return findFacturaEntities(false, maxResults, firstResult);
    }

    private List<Factura> findFacturaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Factura.class));
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

    public Factura findFactura(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Factura.class, id);
        } finally {
            em.close();
        }
    }

    public int getFacturaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Factura> rt = cq.from(Factura.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
