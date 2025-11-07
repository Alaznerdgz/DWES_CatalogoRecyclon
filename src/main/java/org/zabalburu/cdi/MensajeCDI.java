package org.zabalburu.cdi;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Named;
import lombok.Data;

@Data
@RequestScoped
@Named
public class MensajeCDI {
    private String tipo = "info"; // success, danger, warning, info
    private String mensaje = "";
    
    public MensajeCDI() {
    }
}
