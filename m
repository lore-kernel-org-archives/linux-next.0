From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: sparc build failure
Date: Thu, 28 Aug 2008 09:25:38 +0200
Message-ID: <20080828072538.GD21875@elte.hu>
References: <20080828165149.4e6089e8.sfr@canb.auug.org.au> <20080828065754.GC16186@elte.hu> <20080828171246.979a97b2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:37623 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752734AbYH1HZw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 03:25:52 -0400
Content-Disposition: inline
In-Reply-To: <20080828171246.979a97b2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Thu, 28 Aug 2008 08:57:54 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > thanks - the patch below should fix all those architectures. (there's 
> > also s390)
> 
> Thanks, saves me writing the patch :-)
> 
> Actually, it appears that s390 allmodconfig doesn't build any modules 
> that require nr_irqs.

ok - but was still worth fixing as a general principle: if something 
like nr_irqs is exported in kernel/irq/manage.c then it should be 
exported in non-genirq architectures as well.

	Ingo
