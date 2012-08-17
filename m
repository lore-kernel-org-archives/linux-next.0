From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Thu, 16 Aug 2012 22:46:11 -0300
Message-ID: <502DA263.8010507@redhat.com>
References: <20120817111013.28c2f0b0ef72631968007d9a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:62204 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932178Ab2HQBql (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Aug 2012 21:46:41 -0400
In-Reply-To: <20120817111013.28c2f0b0ef72631968007d9a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

Em 16-08-2012 22:10, Stephen Rothwell escreveu:
> Hi Mauro,
> 
> After merging the v4l-dvb tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "usb_cypress_load_firmware" [drivers/staging/media/go7007/s2250-loader.ko] undefined!

This is due to the usage of "=" or ":=" instead of "+=" on some places. Just pushed a
patch fixing it.

> ERROR: "b2c2_flexcop_debug" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!

It may also be due to the same reason. I'll double-check this one.

> Given the major reorganisation going on, I have just used the v4l-dvb
> tree from next-20120816 for today.

Ok.

Almost all patches already went there, so I expect that it will be
more stable tomorrow. Yet, it might have some conflicts with a few
trees (like the "trivial" tree).

Regards,
Mauro
