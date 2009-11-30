From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pcmcia tree with the net tree
Date: Mon, 30 Nov 2009 13:16:30 +1100
Message-ID: <20091130131630.ad76b951.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753458AbZK3CQ2@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

Hi Dominik,

Today's linux-next merge of the pcmcia tree got conflicts in
drivers/net/pcmcia/fmvj18x_cs.c and drivers/net/pcmcia/nmclan_cs.c
between commit dddcb445a33c80bca11a6566364935e681c85809 ("drivers/net:
remove exceptional & on function name") from the net tree and commit
5fa9167a1bf5f5a4b7282f5e7ac56a4a5a1fa044 ("pcmcia: rework the irq_req_t
typedef") from the pcmcia tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/net/pcmcia/fmvj18x_cs.c
index 57e0961,6e3e1ce..0000000
--- a/drivers/net/pcmcia/fmvj18x_cs.c
+++ b/drivers/net/pcmcia/fmvj18x_cs.c
@@@ -262,10 -255,8 +255,8 @@@ static int fmvj18x_probe(struct pcmcia_
      link->io.IOAddrLines = 5;
  
      /* Interrupt setup */
-     link->irq.Attributes = IRQ_TYPE_DYNAMIC_SHARING|IRQ_HANDLE_PRESENT;
-     link->irq.IRQInfo1 = IRQ_LEVEL_ID;
+     link->irq.Attributes = IRQ_TYPE_DYNAMIC_SHARING;
 -    link->irq.Handler = &fjn_interrupt;
 +    link->irq.Handler = fjn_interrupt;
-     link->irq.Instance = dev;
  
      /* General socket configuration */
      link->conf.Attributes = CONF_ENABLE_IRQ;
diff --cc drivers/net/pcmcia/nmclan_cs.c
index b12e695,dae5ef6..0000000
--- a/drivers/net/pcmcia/nmclan_cs.c
+++ b/drivers/net/pcmcia/nmclan_cs.c
@@@ -477,10 -463,8 +463,8 @@@ static int nmclan_probe(struct pcmcia_d
      link->io.NumPorts1 = 32;
      link->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
      link->io.IOAddrLines = 5;
-     link->irq.Attributes = IRQ_TYPE_EXCLUSIVE | IRQ_HANDLE_PRESENT;
-     link->irq.IRQInfo1 = IRQ_LEVEL_ID;
+     link->irq.Attributes = IRQ_TYPE_EXCLUSIVE;
 -    link->irq.Handler = &mace_interrupt;
 +    link->irq.Handler = mace_interrupt;
-     link->irq.Instance = dev;
      link->conf.Attributes = CONF_ENABLE_IRQ;
      link->conf.IntType = INT_MEMORY_AND_IO;
      link->conf.ConfigIndex = 1;
