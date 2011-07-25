From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] watchdog: fix it8712f_wdt build errors
Date: Mon, 25 Jul 2011 09:19:27 -0700
Message-ID: <20110725091927.e154fd28.rdunlap@xenotime.net>
References: <20110725162542.39ea8d8cbd51604523635c1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110725162542.39ea8d8cbd51604523635c1a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, jorge@dti2.net, Wim Van Sebroeck <wim@iguana.be>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-watchdog@vger.kernel.org, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix build errors by adding missing header file:

drivers/watchdog/it8712f_wdt.c:127: error: implicit declaration of function 'request_muxed_region'
drivers/watchdog/it8712f_wdt.c:141: error: implicit declaration of function 'release_region'
drivers/watchdog/it8712f_wdt.c:412: error: implicit declaration of function 'request_region'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/watchdog/it8712f_wdt.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110725.orig/drivers/watchdog/it8712f_wdt.c
+++ linux-next-20110725/drivers/watchdog/it8712f_wdt.c
@@ -31,6 +31,7 @@
 #include <linux/spinlock.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
+#include <linux/ioport.h>
 
 #define NAME "it8712f_wdt"
 
