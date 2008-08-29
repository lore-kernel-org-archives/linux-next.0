From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: pcmcia tree build failure
Date: Fri, 29 Aug 2008 18:31:28 +1000
Message-ID: <20080829183128.844c4cb0.sfr@canb.auug.org.au>
References: <20080829163658.c8ea1bba.sfr@canb.auug.org.au>
	<20080829074417.GA26747@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46956 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752375AbYH2Ibd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Aug 2008 04:31:33 -0400
In-Reply-To: <20080829074417.GA26747@isilmar.linta.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org

Hi Dominik,

On Fri, 29 Aug 2008 09:44:17 +0200 Dominik Brodowski <linux@dominikbrodowski.net> wrote:
>
> ooops. Fixed. Thanks. Also fixed another build failure, so if you can
> re-load the pcmcia tree, that'd be great.

Not until Monday, but I will apply the following patch to the end of
today's build, ok.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/drivers/usb/host/sl811_cs.c b/drivers/usb/host/sl811_cs.c
index ca733b7..516848d 100644
--- a/drivers/usb/host/sl811_cs.c
+++ b/drivers/usb/host/sl811_cs.c
@@ -112,7 +112,8 @@ static struct platform_device platform_dev = {
 	.num_resources		= ARRAY_SIZE(resources),
 };
 
-static int sl811_hc_init(struct device *parent, ioaddr_t base_addr, int irq)
+static int sl811_hc_init(struct device *parent, resource_size_t base_addr,
+			 int irq)
 {
 	if (platform_dev.dev.parent)
 		return -EBUSY;
