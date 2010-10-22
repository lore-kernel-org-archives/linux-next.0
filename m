From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: User Mode Linux broken
Date: Fri, 22 Oct 2010 09:03:44 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1010220900230.3467@localhost6.localdomain6>
References: <201010211315.26679.richard@nod.at> <201010212122.38437.richard@nod.at> <alpine.LFD.2.00.1010212143300.3467@localhost6.localdomain6> <201010212227.12919.richard@nod.at>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.tglx.de ([62.245.132.106]:35804 "EHLO www.tglx.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752671Ab0JVHEE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Oct 2010 03:04:04 -0400
In-Reply-To: <201010212227.12919.richard@nod.at>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: peterz@infradead.org, hpa@zytor.com, mingo@elte.hu, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On Thu, 21 Oct 2010, Richard Weinberger wrote:
> Am Donnerstag 21 Oktober 2010, 21:45:35 schrieb Thomas Gleixner:
> > Why shold it solve it ? irq_enable is set to compat_irq_enable which
> > in turn calls chip->enable.
> > 
> > So how's that different ?
> 
> I took a closer look on the issue.
> 
> check_irq_resend() gets called before irq_chip_set_defaults().
> In the first call to check_irq_resend() desc->irq_data.chip->irq_enable is 
> NULL. UML dies due to a NULL-pointer dereference...
> 
> I don't know why check_irq_resend() is called before irq_chip_set_defaults().
> It's your code. ;-)

Well, but it only gets called via enable_irq(). So that means
something is calling enable_irq _before_ request/setup_irq().

arch/um/kernel/irq.c:init_IRQ() does that :)

Thanks,

	tglx
