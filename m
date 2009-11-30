From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pcmcia tree with the pxa tree
Date: Mon, 30 Nov 2009 13:16:27 +1100
Message-ID: <20091130131627.8ccc6033.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753425AbZK3CQX@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, Marc Zyngier <maz@misterjones.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

Hi Dominik,

Today's linux-next merge of the pcmcia tree got a conflict in drivers/pcmcia/pxa2xx_viper.c between commit c9b74a4489db7e6fe03fbee11f406b9641baae55 ("[ARM] pxa/zeus: make Viper pcmcia support more generic to support Zeus") from the pxa tree and commit 66024db57d5b9011e274b314affad68f370c0d6f ("PCMCIA: stop duplicating pci_irq in soc_pcmcia_socket") from the pcmcia tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/pcmcia/pxa2xx_viper.c
index 7a16ae9,27be2e1..0000000
--- a/drivers/pcmcia/pxa2xx_viper.c
+++ b/drivers/pcmcia/pxa2xx_viper.c
@@@ -30,35 -32,23 +30,35 @@@
  #include "soc_common.h"
  #include "pxa2xx_base.h"
  
 +static struct platform_device *arcom_pcmcia_dev;
 +
  static struct pcmcia_irqs irqs[] = {
 -	{ 0, gpio_to_irq(VIPER_CF_CD_GPIO),  "PCMCIA_CD" }
 +	{
 +		.sock	= 0,
 +		.str	= "PCMCIA_CD",
 +	},
  };
  
 +static inline struct arcom_pcmcia_pdata *viper_get_pdata(void)
 +{
 +	return arcom_pcmcia_dev->dev.platform_data;
 +}
 +
  static int viper_pcmcia_hw_init(struct soc_pcmcia_socket *skt)
  {
 +	struct arcom_pcmcia_pdata *pdata = viper_get_pdata();
  	unsigned long flags;
  
- 	skt->irq = gpio_to_irq(pdata->rdy_gpio);
 -	skt->socket.pci_irq = gpio_to_irq(VIPER_CF_RDY_GPIO);
++	skt->socket.pci_irq = gpio_to_irq(pdata->rdy_gpio);
 +	irqs[0].irq = gpio_to_irq(pdata->cd_gpio);
  
 -	if (gpio_request(VIPER_CF_CD_GPIO, "CF detect"))
 +	if (gpio_request(pdata->cd_gpio, "CF detect"))
  		goto err_request_cd;
  
 -	if (gpio_request(VIPER_CF_RDY_GPIO, "CF ready"))
 +	if (gpio_request(pdata->rdy_gpio, "CF ready"))
  		goto err_request_rdy;
  
 -	if (gpio_request(VIPER_CF_POWER_GPIO, "CF power"))
 +	if (gpio_request(pdata->pwr_gpio, "CF power"))
  		goto err_request_pwr;
  
  	local_irq_save(flags);
