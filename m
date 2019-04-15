From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH] iio: trigger: stm32-timer: fix build issue when disabled
Date: Mon, 15 Apr 2019 11:47:22 +0200
Message-ID: <1555321642-482-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jic23@kernel.org, rdunlap@infradead.org
Cc: sfr@canb.auug.org.au, lars@metafoo.de, olivier.moysan@st.com, benjamin.gaignard@linaro.org, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, arnaud.pouliquen@st.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
List-Id: linux-next.vger.kernel.org

This fixes a build issue when CONFIG_IIO_STM32_TIMER_TRIGGER isn't set but
used in stm32-dfsdm-adc driver (e.g. CONFIG_STM32_DFSDM_ADC is set):
ERROR: "is_stm32_timer_trigger" [drivers/iio/adc/stm32-dfsdm-adc.ko]
undefined!

There are two possible options to fix this issue:
- select IIO_STM32_TIMER_TRIGGER along with CONFIG_STM32_DFSDM_ADC.
  This is what's being done currently for CONFIG_STM32_ADC.
- stub "is_stm32_timer_trigger" function

Choice is made to stub this function as suggested in [1]. This is also
inspired by similar "is_stm32_lptim_trigger" function (see [2]) in
include/linux/iio/timer/stm32-lptim-trigger.h

[1]
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1977377.html
[2] https://lkml.org/lkml/2017/9/10/124

Fixes: 11646e81d775 ("iio: adc: stm32-dfsdm: add support for buffer modes")

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fix-suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 include/linux/iio/timer/stm32-timer-trigger.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/linux/iio/timer/stm32-timer-trigger.h b/include/linux/iio/timer/stm32-timer-trigger.h
index d68add8..cbb7c7a 100644
--- a/include/linux/iio/timer/stm32-timer-trigger.h
+++ b/include/linux/iio/timer/stm32-timer-trigger.h
@@ -73,6 +73,15 @@
 
 #define TIM17_OC1	"tim17_oc1"
 
+#if IS_REACHABLE(CONFIG_IIO_STM32_TIMER_TRIGGER)
 bool is_stm32_timer_trigger(struct iio_trigger *trig);
-
+#else
+static inline bool is_stm32_timer_trigger(struct iio_trigger *trig)
+{
+#if IS_ENABLED(CONFIG_IIO_STM32_TIMER_TRIGGER)
+	pr_warn_once("stm32-timer-trigger not linked in\n");
+#endif
+	return false;
+}
+#endif
 #endif
-- 
2.7.4
