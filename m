From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: pcmcia tree build warnings
Date: Thu, 21 Aug 2008 23:16:30 +0200
Message-ID: <20080821211630.GC24924@comet.dominikbrodowski.net>
References: <20080820162410.82615889.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:49382 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751162AbYHUVSX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Aug 2008 17:18:23 -0400
Content-Disposition: inline
In-Reply-To: <20080820162410.82615889.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

On Wed, Aug 20, 2008 at 04:24:10PM +1000, Stephen Rothwell wrote:
> These are worth fixing:
> 
> drivers/pcmcia/ds.c: In function 'pcmcia_devmatch':
> drivers/pcmcia/ds.c:962: warning: passing argument 1 of 'dev_driver_string' from incompatible pointer type
> drivers/pcmcia/ds.c:962: warning: passing argument 1 of 'dev_name' from incompatible pointer type
> drivers/pcmcia/ds.c:969: warning: passing argument 1 of 'dev_driver_string' from incompatible pointer type
> drivers/pcmcia/ds.c:969: warning: passing argument 1 of 'dev_name' from incompatible pointer type
> 
> You are passing a "struct pcmcia_device *" instead of a "struct device *"
> to ds_dev_dbg().  (commit 5e42a2fcae73c08af2ae4d64b25f807708ff6193
> "pcmcia: use dev_printk in module pcmcia")

Thanks for noticing those. A patch to fix these issues will be in the next
-next :)

Best,
	Dominik
