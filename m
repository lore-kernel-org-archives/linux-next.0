From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pcmcia tree build failure
Date: Fri, 29 Aug 2008 16:36:58 +1000
Message-ID: <20080829163658.c8ea1bba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33363 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751395AbYH2GhE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Aug 2008 02:37:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org

Hi Dominik,

Today's linux-next build (x86_64 allmodconfig) failed like this:

sound/pcmcia/vx/vxpocket.c: In function 'vxpocket_config':
sound/pcmcia/vx/vxpocket.c:238: error: implicit declaration of function 'handle_to_dev'
sound/pcmcia/vx/vxpocket.c:238: error: invalid lvalue in unary '&'
sound/pcmcia/pdaudiocf/pdaudiocf.c: In function 'snd_pdacf_probe':
sound/pcmcia/pdaudiocf/pdaudiocf.c:131: error: implicit declaration of function 'handle_to_dev'
sound/pcmcia/pdaudiocf/pdaudiocf.c:131: error: invalid lvalue in unary '&'
drivers/char/pcmcia/cm4040_cs.c: In function 'cm4040_config_check':
drivers/char/pcmcia/cm4040_cs.c:550: error: implicit declaration of function 'handle_to_dev'
drivers/char/pcmcia/cm4040_cs.c:550: error: invalid lvalue in unary '&'
drivers/char/pcmcia/cm4040_cs.c:550: error: invalid lvalue in unary '&'
drivers/char/pcmcia/cm4040_cs.c: In function 'reader_config':
drivers/char/pcmcia/cm4040_cs.c:572: error: invalid lvalue in unary '&'
drivers/char/pcmcia/cm4040_cs.c:572: error: invalid lvalue in unary '&'

Caused by commit 86b736d122166ec779bd86ac24e24117a675e98d ("pcmcia:
cleanup device driver header file") which removed the handle_to_dev()
macro.  I applied the following patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 29 Aug 2008 16:34:12 +1000
Subject: [PATCH] pcmcia: restore handle_to_dev macro

It is still in widespread use.

It was removed by commit 86b736d122166ec779bd86ac24e24117a675e98d
("pcmcia: cleanup device driver header file").

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/pcmcia/ds.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/pcmcia/ds.h b/include/pcmcia/ds.h
index 13c01ab..374a7cc 100644
--- a/include/pcmcia/ds.h
+++ b/include/pcmcia/ds.h
@@ -137,6 +137,7 @@ struct pcmcia_device {
 #define to_pcmcia_dev(n) container_of(n, struct pcmcia_device, dev)
 #define to_pcmcia_drv(n) container_of(n, struct pcmcia_driver, drv)
 
+#define handle_to_dev(handle) (handle->dev)
 
 /* (deprecated) error reporting by PCMCIA devices. Use dev_printk()
  * or dev_dbg() directly in the driver, without referring to pcmcia_error_func()
-- 
1.5.6.5
