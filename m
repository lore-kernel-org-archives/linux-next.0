From: Gerard Snitselaar <dev-RR6//3E8fTwgb5+hjvvj3w@public.gmane.org>
Subject: [PATCH] iio: dac: ad5064: fix section mismatch in ad5064_init() in linux-next
Date: Tue, 10 Jul 2012 21:05:02 -0700
Message-ID: <1341979502-27440-1-git-send-email-dev@snitselaar.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org
List-Id: linux-next.vger.kernel.org

ad5064_init() calls ad5064_spi_unregister_driver() which is annotated
__exit.

Signed-off-by: Gerard Snitselaar <dev-RR6//3E8fTwgb5+hjvvj3w@public.gmane.org>
---
 drivers/iio/dac/ad5064.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ad5064.c b/drivers/iio/dac/ad5064.c
index aa739c4..6ec1319 100644
--- a/drivers/iio/dac/ad5064.c
+++ b/drivers/iio/dac/ad5064.c
@@ -582,7 +582,7 @@ static int __init ad5064_spi_register_driver(void)
 	return spi_register_driver(&ad5064_spi_driver);
 }
 
-static void __exit ad5064_spi_unregister_driver(void)
+static void ad5064_spi_unregister_driver(void)
 {
 	spi_unregister_driver(&ad5064_spi_driver);
 }
-- 
1.7.11.1.165.g299666c
