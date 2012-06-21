From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Thu, 21 Jun 2012 10:35:51 -0700
Message-ID: <20120621103551.1f3b7ad9.akpm@linux-foundation.org>
References: <20120621132738.6e797593acc58b3e30902f69@canb.auug.org.au>
	<A874F61F95741C4A9BA573A70FE3998FC074@DQHE02.ent.ti.com>
	<CAF+7xWkzKkwfBFQS1vr-Tk2Auu+5HQmX7bZCGJhsmXRi0V5OZw@mail.gmail.com>
	<20120621210412.72321b3ff43d50930b17f760@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:60650 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759990Ab2FURfQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jun 2012 13:35:16 -0400
In-Reply-To: <20120621210412.72321b3ff43d50930b17f760@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Kim, Milo" <Milo.Kim@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, "Girdwood, Liam" <lrg@ti.com>, axel.lin@gmail.com, Alberto Panizzo <alberto@amarulasolutions.com>, Jingoo Han <jg1.han@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@secretlab.ca>

On Thu, 21 Jun 2012 21:04:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> This export is needed for a patch in the regulator tree, so can we have
> that patch sent to Linus ASAP, please?

Shall do.

From: Andrew Morton <akpm@linux-foundation.org>
Subject: drivers/gpio/devres.c: export devm_gpio_request_one() to modules

Several drivers in linux-next and possibly mainline are failing due to
this missing export.

Cc: Alberto Panizzo <alberto@amarulasolutions.com>
Cc: Jingoo Han <jg1.han@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/gpio/devres.c |    1 +
 1 file changed, 1 insertion(+)

diff -puN drivers/gpio/devres.c~drivers-gpio-devresc-export-devm_gpio_request_one-to-modules drivers/gpio/devres.c
--- a/drivers/gpio/devres.c~drivers-gpio-devresc-export-devm_gpio_request_one-to-modules
+++ a/drivers/gpio/devres.c
@@ -98,6 +98,7 @@ int devm_gpio_request_one(struct device 
 
 	return 0;
 }
+EXPORT_SYMBOL(devm_gpio_request_one);
 
 /**
  *      devm_gpio_free - free an interrupt
_
