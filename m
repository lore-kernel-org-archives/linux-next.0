From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the regmap tree
Date: Mon, 6 Nov 2017 11:52:14 +1100
Message-ID: <20171106115214.19cb007a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42513 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750857AbdKFAwR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Nov 2017 19:52:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Mark,

After merging the regmap tree, today's linux-next build
(arm_multi_v7_defconfig) produced this warning:

drivers/gpio/Kconfig:13:error: recursive dependency detected!
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpio/Kconfig:13:	symbol GPIOLIB is selected by PINCTRL_SUNXI
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/pinctrl/sunxi/Kconfig:3:	symbol PINCTRL_SUNXI is selected by PINCTRL_SUN6I_A31_R
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/pinctrl/sunxi/Kconfig:21:	symbol PINCTRL_SUN6I_A31_R depends on RESET_CONTROLLER
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/reset/Kconfig:4:	symbol RESET_CONTROLLER is selected by QCOM_SCM
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/firmware/Kconfig:205:	symbol QCOM_SCM is selected by QCOM_ADSP_PIL
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/remoteproc/Kconfig:90:	symbol QCOM_ADSP_PIL depends on QCOM_SMEM
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/soc/qcom/Kconfig:49:	symbol QCOM_SMEM depends on HWSPINLOCK
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/hwspinlock/Kconfig:5:	symbol HWSPINLOCK is selected by REGMAP
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/base/regmap/Kconfig:6:	symbol REGMAP is selected by PINCTRL_SX150X
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/pinctrl/Kconfig:227:	symbol PINCTRL_SX150X is selected by GPIO_SX150X
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpio/Kconfig:821:	symbol GPIO_SX150X depends on GPIOLIB
warning: (ARCH_VEXPRESS) selects MFD_VEXPRESS_SYSREG which has unmet direct dependencies (HAS_IOMEM && VEXPRESS_CONFIG && GPIOLIB && !ARCH_USES_GETTIMEOFFSET)
warning: (ARCH_NOMADIK && ARCH_U8500) selects PINCTRL_NOMADIK which has unmet direct dependencies (PINCTRL && (ARCH_U8500 || ARCH_NOMADIK) && OF && GPIOLIB)
warning: (PINCTRL_AT91 && PINCTRL_AT91PIO4 && PINCTRL_MESON && PINCTRL_OXNAS && PINCTRL_PISTACHIO && PINCTRL_PIC32 && PINCTRL_NOMADIK && PINCTRL_MTK && GPIO_TB10X) selects OF_GPIO which has unmet direct dependencies (GPIOLIB && OF && HAS_IOMEM)

Maybe introduced by commit

  f25637a6b89e ("regmap: Add a config option for hwspinlock")

-- 
Cheers,
Stephen Rothwell
