From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for December 19 (new
	CONFIG_NUMA_MIGRATE_IRQ_DESC option)
Date: Fri, 19 Dec 2008 22:42:21 +0100
Message-ID: <20081219214221.GE2351@elte.hu>
References: <20081219235757.6b94d9ef.sfr@canb.auug.org.au> <200812192201.28665.bzolnier@gmail.com> <494C0D28.6040002@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:46812 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751167AbYLSVmh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Dec 2008 16:42:37 -0500
Content-Disposition: inline
In-Reply-To: <494C0D28.6040002@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yinghai Lu <yinghai@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


* Yinghai Lu <yinghai@kernel.org> wrote:

> > +++ b/kernel/irq/numa_migrate.c
> > @@ -0,0 +1,127 @@
> > +/*
> > + * linux/kernel/irq/handle.c
> > + *
> > + * Copyright (C) 1992, 1998-2006 Linus Torvalds, Ingo Molnar
> > + * Copyright (C) 2005-2006, Thomas Gleixner, Russell King
> > + *
> > + * This file contains the core interrupt handling code.
> > + *
> > + * Detailed information is available in Documentation/DocBook/genericirq
> > + *
> > + */
> > 
> > hmmm? ;-)
> 
> seperated from irq/handle.c
> 
> oh, will remove those lines.

Yeah, replace them with something like:

/*
 * NUMA irq-desc migration code
 *
 * Migrate IRQ data structures (irq_desc, chip_data, etc.) over to
 * the new "home node" of the IRQ.
 */

	Ingo
