From: David Vrabel <david.vrabel@csr.com>
Subject: Re: linux-next: usb/sparc build failure
Date: Tue, 27 May 2008 18:41:39 +0100
Message-ID: <483C47D3.2090705@csr.com>
References: <20080527202630.6352736d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090706060506010803040506"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cluster-g.mailcontrol.com ([85.115.41.190]:46660 "EHLO
	cluster-g.mailcontrol.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754475AbYE0RmV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 May 2008 13:42:21 -0400
Received: from rly26g.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
	by rly26g.srv.mailcontrol.com (MailControl) with ESMTP id m4RHg1YX016645
	for <linux-next@vger.kernel.org>; Tue, 27 May 2008 18:42:19 +0100
Received: from submission.mailcontrol.com (submission.mailcontrol.com [86.111.216.190])
	by rly26g.srv.mailcontrol.com (MailControl) id m4RHfgEi015783
	for linux-next@vger.kernel.org; Tue, 27 May 2008 18:41:42 +0100
In-Reply-To: <20080527202630.6352736d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

This is a multi-part message in MIME format.
--------------090706060506010803040506
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's (though it is not new) linux-next build (spac allmodconfig) fails
> like this:
> 
> drivers/uwb/whci.c:166: error: `DMA_64BIT_MASK' undeclared (first use in this function)
> drivers/uwb/whci.c:166: error: (Each undeclared identifier is reported only once
> drivers/uwb/whci.c:166: error: for each function it appears in.)
> drivers/uwb/whci.c:168: error: `DMA_32BIT_MASK' undeclared (first use in this function)
> drivers/uwb/whc-rc.c:268: error: implicit declaration of function `dma_alloc_coherent'
> drivers/uwb/whc-rc.c:286: error: implicit declaration of function `dma_free_coherent'
> drivers/usb/host/whci/pzl.c:372: error: implicit declaration of function `dma_alloc_coherent'
> drivers/usb/host/whci/pzl.c:395: error: implicit declaration of function `dma_free_coherent'
> drivers/usb/host/whci/init.c:132: error: implicit declaration of function `dma_alloc_coherent'
> drivers/usb/host/whci/init.c:162: error: implicit declaration of function `dma_free_coherent'
> drivers/usb/host/whci/hw.c:48: error: implicit declaration of function `dma_map_single'
> drivers/usb/host/whci/hw.c:48: error: `DMA_TO_DEVICE' undeclared (first use in this function)
> drivers/usb/host/whci/hw.c:48: error: (Each undeclared identifier is reported only once
> drivers/usb/host/whci/hw.c:48: error: for each function it appears in.)
> drivers/usb/host/whci/hw.c:78: error: implicit declaration of function `dma_unmap_single'
> drivers/usb/host/whci/qset.c:274: error: implicit declaration of function `dma_unmap_single'
> drivers/usb/host/whci/qset.c:276: error: `DMA_TO_DEVICE' undeclared (first use in this function)
> drivers/usb/host/whci/qset.c:276: error: (Each undeclared identifier is reported only once
> drivers/usb/host/whci/qset.c:276: error: for each function it appears in.)
> drivers/usb/host/whci/qset.c:326: error: implicit declaration of function `dma_map_single'
> drivers/usb/host/whci/qset.c:326: error: `DMA_TO_DEVICE' undeclared (first use in this function)
> 
> I suspect that these files should include linux/dma-mapping.h directly
> since it uses things from there.

How odd.  Looking at my local patch set this has been fixed but looking
at the patches Greg has and I see it's not.  Try this.

I also note that some architectures (sparc amongst them) will BUG with
these drivers as the DMA API is only available to PCI devices. The
whc-rc and whci-hcd drivers use umc devices which are children of a PCI
device.

David
-- 
David Vrabel, Senior Software Engineer, Drivers
CSR, Churchill House, Cambridge Business Park,  Tel: +44 (0)1223 692562
Cowley Road, Cambridge, CB4 0WZ                 http://www.csr.com/

--------------090706060506010803040506
Content-Type: text/x-patch;
 name="whci-include-linux-dma-mapping.h.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="whci-include-linux-dma-mapping.h.patch"

UWB/WUSB: WHCI drivers should include linux/dma-mapping.h

The WHCI HCD and RC drivers use the DMA API and should include
linux/dma-mapping.h.

Signed-off-by: David Vrabel <david.vrabel@csr.com>
---
 drivers/usb/host/whci/asl.c  |    1 +
 drivers/usb/host/whci/hw.c   |    3 +--
 drivers/usb/host/whci/init.c |    3 +--
 drivers/usb/host/whci/pzl.c  |    1 +
 drivers/usb/host/whci/qset.c |    1 +
 drivers/uwb/whc-rc.c         |    1 +
 drivers/uwb/whci.c           |    1 +
 7 files changed, 7 insertions(+), 4 deletions(-)

Index: linux-next/drivers/usb/host/whci/asl.c
===================================================================
--- linux-next.orig/drivers/usb/host/whci/asl.c	2008-05-27 18:12:59.000000000 +0100
+++ linux-next/drivers/usb/host/whci/asl.c	2008-05-27 18:13:08.000000000 +0100
@@ -16,6 +16,7 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #include <linux/kernel.h>
+#include <linux/dma-mapping.h>
 #include <linux/uwb/umc.h>
 #include <linux/usb.h>
 #define D_LOCAL 0
Index: linux-next/drivers/usb/host/whci/hw.c
===================================================================
--- linux-next.orig/drivers/usb/host/whci/hw.c	2008-05-27 18:14:09.000000000 +0100
+++ linux-next/drivers/usb/host/whci/hw.c	2008-05-27 18:14:24.000000000 +0100
@@ -15,9 +15,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
-#include <linux/version.h>
 #include <linux/kernel.h>
-#include <linux/init.h>
+#include <linux/dma-mapping.h>
 #include <linux/uwb/umc.h>
 
 #include "../../wusbcore/wusbhc.h"
Index: linux-next/drivers/usb/host/whci/init.c
===================================================================
--- linux-next.orig/drivers/usb/host/whci/init.c	2008-05-27 18:13:28.000000000 +0100
+++ linux-next/drivers/usb/host/whci/init.c	2008-05-27 18:13:56.000000000 +0100
@@ -15,9 +15,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
-#include <linux/version.h>
 #include <linux/kernel.h>
-#include <linux/init.h>
+#include <linux/dma-mapping.h>
 #include <linux/uwb/umc.h>
 
 #include "../../wusbcore/wusbhc.h"
Index: linux-next/drivers/usb/host/whci/pzl.c
===================================================================
--- linux-next.orig/drivers/usb/host/whci/pzl.c	2008-05-27 18:12:31.000000000 +0100
+++ linux-next/drivers/usb/host/whci/pzl.c	2008-05-27 18:12:54.000000000 +0100
@@ -16,6 +16,7 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #include <linux/kernel.h>
+#include <linux/dma-mapping.h>
 #include <linux/uwb/umc.h>
 #include <linux/usb.h>
 #define D_LOCAL 0
Index: linux-next/drivers/usb/host/whci/qset.c
===================================================================
--- linux-next.orig/drivers/usb/host/whci/qset.c	2008-05-27 18:13:12.000000000 +0100
+++ linux-next/drivers/usb/host/whci/qset.c	2008-05-27 18:13:21.000000000 +0100
@@ -16,6 +16,7 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 #include <linux/kernel.h>
+#include <linux/dma-mapping.h>
 #include <linux/uwb/umc.h>
 #include <linux/usb.h>
 
Index: linux-next/drivers/uwb/whci.c
===================================================================
--- linux-next.orig/drivers/uwb/whci.c	2008-05-27 18:12:06.000000000 +0100
+++ linux-next/drivers/uwb/whci.c	2008-05-27 18:12:18.000000000 +0100
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/uwb/whci.h>
 #include <linux/uwb/umc.h>
 #define D_LOCAL 0
Index: linux-next/drivers/uwb/whc-rc.c
===================================================================
--- linux-next.orig/drivers/uwb/whc-rc.c	2008-05-27 18:39:20.000000000 +0100
+++ linux-next/drivers/uwb/whc-rc.c	2008-05-27 18:39:34.000000000 +0100
@@ -43,6 +43,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/workqueue.h>
 #include <linux/uwb.h>

--------------090706060506010803040506--
