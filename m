From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: User Mode Linux broken
Date: Thu, 21 Oct 2010 18:09:22 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1010211805040.2418@localhost6.localdomain6>
References: <201010211315.26679.richard@nod.at>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.tglx.de ([62.245.132.106]:33764 "EHLO www.tglx.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754955Ab0JUQJm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Oct 2010 12:09:42 -0400
In-Reply-To: <201010211315.26679.richard@nod.at>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: peterz@infradead.org, hpa@zytor.com, mingo@elte.hu, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On Thu, 21 Oct 2010, Richard Weinberger wrote:

> Thomas,
> 
> Your commit c5f7563 ("genirq: Provide compat handling for chip->enable()") 
> breaks UML.
> It does not start anymore.
> 
> When I apply this patch it works fine again.
> http://userweb.kernel.org/~akpm/mmotm/broken-out/um-migrate-from-__do_irq-to-
> generic_handle_irq.patch
> 
> Maybe your patch breaks all users of __do_IRQ()?

Not intentionally :)

The irq_chip of um has it's own dummy enable function, so the compat
code uses it.

+static void compat_irq_enable(struct irq_data *data)
+{
+	data->chip->enable(data->irq);
+}
+

...

+	if (chip->enable)
+		chip->irq_enable = compat_irq_enable;
+
+	/*
+	 * The real defaults
+	 */
+	if (!chip->irq_enable)
+		chip->irq_enable = default_enable;

So I really can't see how's that supposed to break UM

Thanks,

	tglx
