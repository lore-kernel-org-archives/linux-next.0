From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Wed, 23 Sep 2015 13:53:52 +0300
Message-ID: <20150923105352.GA25020@node.dhcp.inet.fi>
References: <20150922132751.GB17969@node.dhcp.inet.fi>
 <201509221357.t8MDv6G5015271@ignucius.se.axis.com>
 <20150922151835.GM4029@linux.vnet.ibm.com>
 <20150922153104.GA19024@node.dhcp.inet.fi>
 <20150922154014.GR4029@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:33371 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751887AbbIWKxz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Sep 2015 06:53:55 -0400
Received: by wiclk2 with SMTP id lk2so233183463wic.0
        for <linux-next@vger.kernel.org>; Wed, 23 Sep 2015 03:53:54 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150922154014.GR4029@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, akpm@linux-foundation.org
Cc: Hans-Peter Nilsson <hans-peter.nilsson@axis.com>, starvik@axis.com, linux@roeck-us.net, jespern@axis.com, hughd@google.com, kirill.shutemov@linux.intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, minchan@kernel.org, linux-cris-kernel@axis.com

On Tue, Sep 22, 2015 at 08:40:14AM -0700, Paul E. McKenney wrote:
> On Tue, Sep 22, 2015 at 06:31:04PM +0300, Kirill A. Shutemov wrote:
> > On Tue, Sep 22, 2015 at 08:18:35AM -0700, Paul E. McKenney wrote:
> > > On Tue, Sep 22, 2015 at 03:57:06PM +0200, Hans-Peter Nilsson wrote:
> > > > I guess you hit the right spot, but I'd think people would be
> > > > more comfortable with aligning to sizeof (void *).
> > > 
> > > I would indeed prefer sizeof(void *).
> > 
> > Do you prefer to have the attribute set for whole structure or for ->next?
> > I think attribute on ->next is more appropriate from documentation POV.

I retract this claim: we have requirement about pointee alignment, not
pointer alignment.

>From edbab9e89f5e4ad42e63d93ab05519e6a5f4d552 Mon Sep 17 00:00:00 2001
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Date: Wed, 23 Sep 2015 13:39:28 +0300
Subject: [PATCH] rcu: force alignment on struct callback_head/rcu_head

This patch makes struct callback_head aligned to size of pointer. On
most architectures it happens naturally due ABI requirements, but some
architectures (like CRIS) have weird ABI and we need to ask it
explicitly.

The alignment is required to guarantee that bits 0 and 1 of @next will
be clear under normal conditions -- as long as we use call_rcu(),
call_rcu_bh(), call_rcu_sched(), or call_srcu() to queue callback.

This guarantee is important for few reasons:
 - future call_rcu_lazy() will make use of lower bits in the pointer;
 - the structure shares storage spacer in struct page with @compound_head,
   which encode PageTail() in bit 0. The guarantee is needed to avoid
   false-positive PageTail().

False postive PageTail() caused crash on crisv32[1]. It happend due
misaligned task_struct->rcu, which was byte-aligned.

[1] http://lkml.kernel.org/r/55FAEA67.9000102@roeck-us.net

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reported-by: Guenter Roeck <linux@roeck-us.net>
---
 include/linux/types.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/linux/types.h b/include/linux/types.h
index c314989d9158..70d8500bddf1 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -205,11 +205,25 @@ struct ustat {
  * struct callback_head - callback structure for use with RCU and task_work
  * @next: next update requests in a list
  * @func: actual update function to call after the grace period.
+ *
+ * The struct is aligned to size of pointer. On most architectures it happens
+ * naturally due ABI requirements, but some architectures (like CRIS) have
+ * weird ABI and we need to ask it explicitly.
+ *
+ * The alignment is required to guarantee that bits 0 and 1 of @next will be
+ * clear under normal conditions -- as long as we use call_rcu(),
+ * call_rcu_bh(), call_rcu_sched(), or call_srcu() to queue callback.
+ *
+ * This guarantee is important for few reasons:
+ *  - future call_rcu_lazy() will make use of lower bits in the pointer;
+ *  - the structure shares storage spacer in struct page with @compound_head,
+ *    which encode PageTail() in bit 0. The guarantee is needed to avoid
+ *    false-positive PageTail().
  */
 struct callback_head {
 	struct callback_head *next;
 	void (*func)(struct callback_head *head);
-};
+} __attribute__((aligned(sizeof(void *))));
 #define rcu_head callback_head
 
 typedef void (*rcu_callback_t)(struct rcu_head *head);
-- 
 Kirill A. Shutemov
