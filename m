From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the
 spi-current tree
Date: Wed, 16 Feb 2011 15:09:43 +1100
Message-ID: <20110216150943.b4969ddf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43159 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756518Ab1BPEJs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Feb 2011 23:09:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Hi Grant,

Today's linux-next merge of the devicetree tree got a conflict in
drivers/spi/pxa2xx_spi_pci.c between commit
0f3e1d27a7e3f98d996d707d649128e229b65deb ("spi/pxa2xx pci: fix the
release - remove race") from the spi-current tree and commit
c9e358dfc4a8cb2227172ef77908c2e0ee17bcb9 ("driver-core: remove
conditionals around devicetree pointers") from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/spi/pxa2xx_spi_pci.c
index 19752b0,b6589bb..0000000
--- a/drivers/spi/pxa2xx_spi_pci.c
+++ b/drivers/spi/pxa2xx_spi_pci.c
@@@ -75,24 -84,25 +75,22 @@@ static int __devinit ce4100_spi_probe(s
  		return ret;
  	}
  
 +	pdev = platform_device_alloc("pxa2xx-spi", dev->devfn);
  	spi_info = kzalloc(sizeof(*spi_info), GFP_KERNEL);
 -	if (!spi_info) {
 +	if (!pdev || !spi_info ) {
  		ret = -ENOMEM;
 -		goto err_kz;
 +		goto err_nomem;
  	}
 -	ssp = &spi_info->ssp;
 -	pdev = &spi_info->spi_pdev;
 -	spi_pdata =  &spi_info->spi_pdata;
 +	memset(&spi_pdata, 0, sizeof(spi_pdata));
 +	spi_pdata.num_chipselect = dev->devfn;
  
 -	pdev->name = "pxa2xx-spi";
 -	pdev->id = dev->devfn;
 -	pdev->dev.parent = &dev->dev;
 -	pdev->dev.platform_data = &spi_info->spi_pdata;
 +	ret = platform_device_add_data(pdev, &spi_pdata, sizeof(spi_pdata));
 +	if (ret)
 +		goto err_nomem;
  
 +	pdev->dev.parent = &dev->dev;
- #ifdef CONFIG_OF
  	pdev->dev.of_node = dev->dev.of_node;
- #endif
 -	pdev->dev.release = plat_dev_release;
 -
 -	spi_pdata->num_chipselect = dev->devfn;
 -
 +	ssp = &spi_info->ssp;
  	ssp->phys_base = pci_resource_start(dev, 0);
  	ssp->mmio_base = ioremap(phys_beg, phys_len);
  	if (!ssp->mmio_base) {
