From: Christoph Fritz <chf.fritz@googlemail.com>
Subject: [BUG -next] pcmcia: setup IRQ to be used by PCMCIA drivers at card
 insert
Date: Tue, 03 Aug 2010 02:38:19 +0200
Message-ID: <1280795899.11158.52.camel@lovely.krouter>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:55347 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751611Ab0HCAfW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Aug 2010 20:35:22 -0400
Received: by wyb39 with SMTP id 39so3856972wyb.19
        for <linux-next@vger.kernel.org>; Mon, 02 Aug 2010 17:35:20 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next <linux-next@vger.kernel.org>

Hi,

buffer overflow in next-tree's commit 6f0f38c45a8f2f511c25893e33011ff32fc811db:
 size of array pcmcia_used_irq[] can be less than 32

in drivers/pcmcia/pcmcia_resource.c
   +static int pcmcia_setup_isa_irq(struct pcmcia_device *p_dev, int type)
   +{
   [..]
   +       for (try = 0; try < 64; try++) {
   +               irq = try % 32;
   [..]
   +
   +               /* avoid an IRQ which is already used by another PCMCIA card */
   +               if ((try < 32) && pcmcia_used_irq[irq])
   +                       continue;

drivers/pcmcia/pcmcia_resource.c
   static u8 pcmcia_used_irq[NR_IRQS];

arch/x86/include/asm/irq_vectors.h
   #define NR_IRQS_LEGACY                    16
   [..]
   #else /* !CONFIG_X86_IO_APIC: */
   # define NR_IRQS                        NR_IRQS_LEGACY
   #endif

---
non-tested fix:
---
diff --git a/drivers/pcmcia/pcmcia_resource.c b/drivers/pcmcia/pcmcia_resource.c
index d48437f..f8363e6 100644
--- a/drivers/pcmcia/pcmcia_resource.c
+++ b/drivers/pcmcia/pcmcia_resource.c
@@ -697,15 +697,15 @@ static int pcmcia_setup_isa_irq(struct pcmcia_device *p_dev, int type)
 	u32 mask = s->irq_mask;
 	int ret = -ENODEV;
 
-	for (try = 0; try < 64; try++) {
-		irq = try % 32;
+	for (try = 0; try < (NR_IRQS * 2); try++) {
+		irq = try % NR_IRQS;
 
 		/* marked as available by driver, not blocked by userspace? */
 		if (!((mask >> irq) & 1))
 			continue;
 
 		/* avoid an IRQ which is already used by another PCMCIA card */
-		if ((try < 32) && pcmcia_used_irq[irq])
+		if ((try < NR_IRQS) && pcmcia_used_irq[irq])
 			continue;
 
 		/* register the correct driver, if possible, to check whether
