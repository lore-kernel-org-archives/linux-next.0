From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] staging: fix android persistent_ram printk formats
Date: Fri, 30 Mar 2012 10:31:32 -0700
Message-ID: <4F75EDF4.8020900@xenotime.net>
References: <20120330144443.4f9c6fdbd7f877e00b79b6da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:60552 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1756560Ab2C3Rbg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Mar 2012 13:31:36 -0400
In-Reply-To: <20120330144443.4f9c6fdbd7f877e00b79b6da@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Brian Swetland <swetland@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warnings in android/persistent_ram.c:

drivers/staging/android/persistent_ram.c:426:4: warning: format '%ld' expects type 'long int', but argument 2 has type 'size_t'
drivers/staging/android/persistent_ram.c:426:4: warning: format '%ld' expects type 'long int', but argument 3 has type 'size_t'
drivers/staging/android/persistent_ram.c:430:4: warning: format '%ld' expects type 'long int', but argument 2 has type 'size_t'
drivers/staging/android/persistent_ram.c:430:4: warning: format '%ld' expects type 'long int', but argument 3 has type 'size_t'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Brian Swetland <swetland@google.com>
---
 drivers/staging/android/persistent_ram.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20120330.orig/drivers/staging/android/persistent_ram.c
+++ linux-next-20120330/drivers/staging/android/persistent_ram.c
@@ -424,11 +424,11 @@ struct persistent_ram_zone *__persistent
 		if (buffer_size(prz) > prz->buffer_size ||
 		    buffer_start(prz) > buffer_size(prz))
 			pr_info("persistent_ram: found existing invalid buffer,"
-				" size %ld, start %ld\n",
+				" size %zu, start %zu\n",
 			       buffer_size(prz), buffer_start(prz));
 		else {
 			pr_info("persistent_ram: found existing buffer,"
-				" size %ld, start %ld\n",
+				" size %zu, start %zu\n",
 			       buffer_size(prz), buffer_start(prz));
 			persistent_ram_save_old(prz);
 		}
