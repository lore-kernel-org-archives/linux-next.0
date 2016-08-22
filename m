From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the samsung-krzk tree with the imx-mxs
 tree
Date: Mon, 22 Aug 2016 10:28:13 +1000
Message-ID: <20160822102813.4ffe9a4b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tuomas Tynkkynen <tuomas@tuxera.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the samsung-krzk tree got a conflict in:

  arch/arm/configs/multi_v7_defconfig

between commit:

  409a05fe10be ("ARM: multi_v7_defconfig: Enable ARM_IMX6Q_CPUFREQ")

from the imx-mxs tree and commit:

  08023fb9cec0 ("ARM: multi_v7_defconfig: Don't attempt to enable schedutil governor as module")

from the samsung-krzk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/configs/multi_v7_defconfig
index 7db8dce3da5f,6a055443f51b..000000000000
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@@ -135,8 -136,7 +136,8 @@@ CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=
  CONFIG_CPU_FREQ_GOV_POWERSAVE=m
  CONFIG_CPU_FREQ_GOV_USERSPACE=m
  CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
- CONFIG_CPU_FREQ_GOV_SCHEDUTIL=m
+ CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 +CONFIG_ARM_IMX6Q_CPUFREQ=y
  CONFIG_QORIQ_CPUFREQ=y
  CONFIG_CPU_IDLE=y
  CONFIG_ARM_CPUIDLE=y
