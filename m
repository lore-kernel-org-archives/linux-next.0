From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 1/2] iio: adc: stm32-dfsdm: fix unmet direct dependencies detected
Date: Mon, 15 Apr 2019 15:00:50 +0200
Message-ID: <1555333251-4422-2-git-send-email-fabrice.gasnier@st.com>
References: <1555333251-4422-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555333251-4422-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, rdunlap@infradead.org
Cc: sfr@canb.auug.org.au, benjamin.gaignard@linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, fabrice.gasnier@st.com, linux-iio@vger.kernel.org, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com, olivier.moysan@st.com
List-Id: linux-next.vger.kernel.org

This fixes unmet direct dependencies seen when CONFIG_STM32_DFSDM_ADC
is selected:

WARNING: unmet direct dependencies detected for IIO_BUFFER_HW_CONSUMER
  Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
  Selected by [y]:
  - STM32_DFSDM_ADC [=y] && IIO [=y] && (ARCH_STM32 [=y] && OF [=y] ||
    COMPILE_TEST [=n])

Fixes: e2e6771c6462 ("IIO: ADC: add STM32 DFSDM sigma delta ADC support")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/iio/adc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 846c7ac..b1b2bde 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -821,6 +821,7 @@ config STM32_DFSDM_ADC
 	depends on (ARCH_STM32 && OF) || COMPILE_TEST
 	select STM32_DFSDM_CORE
 	select REGMAP_MMIO
+	select IIO_BUFFER
 	select IIO_BUFFER_HW_CONSUMER
 	help
 	  Select this option to support ADCSigma delta modulator for
-- 
2.7.4
