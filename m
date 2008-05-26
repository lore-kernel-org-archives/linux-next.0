From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ofa-general] Re: linux-next: [PATCH] infiniband/hw/ipath/ipath_sdma.c , fix compiler warnings
Date: Mon, 26 May 2008 15:21:15 -0700
Message-ID: <adabq2s4sh0.fsf@cisco.com>
References: <48342C6C.2010502@googlemail.com> <adave14apdr.fsf@cisco.com>
	<1211579101.3949.326.camel@brick.pathscale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-3.cisco.com ([171.71.176.72]:14975 "EHLO
	sj-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755247AbYEZWVQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 May 2008 18:21:16 -0400
In-Reply-To: <1211579101.3949.326.camel@brick.pathscale.com> (Ralph Campbell's
	message of "Fri, 23 May 2008 14:45:01 -0700")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralph Campbell <ralph.campbell@qlogic.com>
Cc: Gabriel C <nix.or.die@googlemail.com>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, general@lists.openfabrics.org, Linux Kernel list <linux-kernel@vger.kernel.org>

OK, I added the following to my tree:

commit e8ffef73c8dd2c2d00287829db87cdaf229d3859
Author: Roland Dreier <rolandd@cisco.com>
Date:   Mon May 26 15:20:34 2008 -0700

    IB/ipath: Avoid test_bit() on u64 SDMA status value
    
    Gabriel C <nix.or.die@googlemail.com> pointed out that when the x86
    bitops are updated to operate on unsigned long, the code in
    sdma_abort_task() will produce warnings:
    
        drivers/infiniband/hw/ipath/ipath_sdma.c: In function 'sdma_abort_task':
        drivers/infiniband/hw/ipath/ipath_sdma.c:267: warning: passing argument 2 of 'constant_test_bit' from incompatible pointer type
    
    and so on, because it uses test_bit() to operation on a u64 value
    (returned by ipath_read_kref64() for a hardware register).
    
    Fix up these warnings by converting the test_bit() operations to &ing
    with appropriate symbolic defines of the bits within the hardware
    register.  This has the benign side-effect of making the code more
    self-documenting as well.
    
    Signed-off-by: Roland Dreier <rolandd@cisco.com>

diff --git a/drivers/infiniband/hw/ipath/ipath_kernel.h b/drivers/infiniband/hw/ipath/ipath_kernel.h
index 59a8b25..0bd8bcb 100644
--- a/drivers/infiniband/hw/ipath/ipath_kernel.h
+++ b/drivers/infiniband/hw/ipath/ipath_kernel.h
@@ -232,6 +232,11 @@ struct ipath_sdma_desc {
 #define IPATH_SDMA_TXREQ_S_ABORTED   2
 #define IPATH_SDMA_TXREQ_S_SHUTDOWN  3
 
+#define IPATH_SDMA_STATUS_SCORE_BOARD_DRAIN_IN_PROG	(1ull << 63)
+#define IPATH_SDMA_STATUS_ABORT_IN_PROG			(1ull << 62)
+#define IPATH_SDMA_STATUS_INTERNAL_SDMA_ENABLE		(1ull << 61)
+#define IPATH_SDMA_STATUS_SCB_EMPTY			(1ull << 30)
+
 /* max dwords in small buffer packet */
 #define IPATH_SMALLBUF_DWORDS (dd->ipath_piosize2k >> 2)
 
diff --git a/drivers/infiniband/hw/ipath/ipath_sdma.c b/drivers/infiniband/hw/ipath/ipath_sdma.c
index 0a8c1b8..eaba032 100644
--- a/drivers/infiniband/hw/ipath/ipath_sdma.c
+++ b/drivers/infiniband/hw/ipath/ipath_sdma.c
@@ -263,14 +263,10 @@ static void sdma_abort_task(unsigned long opaque)
 		hwstatus = ipath_read_kreg64(dd,
 				dd->ipath_kregs->kr_senddmastatus);
 
-		if (/* ScoreBoardDrainInProg */
-		    test_bit(63, &hwstatus) ||
-		    /* AbortInProg */
-		    test_bit(62, &hwstatus) ||
-		    /* InternalSDmaEnable */
-		    test_bit(61, &hwstatus) ||
-		    /* ScbEmpty */
-		    !test_bit(30, &hwstatus)) {
+		if ((hwstatus & (IPATH_SDMA_STATUS_SCORE_BOARD_DRAIN_IN_PROG |
+				 IPATH_SDMA_STATUS_ABORT_IN_PROG	     |
+				 IPATH_SDMA_STATUS_INTERNAL_SDMA_ENABLE)) ||
+		    !(hwstatus & IPATH_SDMA_STATUS_SCB_EMPTY)) {
 			if (dd->ipath_sdma_reset_wait > 0) {
 				/* not done shutting down sdma */
 				--dd->ipath_sdma_reset_wait;
