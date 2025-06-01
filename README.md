![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# FSM de Arranque con Prescaler - Proyecto Tiny Tapeout

Este proyecto implementa una **Máquina de Estados Finitos (FSM)** que controla una secuencia de encendido gradual (30%, 50%, 100%) basada en señales de control de velocidad (`rapido`, `lento`). Además, se incluye un módulo `prescaler_clk` que convierte el reloj de entrada (por ejemplo, 100 MHz) a una frecuencia de 1 Hz, adecuada para la transición de estados observables.

## Archivos clave

- `arranque_rampa_parcial.v`: Lógica secuencial de la FSM de encendido.
- `prescaler_clk.v`: Prescaler de reloj para reducir frecuencia.
- `top_module.v`: Integración del sistema.
- `tt_um_byron.v`: Módulo de usuario compatible con el wrapper estándar de Tiny Tapeout.

## Cómo funciona

- Las señales `rapido` y `lento` se ingresan por `ui_in[0]` y `ui_in[1]`.
- La FSM genera salidas `out_30`, `out_50`, y `out_100` según la secuencia activada.
- Las salidas se reflejan en `uo_out[0:2]` para ser observadas desde el chip.

## Simulación y pruebas

El entorno incluye archivos de prueba básicos dentro de la carpeta `test/`, listos para ser integrados con **Cocotb** y ejecutados mediante GitHub Actions.

## Cómo implementar este diseño

1. Coloca tus archivos Verilog dentro de `src/`.
2. Asegúrate que el archivo `info.yaml` tenga el nombre del top module: `tt_um_byron`.
3. Adapta `tt_um_byron.v` como wrapper para tu diseño principal (`top_module`).
4. Ejecuta `make` dentro de `test/` para correr pruebas locales.
5. Sube tu diseño al [portal de Tiny Tapeout](https://tinytapeout.com).


## Enable GitHub actions to build the results page

- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## Resources


- [FAQ](https://tinytapeout.com/faq/)
- [Guía para pruebas locales](https://tinytapeout.com/guides/local-hardening/)
- [Curso de diseño digital](https://tinytapeout.com/digital_design/)


## What next?

- [Submit your design to the next shuttle](https://app.tinytapeout.com/).
- Edit [this README](README.md) and explain your design, how it works, and how to test it.
- Share your project on your social network of choice:
  - LinkedIn [#tinytapeout](https://www.linkedin.com/search/results/content/?keywords=%23tinytapeout) [@TinyTapeout](https://www.linkedin.com/company/100708654/)
  - Mastodon [#tinytapeout](https://chaos.social/tags/tinytapeout) [@matthewvenn](https://chaos.social/@matthewvenn)
  - X (formerly Twitter) [#tinytapeout](https://twitter.com/hashtag/tinytapeout) [@tinytapeout](https://twitter.com/tinytapeout)
