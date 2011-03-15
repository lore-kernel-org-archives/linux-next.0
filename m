From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next RESEND/still needed] staging: altera-jtag needs
 delay.h
Date: Tue, 15 Mar 2011 09:48:59 -0700
Message-ID: <20110315094859.21da133f.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:45289 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932139Ab1COQtQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Mar 2011 12:49:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Igor M. Liplianin" <liplianin@netup.ru>

From: Randy Dunlap <randy.dunlap@oracle.com>

altera-jtag.c needs to include <linux/delay.h> to fix a build error:

drivers/staging/altera-stapl/altera-jtag.c:398: error: implicit declaration of function 'udelay'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Igor M. Liplianin <liplianin@netup.ru>
---
 drivers/staging/altera-stapl/altera-jtag.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110304.orig/drivers/staging/altera-stapl/altera-jtag.c
+++ linux-next-20110304/drivers/staging/altera-stapl/altera-jtag.c
@@ -23,6 +23,7 @@
  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
+#include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/slab.h>
 #include <staging/altera.h>
--
