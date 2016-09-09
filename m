From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the slave-dma tree
Date: Fri, 9 Sep 2016 14:20:20 +0200
Message-ID: <20160909122020.GA22545@kroah.com>
References: <20160905164321.4dd8801b@canb.auug.org.au>
 <20160905112802.GJ9355@localhost>
 <20160905113333.GA27586@kroah.com>
 <20160905124305.GQ9355@localhost>
 <20160905135541.GA13403@kroah.com>
 <20160905155321.GT9355@localhost>
 <20160909115354.GR9355@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160909115354.GR9355@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nandor Han <nandor.han@ge.com>, Dave Jiang <dave.jiang@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 09, 2016 at 05:23:54PM +0530, Vinod Koul wrote:
> On Mon, Sep 05, 2016 at 09:23:21PM +0530, Vinod Koul wrote:
> > On Mon, Sep 05, 2016 at 03:55:41PM +0200, Greg KH wrote:
> > > On Mon, Sep 05, 2016 at 06:13:05PM +0530, Vinod Koul wrote:
> > > > > > Stephen,
> > > > > > 
> > > > > > The fix looks right to me.
> > > > > > 
> > > > > > Greg let me know if you would like me to merge this to avoid conflict
> > > > > 
> > > > > Sure, which way do you want to merge, do you want me to pull your tree
> > > > > into mine, or do you want to pull my tree into yours?  Either is fine
> > > > > with me.
> > > > 
> > > > Great, I would prefer to pull.
> > > 
> > > Do you want a signed tag, or do you just want to pull my tty-next branch
> > > directly into your tree?
> > 
> > Signed tag would be better
> 
> Hi Greg,
> 
> Can you please send a tag for this

Oops, sorry for the delay, here it is:

-----------

The following changes since commit c6935931c1894ff857616ff8549b61236a19148f:

  Linux 4.8-rc5 (2016-09-04 14:31:46 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/ tags/tty-for-dma

for you to fetch changes up to b53761e36a509609e91a797fa63648ec43aecc13:

  Merge 4.8-rc5 into tty-next (2016-09-05 08:11:21 +0200)

----------------------------------------------------------------
TTY/Serial tree tag to merge into the DMA tree.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alexander Sverdlin (1):
      serial: earlycon: Extend earlycon command line option to support 64-bit addresses

Andy Shevchenko (14):
      dmaengine: dw: keep copy of custom slave config in dwc
      dmaengine: dw: set polarity of handshake interface
      dmaengine: dw: override LLP support if asked in platform data
      dmaengine: dw: provide probe(), remove() stubs for users
      serial: 8250_dma: switch to new dmaengine_terminate_* API
      serial: 8250_dma: adjust DMA address of the UART
      serial: 8250: enable AFE on ports where FIFO is 16 bytes
      serial: 8250_lpss: split LPSS driver to separate module
      serial: 8250_lpss: move Quark code from PCI driver
      serial: 8250_lpss: enable MSI for Intel Quark
      serial: 8250_lpss: enable DMA on Intel Quark UART
      serial: 8250_port: fix runtime PM use in __do_stop_tx_rs485()
      serial: 8250_port: unify check of em485 variable
      dmaengine: hsu: refactor hsu_dma_do_irq() to return int

Baoyou Xie (1):
      tty/serial: mark __init early_smh_setup() static

Bhuvanchandra DV (5):
      tty: serial: fsl_lpuart: Fix broken 8m/s1 support
      tty: serial: fsl_lpuart: Use cyclic DMA for Rx
      tty: serial: fsl_lpuart: Use scatter/gather DMA for Tx
      tty: serial: fsl_lpuart: Update suspend/resume for DMA mode
      tty: serial: fsl_lpuart: Add support for RS-485

Christophe JAILLET (1):
      serial: vt8500_serial: Fix a parameter of find_first_zero_bit.

Eddie Huang (1):
      serial: 8250_mtk: support big baud rate.

Florian Vallee (1):
      sc16is7xx: make sure device is in suspend once probed

Greg Kroah-Hartman (1):
      Merge 4.8-rc5 into tty-next

Julia Lawall (10):
      tty/serial: at91: use of_property_read_bool
      serial/arc: constify uart_ops structures
      serial: st-asc: constify uart_ops structures
      tty/serial: at91: constify uart_ops structures
      serial: altera: constify uart_ops structures
      serial/bcm63xx_uart: constify uart_ops structures
      tty: serial: jsm_tty: constify uart_ops structures
      tty: serial: constify uart_ops structures
      tty: xuartps: constify uart_ops structures
      serial-uartlite: constify uart_ops structures

Kefeng Wang (3):
      serial: 8250_dw: Check the data->pclk when get apb_pclk
      serial: 8250_dw: Use an unified new dev variable in probe
      serial: 8250_dw: add ACPI support for uart on Hisilicon Hip05 SoC

Krzysztof Kozlowski (1):
      serial: samsung: Register cpufreq notifier only on S3C24xx

Ludovic Desroches (1):
      tty/serial: atmel: add fractional baud rate support

Martyn Welch (1):
      Allowing UART DMA to be configured on i.MX53

Nandor Han (4):
      dmaengine: imx-sdma - reduce transfer latency for DMA cyclic clients
      dmaengine: imx-sdma - update the residue calculation for cyclic channels
      serial: imx-serial - update UART IMX driver to use cyclic DMA
      serial: imx-serial - update RX error counters when DMA is used

Rob Herring (2):
      tty: serial_core: convert uart_open to use tty_port_open
      tty: serial_core: convert uart_close to use tty_port_close

Shawn Guo (3):
      tty: amba-pl011: define flag register bits for ZTE device
      tty: amba-pl011: add .get_fifosize for ZTE device
      tty: amba-pl011: probe ZTE device from AMBA bus with a pseudo-ID

Stefan Agner (3):
      tty: serial: fsl_lpuart: consider TX FIFO too in tx_empty
      tty: serial: fsl_lpuart: support suspend/resume
      tty: serial: fsl_lpuart: fix clearing of receive flag

 drivers/dma/dw/core.c                      |  39 +-
 drivers/dma/dw/regs.h                      |   5 +-
 drivers/dma/hsu/hsu.c                      |   9 +-
 drivers/dma/hsu/pci.c                      |   6 +-
 drivers/dma/imx-sdma.c                     |  56 +-
 drivers/tty/serial/8250/8250.h             |   5 +
 drivers/tty/serial/8250/8250_core.c        |   2 +-
 drivers/tty/serial/8250/8250_dma.c         |  14 +-
 drivers/tty/serial/8250/8250_dw.c          |  48 +-
 drivers/tty/serial/8250/8250_lpss.c        | 378 ++++++++++++++
 drivers/tty/serial/8250/8250_mid.c         |   8 +-
 drivers/tty/serial/8250/8250_mtk.c         |   6 +-
 drivers/tty/serial/8250/8250_pci.c         | 257 +--------
 drivers/tty/serial/8250/8250_port.c        |  37 +-
 drivers/tty/serial/8250/Kconfig            |  16 +-
 drivers/tty/serial/8250/Makefile           |   1 +
 drivers/tty/serial/altera_jtaguart.c       |   2 +-
 drivers/tty/serial/altera_uart.c           |   2 +-
 drivers/tty/serial/amba-pl011.c            |  59 ++-
 drivers/tty/serial/arc_uart.c              |   2 +-
 drivers/tty/serial/atmel_serial.c          |  51 +-
 drivers/tty/serial/bcm63xx_uart.c          |   2 +-
 drivers/tty/serial/earlycon-arm-semihost.c |   3 +-
 drivers/tty/serial/earlycon.c              |   7 +-
 drivers/tty/serial/fsl_lpuart.c            | 814 +++++++++++++++++------------
 drivers/tty/serial/imx.c                   | 192 ++++---
 drivers/tty/serial/jsm/jsm_tty.c           |   2 +-
 drivers/tty/serial/max3100.c               |   2 +-
 drivers/tty/serial/men_z135_uart.c         |   2 +-
 drivers/tty/serial/mxs-auart.c             |   2 +-
 drivers/tty/serial/pch_uart.c              |   2 +-
 drivers/tty/serial/samsung.c               |   2 +-
 drivers/tty/serial/samsung.h               |   2 +-
 drivers/tty/serial/sc16is7xx.c             |  20 +
 drivers/tty/serial/serial_core.c           | 138 ++---
 drivers/tty/serial/sh-sci.c                |   2 +-
 drivers/tty/serial/st-asc.c                |   2 +-
 drivers/tty/serial/timbuart.c              |   2 +-
 drivers/tty/serial/uartlite.c              |   2 +-
 drivers/tty/serial/vt8500_serial.c         |   8 +-
 drivers/tty/serial/xilinx_uartps.c         |   2 +-
 include/linux/amba/bus.h                   |   6 +
 include/linux/amba/serial.h                |   9 +
 include/linux/atmel_serial.h               |   1 +
 include/linux/dma/dw.h                     |   5 +
 include/linux/dma/hsu.h                    |   9 +-
 include/linux/platform_data/dma-dw.h       |   4 +
 include/linux/serial_core.h                |   2 +-
 48 files changed, 1333 insertions(+), 914 deletions(-)
 create mode 100644 drivers/tty/serial/8250/8250_lpss.c
