From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] media: fix em28xx build, needs interrupt.h
Date: Tue, 7 Dec 2010 10:38:15 -0800
Message-ID: <20101207103815.26054c38.randy.dunlap@oracle.com>
References: <20101206140055.34289498.sfr@canb.auug.org.au>
	<AANLkTi=XkxnHZGTEsrrRmPGQePitzb=akyS99_Qd6ROy@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=XkxnHZGTEsrrRmPGQePitzb=akyS99_Qd6ROy@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

drivers/media/video/em28xx/em28xx-vbi.c:49: error: implicit declaration of function 'in_interrupt'

Reported-by: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/media/video/em28xx/em28xx-vbi.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20101207.orig/drivers/media/video/em28xx/em28xx-vbi.c
+++ linux-next-20101207/drivers/media/video/em28xx/em28xx-vbi.c
@@ -24,6 +24,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 
 #include "em28xx.h"
 
