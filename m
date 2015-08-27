From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slave-dma tree with the pm, mfd and
 rtc trees
Date: Thu, 27 Aug 2015 11:26:45 +1000
Message-ID: <20150827112645.6c30e106@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lee Jones <lee.jones@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi Vinod,

Today's linux-next merge of the slave-dma tree got conflicts in:

  drivers/dma/Kconfig
  drivers/dma/Makefile

between commit:

  667dfed98615 ("dmaengine: add a driver for Intel integrated DMA 64-bit")

from the pm, mfd and rtc trees and commits:

  3c21619077be ("dmaengine: sort the Kconfig")
  7e97229b3920 ("dmaengine: sort the makefile")

from the slave-dma tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/dma/Kconfig
index bdbbe5bcfb83,7ba2847a5077..000000000000
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@@ -131,79 -204,74 +204,82 @@@ config FSL_RAI
            the capability to offload memcpy, xor and pq computation
  	  for raid5/6.
  
- source "drivers/dma/hsu/Kconfig"
- 
- config MPC512X_DMA
- 	tristate "Freescale MPC512x built-in DMA engine support"
- 	depends on PPC_MPC512x || PPC_MPC831x
++config IDMA64
++	tristate "Intel integrated DMA 64-bit support"
 +	select DMA_ENGINE
- 	---help---
- 	  Enable support for the Freescale MPC512x built-in DMA engine.
- 
- source "drivers/dma/bestcomm/Kconfig"
++	select DMA_VIRTUAL_CHANNELS
++	help
++	  Enable DMA support for Intel Low Power Subsystem such as found on
++	  Intel Skylake PCH.
 +
- config MV_XOR
- 	bool "Marvell XOR engine support"
- 	depends on PLAT_ORION
+ config IMG_MDC_DMA
+ 	tristate "IMG MDC support"
+ 	depends on MIPS || COMPILE_TEST
+ 	depends on MFD_SYSCON
  	select DMA_ENGINE
- 	select DMA_ENGINE_RAID
- 	select ASYNC_TX_ENABLE_CHANNEL_SWITCH
- 	---help---
- 	  Enable support for the Marvell XOR engine.
+ 	select DMA_VIRTUAL_CHANNELS
+ 	help
+ 	  Enable support for the IMG multi-threaded DMA controller (MDC).
  
- config MX3_IPU
- 	bool "MX3x Image Processing Unit support"
+ config IMX_DMA
+ 	tristate "i.MX DMA support"
  	depends on ARCH_MXC
  	select DMA_ENGINE
- 	default y
  	help
- 	  If you plan to use the Image Processing unit in the i.MX3x, say
- 	  Y here. If unsure, select Y.
+ 	  Support the i.MX DMA engine. This engine is integrated into
+ 	  Freescale i.MX1/21/27 chips.
  
- config MX3_IPU_IRQS
- 	int "Number of dynamically mapped interrupts for IPU"
- 	depends on MX3_IPU
- 	range 2 137
- 	default 4
+ config IMX_SDMA
+ 	tristate "i.MX SDMA support"
+ 	depends on ARCH_MXC
+ 	select DMA_ENGINE
  	help
- 	  Out of 137 interrupt sources on i.MX31 IPU only very few are used.
- 	  To avoid bloating the irq_desc[] array we allocate a sufficient
- 	  number of IRQ slots and map them dynamically to specific sources.
+ 	  Support the i.MX SDMA engine. This engine is integrated into
+ 	  Freescale i.MX25/31/35/51/53/6 chips.
  
- config PXA_DMA
- 	bool "PXA DMA support"
- 	depends on (ARCH_MMP || ARCH_PXA)
+ config INTEL_IOATDMA
+ 	tristate "Intel I/OAT DMA support"
+ 	depends on PCI && X86_64
  	select DMA_ENGINE
- 	select DMA_VIRTUAL_CHANNELS
+ 	select DMA_ENGINE_RAID
+ 	select DCA
  	help
- 	  Support the DMA engine for PXA. It is also compatible with MMP PDMA
- 	  platform. The internal DMA IP of all PXA variants is supported, with
- 	  16 to 32 channels for peripheral to memory or memory to memory
- 	  transfers.
+ 	  Enable support for the Intel(R) I/OAT DMA engine present
+ 	  in recent Intel Xeon chipsets.
  
- config TXX9_DMAC
- 	tristate "Toshiba TXx9 SoC DMA support"
- 	depends on MACH_TX49XX || MACH_TX39XX
+ 	  Say Y here if you have such a chipset.
+ 
+ 	  If unsure, say N.
+ 
+ config INTEL_IOP_ADMA
+ 	tristate "Intel IOP ADMA support"
+ 	depends on ARCH_IOP32X || ARCH_IOP33X || ARCH_IOP13XX
  	select DMA_ENGINE
+ 	select ASYNC_TX_ENABLE_CHANNEL_SWITCH
  	help
- 	  Support the TXx9 SoC internal DMA controller.  This can be
- 	  integrated in chips such as the Toshiba TX4927/38/39.
+ 	  Enable support for the Intel(R) IOP Series RAID engines.
  
- config TEGRA20_APB_DMA
- 	bool "NVIDIA Tegra20 APB DMA support"
- 	depends on ARCH_TEGRA
+ config INTEL_MIC_X100_DMA
+ 	tristate "Intel MIC X100 DMA Driver"
+ 	depends on 64BIT && X86 && INTEL_MIC_BUS
  	select DMA_ENGINE
  	help
- 	  Support for the NVIDIA Tegra20 APB DMA controller driver. The
- 	  DMA controller is having multiple DMA channel which can be
- 	  configured for different peripherals like audio, UART, SPI,
- 	  I2C etc which is in APB bus.
- 	  This DMA controller transfers data from memory to peripheral fifo
- 	  or vice versa. It does not support memory to memory data transfer.
+ 	  This enables DMA support for the Intel Many Integrated Core
+ 	  (MIC) family of PCIe form factor coprocessor X100 devices that
+ 	  run a 64 bit Linux OS. This driver will be used by both MIC
+ 	  host and card drivers.
  
- config S3C24XX_DMAC
- 	tristate "Samsung S3C24XX DMA support"
- 	depends on ARCH_S3C24XX
+ 	  If you are building host kernel with a MIC device or a card
+ 	  kernel for a MIC device, then say M (recommended) or Y, else
+ 	  say N. If unsure say N.
+ 
+ 	  More information about the Intel MIC family as well as the Linux
+ 	  OS and tools for MIC to use with this driver are available from
+ 	  <http://software.intel.com/en-us/mic-developer>.
+ 
+ config K3_DMA
+ 	tristate "Hisilicon K3 DMA support"
+ 	depends on ARCH_HI3xxx
  	select DMA_ENGINE
  	select DMA_VIRTUAL_CHANNELS
  	help
diff --cc drivers/dma/Makefile
index 56ff8c705c00,25e0705053e9..000000000000
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@@ -6,54 -8,61 +8,62 @@@ obj-$(CONFIG_DMA_VIRTUAL_CHANNELS) += v
  obj-$(CONFIG_DMA_ACPI) += acpi-dma.o
  obj-$(CONFIG_DMA_OF) += of-dma.o
  
+ #dmatest
  obj-$(CONFIG_DMATEST) += dmatest.o
- obj-$(CONFIG_INTEL_IOATDMA) += ioat/
- obj-$(CONFIG_INTEL_IOP_ADMA) += iop-adma.o
- obj-$(CONFIG_FSL_DMA) += fsldma.o
- obj-$(CONFIG_HSU_DMA) += hsu/
- obj-$(CONFIG_MPC512X_DMA) += mpc512x_dma.o
- obj-$(CONFIG_PPC_BESTCOMM) += bestcomm/
- obj-$(CONFIG_MV_XOR) += mv_xor.o
- obj-$(CONFIG_IDMA64) += idma64.o
- obj-$(CONFIG_DW_DMAC_CORE) += dw/
+ 
+ #devices
+ obj-$(CONFIG_AMBA_PL08X) += amba-pl08x.o
+ obj-$(CONFIG_AMCC_PPC440SPE_ADMA) += ppc4xx/
  obj-$(CONFIG_AT_HDMAC) += at_hdmac.o
  obj-$(CONFIG_AT_XDMAC) += at_xdmac.o
- obj-$(CONFIG_MX3_IPU) += ipu/
- obj-$(CONFIG_TXX9_DMAC) += txx9dmac.o
- obj-$(CONFIG_RENESAS_DMA) += sh/
+ obj-$(CONFIG_AXI_DMAC) += dma-axi-dmac.o
  obj-$(CONFIG_COH901318) += coh901318.o coh901318_lli.o
- obj-$(CONFIG_AMCC_PPC440SPE_ADMA) += ppc4xx/
- obj-$(CONFIG_IMX_SDMA) += imx-sdma.o
+ obj-$(CONFIG_DMA_BCM2835) += bcm2835-dma.o
+ obj-$(CONFIG_DMA_JZ4740) += dma-jz4740.o
+ obj-$(CONFIG_DMA_JZ4780) += dma-jz4780.o
+ obj-$(CONFIG_DMA_OMAP) += omap-dma.o
+ obj-$(CONFIG_DMA_SA11X0) += sa11x0-dma.o
+ obj-$(CONFIG_DMA_SUN4I) += sun4i-dma.o
+ obj-$(CONFIG_DMA_SUN6I) += sun6i-dma.o
+ obj-$(CONFIG_DW_DMAC_CORE) += dw/
+ obj-$(CONFIG_EP93XX_DMA) += ep93xx_dma.o
+ obj-$(CONFIG_FSL_DMA) += fsldma.o
+ obj-$(CONFIG_FSL_EDMA) += fsl-edma.o
+ obj-$(CONFIG_FSL_RAID) += fsl_raid.o
+ obj-$(CONFIG_HSU_DMA) += hsu/
++obj-$(CONFIG_IDMA64) += idma64.o
+ obj-$(CONFIG_IMG_MDC_DMA) += img-mdc-dma.o
  obj-$(CONFIG_IMX_DMA) += imx-dma.o
+ obj-$(CONFIG_IMX_SDMA) += imx-sdma.o
+ obj-$(CONFIG_INTEL_IOATDMA) += ioat/
+ obj-$(CONFIG_INTEL_IOP_ADMA) += iop-adma.o
+ obj-$(CONFIG_INTEL_MIC_X100_DMA) += mic_x100_dma.o
+ obj-$(CONFIG_K3_DMA) += k3dma.o
+ obj-$(CONFIG_LPC18XX_DMAMUX) += lpc18xx-dmamux.o
+ obj-$(CONFIG_MMP_PDMA) += mmp_pdma.o
+ obj-$(CONFIG_MMP_TDMA) += mmp_tdma.o
+ obj-$(CONFIG_MOXART_DMA) += moxart-dma.o
+ obj-$(CONFIG_MPC512X_DMA) += mpc512x_dma.o
+ obj-$(CONFIG_MV_XOR) += mv_xor.o
  obj-$(CONFIG_MXS_DMA) += mxs-dma.o
+ obj-$(CONFIG_MX3_IPU) += ipu/
+ obj-$(CONFIG_NBPFAXI_DMA) += nbpfaxi.o
+ obj-$(CONFIG_PCH_DMA) += pch_dma.o
+ obj-$(CONFIG_PL330_DMA) += pl330.o
+ obj-$(CONFIG_PPC_BESTCOMM) += bestcomm/
  obj-$(CONFIG_PXA_DMA) += pxa_dma.o
- obj-$(CONFIG_TIMB_DMA) += timb_dma.o
+ obj-$(CONFIG_QCOM_BAM_DMA) += qcom_bam_dma.o
+ obj-$(CONFIG_RENESAS_DMA) += sh/
  obj-$(CONFIG_SIRF_DMA) += sirf-dma.o
- obj-$(CONFIG_TI_EDMA) += edma.o
  obj-$(CONFIG_STE_DMA40) += ste_dma40.o ste_dma40_ll.o
- obj-$(CONFIG_TEGRA20_APB_DMA) += tegra20-apb-dma.o
  obj-$(CONFIG_S3C24XX_DMAC) += s3c24xx-dma.o
- obj-$(CONFIG_PL330_DMA) += pl330.o
- obj-$(CONFIG_PCH_DMA) += pch_dma.o
- obj-$(CONFIG_AMBA_PL08X) += amba-pl08x.o
- obj-$(CONFIG_EP93XX_DMA) += ep93xx_dma.o
- obj-$(CONFIG_DMA_SA11X0) += sa11x0-dma.o
- obj-$(CONFIG_MMP_TDMA) += mmp_tdma.o
- obj-$(CONFIG_DMA_OMAP) += omap-dma.o
- obj-$(CONFIG_TI_DMA_CROSSBAR) += ti-dma-crossbar.o
- obj-$(CONFIG_DMA_BCM2835) += bcm2835-dma.o
- obj-$(CONFIG_MMP_PDMA) += mmp_pdma.o
- obj-$(CONFIG_DMA_JZ4740) += dma-jz4740.o
- obj-$(CONFIG_DMA_JZ4780) += dma-jz4780.o
+ obj-$(CONFIG_TXX9_DMAC) += txx9dmac.o
+ obj-$(CONFIG_TEGRA20_APB_DMA) += tegra20-apb-dma.o
+ obj-$(CONFIG_TIMB_DMA) += timb_dma.o
  obj-$(CONFIG_TI_CPPI41) += cppi41.o
- obj-$(CONFIG_K3_DMA) += k3dma.o
- obj-$(CONFIG_MOXART_DMA) += moxart-dma.o
- obj-$(CONFIG_FSL_RAID) += fsl_raid.o
- obj-$(CONFIG_FSL_EDMA) += fsl-edma.o
- obj-$(CONFIG_QCOM_BAM_DMA) += qcom_bam_dma.o
- obj-y += xilinx/
- obj-$(CONFIG_INTEL_MIC_X100_DMA) += mic_x100_dma.o
- obj-$(CONFIG_NBPFAXI_DMA) += nbpfaxi.o
- obj-$(CONFIG_DMA_SUN6I) += sun6i-dma.o
- obj-$(CONFIG_IMG_MDC_DMA) += img-mdc-dma.o
+ obj-$(CONFIG_TI_DMA_CROSSBAR) += ti-dma-crossbar.o
+ obj-$(CONFIG_TI_EDMA) += edma.o
  obj-$(CONFIG_XGENE_DMA) += xgene-dma.o
+ obj-$(CONFIG_ZX_DMA) += zx296702_dma.o
+ 
+ obj-y += xilinx/
