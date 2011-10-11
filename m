From: Wu Fengguang <fengguang.wu@intel.com>
Subject: Re: linux-next: build warnings after merge of the writeback tree
Date: Tue, 11 Oct 2011 17:17:25 +0800
Message-ID: <20111011091725.GA31349@localhost>
References: <20111011195704.67c267dbb3c6eaaacf5d7a39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:64046 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752419Ab1JKJR3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Oct 2011 05:17:29 -0400
Content-Disposition: inline
In-Reply-To: <20111011195704.67c267dbb3c6eaaacf5d7a39@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Stephen,

On Tue, Oct 11, 2011 at 04:57:04PM +0800, Stephen Rothwell wrote:
> Hi Wu,
> 
> After merging the writeback tree, today's linux-next build (powerpc
> allnoconfig) produced these warnings:
> 
> mm/page-writeback.c: In function 'bdi_position_ratio':
> mm/page-writeback.c:622:3: warning: comparison of distinct pointer types lacks a cast [enabled by default]
> page-writeback.c:635:4: warning: comparison of distinct pointer types lacks a cast [enabled by default]
> 
> Introduced by commits 6c14ae1e92c7 ("writeback: dirty position control")
> and 8927f66c4ede ("writeback: dirty position control - bdi reserve area").

Ah sorry!  The below patch should fix it. Shall I update the original
commits in place, or append this patch as a new commit?

Thanks,
Fengguang
---

Subject: writeback: fix ppc compile warnings on do_div(long long, unsigned long)
Date: Tue Oct 11 17:06:33 CST 2011

Fix powerpc compile warnings

mm/page-writeback.c: In function 'bdi_position_ratio':
mm/page-writeback.c:622:3: warning: comparison of distinct pointer types lacks a cast [enabled by default]
page-writeback.c:635:4: warning: comparison of distinct pointer types lacks a cast [enabled by default]

Signed-off-by: Wu Fengguang <fengguang.wu@intel.com>
---
 mm/page-writeback.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

--- linux-next.orig/mm/page-writeback.c	2011-10-11 17:04:00.000000000 +0800
+++ linux-next/mm/page-writeback.c	2011-10-11 17:06:31.000000000 +0800
@@ -618,8 +618,8 @@ static unsigned long bdi_position_ratio(
 	x_intercept = bdi_setpoint + span;
 
 	if (bdi_dirty < x_intercept - span / 4) {
-		pos_ratio *= x_intercept - bdi_dirty;
-		do_div(pos_ratio, x_intercept - bdi_setpoint + 1);
+		pos_ratio = div_u64(pos_ratio * (x_intercept - bdi_dirty),
+				    x_intercept - bdi_setpoint + 1);
 	} else
 		pos_ratio /= 4;
 
@@ -630,10 +630,9 @@ static unsigned long bdi_position_ratio(
 	 */
 	x_intercept = bdi_thresh / 2;
 	if (bdi_dirty < x_intercept) {
-		if (bdi_dirty > x_intercept / 8) {
-			pos_ratio *= x_intercept;
-			do_div(pos_ratio, bdi_dirty);
-		} else
+		if (bdi_dirty > x_intercept / 8)
+			pos_ratio = div_u64(pos_ratio * x_intercept, bdi_dirty);
+		else
 			pos_ratio *= 8;
 	}
 
