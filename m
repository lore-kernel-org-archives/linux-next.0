From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: [PATCH -next] staging/iio/adc: MXS_LRADC depends on INPUT
Date: Mon, 21 Oct 2013 21:49:47 -0700
Message-ID: <526603EB.3060504@infradead.org>
References: <CA+r1Zhjo08EEoHsWkeDDKoc8Le6eDq4fZxZaa1Jc8cfOLsLsMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+r1Zhjo08EEoHsWkeDDKoc8Le6eDq4fZxZaa1Jc8cfOLsLsMg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Davis <jim.epost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>

mxs-lradc.c uses many input_() functions so it should
depend on INPUT to fix build errors.

drivers/built-in.o: In function `mxs_lradc_ts_unregister':
drivers/staging/iio/adc/mxs-lradc.c:905: undefined reference to `input_unregister_device'
drivers/staging/iio/adc/mxs-lradc.c:905: undefined reference to `input_unregister_device'
drivers/built-in.o: In function `input_report_abs':
include/linux/input.h:399: undefined reference to `input_event'
include/linux/input.h:399: undefined reference to `input_event'
include/linux/input.h:399: undefined reference to `input_event'
drivers/built-in.o: In function `input_report_key':
include/linux/input.h:389: undefined reference to `input_event'
drivers/built-in.o: In function `input_sync':
include/linux/input.h:414: undefined reference to `input_event'
drivers/built-in.o:include/linux/input.h:389: more undefined references to `input_event' follow

Signed-off-by: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
---
 drivers/staging/iio/adc/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- next-2013-1021.orig/drivers/staging/iio/adc/Kconfig
+++ next-2013-1021/drivers/staging/iio/adc/Kconfig
@@ -114,6 +114,7 @@ config LPC32XX_ADC
 config MXS_LRADC
 	tristate "Freescale i.MX23/i.MX28 LRADC"
 	depends on ARCH_MXS || COMPILE_TEST
+	depends on INPUT
 	select STMP_DEVICE
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
