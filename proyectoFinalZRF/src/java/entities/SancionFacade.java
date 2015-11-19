/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Fabian
 */
@Stateless
public class SancionFacade extends AbstractFacade<Sancion> {
    @PersistenceContext(unitName = "proyectoFinalZRFPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SancionFacade() {
        super(Sancion.class);
    }
    
}