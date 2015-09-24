From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Wed, 23 Sep 2015 21:45:16 -0700
Message-ID: <20150924044516.GF4029@linux.vnet.ibm.com>
References: <20150922132751.GB17969@node.dhcp.inet.fi>
 <201509221357.t8MDv6G5015271@ignucius.se.axis.com>
 <20150922151835.GM4029@linux.vnet.ibm.com>
 <20150922153104.GA19024@node.dhcp.inet.fi>
 <20150922154014.GR4029@linux.vnet.ibm.com>
 <20150923105352.GA25020@node.dhcp.inet.fi>
 <5602BF14.8040803@roeck-us.net>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:49284 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751073AbbIXEvS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2015 00:51:18 -0400
Received: from localhost
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Wed, 23 Sep 2015 22:51:18 -0600
Content-Disposition: inline
In-Reply-To: <5602BF14.8040803@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, akpm@linux-foundation.org, Hans-Peter Nilsson <hans-peter.nilsson@axis.com>, starvik@axis.com, jespern@axis.com, hughd@google.com, kirill.shutemov@linux.intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, minchan@kernel.org, linux-cris-kernel@axis.com

On Wed, Sep 23, 2015 at 08:02:44AM -0700, Guenter Roeck wrote:
> On 09/23/2015 03:53 AM, Kirill A. Shutemov wrote:
> >On Tue, Sep 22, 2015 at 08:40:14AM -0700, Paul E. McKenney wrote:
> >>On Tue, Sep 22, 2015 at 06:31:04PM +0300, Kirill A. Shutemov wrote:
> >>>On Tue, Sep 22, 2015 at 08:18:35AM -0700, Paul E. McKenney wrote:
> >>>>On Tue, Sep 22, 2015 at 03:57:06PM +0200, Hans-Peter Nilsson wrote:
> >>>>>I guess you hit the right spot, but I'd think people would be
> >>>>>more comfortable with aligning to sizeof (void *).
> >>>>
> >>>>I would indeed prefer sizeof(void *).
> >>>
> >>>Do you prefer to have the attribute set for whole structure or for ->next?
> >>>I think attribute on ->next is more appropriate from documentation POV.
> >
> >I retract this claim: we have requirement about pointee alignment, not
> >pointer alignment.
> >
> >>From edbab9e89f5e4ad42e63d93ab05519e6a5f4d552 Mon Sep 17 00:00:00 2001
> >From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> >Date: Wed, 23 Sep 2015 13:39:28 +0300
> >Subject: [PATCH] rcu: force alignment on struct callback_head/rcu_head
> >
> >This patch makes struct callback_head aligned to size of pointer. On
> >most architectures it happens naturally due ABI requirements, but some
> >architectures (like CRIS) have weird ABI and we need to ask it
> >explicitly.
> >
> >The alignment is required to guarantee that bits 0 and 1 of @next will
> >be clear under normal conditions -- as long as we use call_rcu(),
> >call_rcu_bh(), call_rcu_sched(), or call_srcu() to queue callback.
> >
> >This guarantee is important for few reasons:
> >  - future call_rcu_lazy() will make use of lower bits in the pointer;
> >  - the structure shares storage spacer in struct page with @compound_head,
> >    which encode PageTail() in bit 0. The guarantee is needed to avoid
> >    false-positive PageTail().
> >
> >False postive PageTail() caused crash on crisv32[1]. It happend due
> >misaligned task_struct->rcu, which was byte-aligned.
> >
> >[1] http://lkml.kernel.org/r/55FAEA67.9000102@roeck-us.net
> >
> >Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> >Reported-by: Guenter Roeck <linux@roeck-us.net>
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> Hope the patch won't get lost since it was attached to an e-mail.
> Can it be added to the branch introducing the problem ?

Andrew Morton picked it up.  No idea where the problem was introduced.

						Thanx, Paul

> Thanks,
> Guenter
> 
> >---
> >  include/linux/types.h | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> >diff --git a/include/linux/types.h b/include/linux/types.h
> >index c314989d9158..70d8500bddf1 100644
> >--- a/include/linux/types.h
> >+++ b/include/linux/types.h
> >@@ -205,11 +205,25 @@ struct ustat {
> >   * struct callback_head - callback structure for use with RCU and task_work
> >   * @next: next update requests in a list
> >   * @func: actual update function to call after the grace period.
> >+ *
> >+ * The struct is aligned to size of pointer. On most architectures it happens
> >+ * naturally due ABI requirements, but some architectures (like CRIS) have
> >+ * weird ABI and we need to ask it explicitly.
> >+ *
> >+ * The alignment is required to guarantee that bits 0 and 1 of @next will be
> >+ * clear under normal conditions -- as long as we use call_rcu(),
> >+ * call_rcu_bh(), call_rcu_sched(), or call_srcu() to queue callback.
> >+ *
> >+ * This guarantee is important for few reasons:
> >+ *  - future call_rcu_lazy() will make use of lower bits in the pointer;
> >+ *  - the structure shares storage spacer in struct page with @compound_head,
> >+ *    which encode PageTail() in bit 0. The guarantee is needed to avoid
> >+ *    false-positive PageTail().
> >   */
> >  struct callback_head {
> >  	struct callback_head *next;
> >  	void (*func)(struct callback_head *head);
> >-};
> >+} __attribute__((aligned(sizeof(void *))));
> >  #define rcu_head callback_head
> >
> >  typedef void (*rcu_callback_t)(struct rcu_head *head);
> >
> 
