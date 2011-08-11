From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] xen: fix swiotlb printk and panic args
Date: Thu, 11 Aug 2011 13:57:07 -0700
Message-ID: <20110811135707.b6dfe39c.rdunlap@xenotime.net>
References: <20110811162058.42b462bc80e67d7a80ecff93@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <xen-devel-bounces@lists.xensource.com>
In-Reply-To: <20110811162058.42b462bc80e67d7a80ecff93@canb.auug.org.au>
List-Unsubscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xensource.com>
List-Help: <mailto:xen-devel-request@lists.xensource.com?subject=help>
List-Subscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=subscribe>
Sender: xen-devel-bounces@lists.xensource.com
Errors-To: xen-devel-bounces@lists.xensource.com
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, xen-devel@lists.xensource.com
Cc: linux-next@vger.kernel.org, Jeremy, LKML <linux-kernel@vger.kernel.org>, Fitzhardinge <jeremy.fitzhardinge@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk() and panic() args [swap them] to fix build warnings:

drivers/xen/swiotlb-xen.c:201: warning: format '%s' expects type 'char *', but argument 2 has type 'int'
drivers/xen/swiotlb-xen.c:201: warning: format '%d' expects type 'int', but argument 3 has type 'char *'
drivers/xen/swiotlb-xen.c:202: warning: format '%s' expects type 'char *', but argument 2 has type 'int'
drivers/xen/swiotlb-xen.c:202: warning: format '%d' expects type 'int', but argument 3 has type 'char *'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/xen/swiotlb-xen.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20110811.orig/drivers/xen/swiotlb-xen.c
+++ linux-next-20110811/drivers/xen/swiotlb-xen.c
@@ -198,8 +198,8 @@ error:
 		      (xen_io_tlb_nslabs << IO_TLB_SHIFT) >> 20);
 		goto retry;
 	}
-	xen_raw_printk("%s (rc:%d)", rc, m);
-	panic("%s (rc:%d)", rc, m);
+	xen_raw_printk("%s (rc:%d)", m, rc);
+	panic("%s (rc:%d)", m, rc);
 }
 
 void *
