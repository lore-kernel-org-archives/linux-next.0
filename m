From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH] pcmcia: avoid buffer overflow in pcmcia_setup_isa_irq
Date: Tue, 3 Aug 2010 09:40:22 +0200
Message-ID: <20100803074022.GA28158@comet.dominikbrodowski.net>
References: <1280795899.11158.52.camel@lovely.krouter>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar-3.linta.de ([188.40.101.200]:57112 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751401Ab0HCHnm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Aug 2010 03:43:42 -0400
Content-Disposition: inline
In-Reply-To: <1280795899.11158.52.camel@lovely.krouter>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Fritz <chf.fritz@googlemail.com>, linux-pcmcia@lists.infradead.org
Cc: linux-next <linux-next@vger.kernel.org>

On Tue, Aug 03, 2010 at 02:38:19AM +0200, Christoph Fritz wrote:
> Hi,
> 
> buffer overflow in next-tree's commit 6f0f38c45a8f2f511c25893e33011ff32fc811db:
>  size of array pcmcia_used_irq[] can be less than 32
> 
> in drivers/pcmcia/pcmcia_resource.c
>    +static int pcmcia_setup_isa_irq(struct pcmcia_device *p_dev, int type)
>    +{
>    [..]
>    +       for (try = 0; try < 64; try++) {
>    +               irq = try % 32;
>    [..]
>    +
>    +               /* avoid an IRQ which is already used by another PCMCIA card */
>    +               if ((try < 32) && pcmcia_used_irq[irq])
>    +                       continue;
> 
> drivers/pcmcia/pcmcia_resource.c
>    static u8 pcmcia_used_irq[NR_IRQS];
> 
> arch/x86/include/asm/irq_vectors.h
>    #define NR_IRQS_LEGACY                    16
>    [..]
>    #else /* !CONFIG_X86_IO_APIC: */
>    # define NR_IRQS                        NR_IRQS_LEGACY
>    #endif
> 
> ---
> non-tested fix:

What about this?


[PATCH] pcmcia: avoid buffer overflow in pcmcia_setup_isa_irq

NR_IRQS may be as low as 16, causing a (harmless?) buffer overflow in
pcmcia_setup_isa_irq():

static u8 pcmcia_used_irq[NR_IRQS];

...

		if ((try < 32) && pcmcia_used_irq[irq])
			continue;

This is read-only, so if this address would be non-zero, it would just
mean we would not attempt an IRQ >= NR_IRQS -- which would fail anyway!
And as request_irq() fails for an irq >= NR_IRQS, the setting code path:

			pcmcia_used_irq[irq]++;

is never reached as well.

Reported-by: Christoph Fritz <chf.fritz@googlemail.com>
CC: stable@kernel.org
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

diff --git a/drivers/pcmcia/pcmcia_resource.c b/drivers/pcmcia/pcmcia_resource.c
index d48437f..54aa1c2 100644
--- a/drivers/pcmcia/pcmcia_resource.c
+++ b/drivers/pcmcia/pcmcia_resource.c
@@ -677,7 +677,7 @@ EXPORT_SYMBOL(__pcmcia_request_exclusive_irq);
 #ifdef CONFIG_PCMCIA_PROBE
 
 /* mask of IRQs already reserved by other cards, we should avoid using them */
-static u8 pcmcia_used_irq[NR_IRQS];
+static u8 pcmcia_used_irq[32];
 
 static irqreturn_t test_action(int cpl, void *dev_id)
 {
@@ -700,6 +700,9 @@ static int pcmcia_setup_isa_irq(struct pcmcia_device *p_dev, int type)
 	for (try = 0; try < 64; try++) {
 		irq = try % 32;
 
+		if (irq > NR_IRQS)
+			continue;
+
 		/* marked as available by driver, not blocked by userspace? */
 		if (!((mask >> irq) & 1))
 			continue;
