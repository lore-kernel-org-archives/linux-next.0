From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Wed, 14 Sep 2016 14:27:47 +1000
Message-ID: <20160914142747.1553f1c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-next.vger.kernel.org

Hi Rafael,

After merging the pm tree, today's linux-next build (powerpc allyesconfig)
failed like this:

drivers/devfreq/tegra-devfreq.c: In function 'tegra_devfreq_target':
drivers/devfreq/tegra-devfreq.c:500:2: error: implicit declaration of function 'clk_set_min_rate' [-Werror=implicit-function-declaration]
  clk_set_min_rate(tegra->emc_clock, rate);
  ^

Caused by commit

  797da5598f3a ("PM / devfreq: Add COMPILE_TEST for build coverage")

clk_set_min_rate() usage depends on CONFIG_HAVE_CLK.

I added the following for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 14 Sep 2016 14:22:25 +1000
Subject: [PATCH] partial revert of 797da5598f3a ("PM / devfreq: Add
 COMPILE_TEST for build coverage")

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/devfreq/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index cadd56e50b2c..93b6ada06676 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -92,7 +92,7 @@ config ARM_EXYNOS_BUS_DEVFREQ
 
 config ARM_TEGRA_DEVFREQ
 	tristate "Tegra DEVFREQ Driver"
-	depends on ARCH_TEGRA_124_SOC || COMPILE_TEST
+	depends on ARCH_TEGRA_124_SOC
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select PM_OPP
 	help
-- 
2.8.1




-- 
Cheers,
Stephen Rothwell
