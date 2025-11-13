package org.zabalburu.cdi;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Named;
import lombok.Data;

@RequestScoped
@Named
public class MensajeCDI {
    private String tipo = "info"; // success, danger, warning, info
    private String mensaje = "";
    
    public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public String getTipo() {
		return tipo;
	}

	public MensajeCDI() {
    }

	public void setTipo(String tipo2) {
		this.tipo = tipo;
	}
	
	
}
