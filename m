From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: build failure after merge of the xen-two tree
Date: Thu, 10 Feb 2011 13:24:58 +0100 (CET)
Message-ID: <alpine.LFD.2.00.1102101322450.31804@localhost6.localdomain6>
References: <20110210154648.8b3b994e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110210154648.8b3b994e.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 10 Feb 2011, Stephen Rothwell wrote:

> Hi Konrad,
> 
> After merging the xen-two tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpio/langwell_gpio.c: In function 'lnw_irq_handler':
> drivers/gpio/langwell_gpio.c:210: error: 'struct irq_desc' has no member named 'chip'
> drivers/gpio/langwell_gpio.c:211: error: 'struct irq_desc' has no member named 'chip'
> 
> Caused by commit e22ff7614860bc282ba1eb25440d8fc56975e357 ("xen:
> Interrupt cleanups").

Argh, it selects:

+       select GENERIC_HARDIRQS_NO_DEPRECATED

Konrad, I merily asked you to test XEN with that flag set, not to
apply the change.

Thanks,

	tglx
