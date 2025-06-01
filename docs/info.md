<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

ExEste proyecto implementa una máquina de estados finitos (FSM) que permite el encendido secuencial de una carga en tres niveles: 30%, 50% y 100%, controlados por dos señales de entrada `rapido` y `lento`. 

Además, el sistema integra un módulo `prescaler_clk` que reduce el reloj de entrada de alta frecuencia (por ejemplo, 100 MHz) a una señal de 1 Hz. Esto permite que las transiciones de estado de la FSM sean claramente observables y no sucedan a alta velocidad.

La lógica principal está compuesta por tres módulos:
- `arranque_rampa_parcial.v`: implementa la lógica secuencial de la FSM.
- `prescaler_clk.v`: genera un pulso de reloj lento de 1 segundo.
- `top_module.v`: conecta el prescaler con la FSM y las entradas/salidas.
- `tt_um_fsm_top.v`: módulo wrapper que expone la interfaz estándar requerida por Tiny Tapeout.


## How to test


El diseño puede ser probado usando `cocotb` y simulación mediante `make`. Las señales `rapido` y `lento` se aplican a través del bus `ui_in`:
- `ui_in[0] = rapido`
- `ui_in[1] = lento`

Las salidas de la FSM pueden observarse por el bus `uo_out`:
- `uo_out[0] = out_30`
- `uo_out[1] = out_50`
- `uo_out[2] = out_100`

## External hardware

Placa de prueba/carrier board usamos basys3 para simularlo.
fuente de 3.3v
Leds
interrupto de palanca
un oscilador a 1hz

