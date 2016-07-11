From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tegra tree with the samsung-krzk
 tree
Date: Tue, 12 Jul 2016 09:59:57 +1000
Message-ID: <20160712095957.45b82b26@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tegra tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  426f754be0bc ("arm64: defconfig: Enable more IP blocks for Exynos7 and Exynos5433")

from the samsung-krzk tree and commit:

  10a7b37b5b96 ("arm64: Update default configuration")

from the tegra tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index 2651febaa7b8,1cf5730976b5..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -191,11 -184,10 +192,12 @@@ CONFIG_SPI_ORION=
  CONFIG_SPI_PL022=y
  CONFIG_SPI_QUP=y
  CONFIG_SPI_SPIDEV=m
 +CONFIG_SPI_S3C64XX=y
  CONFIG_SPMI=y
  CONFIG_PINCTRL_SINGLE=y
+ CONFIG_PINCTRL_MAX77620=y
  CONFIG_PINCTRL_MSM8916=y
 +CONFIG_PINCTRL_MSM8996=y
  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
  CONFIG_GPIO_SYSFS=y
  CONFIG_GPIO_DWAPB=y
@@@ -213,14 -208,17 +219,19 @@@ CONFIG_THERMAL_EMULATION=
  CONFIG_EXYNOS_THERMAL=y
  CONFIG_WATCHDOG=y
  CONFIG_RENESAS_WDT=y
 +CONFIG_S3C2410_WATCHDOG=y
+ CONFIG_MFD_MAX77620=y
  CONFIG_MFD_SPMI_PMIC=y
  CONFIG_MFD_SEC_CORE=y
  CONFIG_MFD_HI655X_PMIC=y
  CONFIG_REGULATOR=y
+ CONFIG_MFD_CROS_EC=y
+ CONFIG_MFD_CROS_EC_I2C=y
  CONFIG_REGULATOR_FIXED_VOLTAGE=y
 +CONFIG_REGULATOR_GPIO=y
  CONFIG_REGULATOR_HI655X=y
+ CONFIG_REGULATOR_MAX77620=y
+ CONFIG_REGULATOR_PWM=y
  CONFIG_REGULATOR_QCOM_SMD_RPM=y
  CONFIG_REGULATOR_QCOM_SPMI=y
  CONFIG_REGULATOR_S2MPS11=y
@@@ -240,7 -243,7 +257,8 @@@ CONFIG_USB=
  CONFIG_USB_OTG=y
  CONFIG_USB_XHCI_HCD=y
  CONFIG_USB_XHCI_RCAR=y
+ CONFIG_USB_XHCI_TEGRA=y
 +CONFIG_USB_EHCI_EXYNOS=y
  CONFIG_USB_EHCI_HCD=y
  CONFIG_USB_EHCI_MSM=y
  CONFIG_USB_EHCI_HCD_PLATFORM=y
@@@ -285,8 -286,8 +304,9 @@@ CONFIG_RTC_DRV_DS3232=
  CONFIG_RTC_DRV_EFI=y
  CONFIG_RTC_DRV_PL031=y
  CONFIG_RTC_DRV_SUN6I=y
+ CONFIG_RTC_DRV_TEGRA=y
  CONFIG_RTC_DRV_XGENE=y
 +CONFIG_RTC_DRV_S3C=y
  CONFIG_DMADEVICES=y
  CONFIG_PL330_DMA=y
  CONFIG_TEGRA20_APB_DMA=y
@@@ -321,12 -322,9 +343,13 @@@ CONFIG_COMMON_RESET_HI6220=
  CONFIG_PHY_RCAR_GEN3_USB2=y
  CONFIG_PHY_HI6220_USB=y
  CONFIG_PHY_XGENE=y
+ CONFIG_PHY_TEGRA_XUSB=y
  CONFIG_ARM_SCPI_PROTOCOL=y
  CONFIG_ACPI=y
 +CONFIG_IIO=y
 +CONFIG_EXYNOS_ADC=y
 +CONFIG_PWM=y
 +CONFIG_PWM_SAMSUNG=y
  CONFIG_EXT2_FS=y
  CONFIG_EXT3_FS=y
  CONFIG_FANOTIFY=y
