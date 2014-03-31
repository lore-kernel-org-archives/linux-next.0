From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Mon, 31 Mar 2014 07:26:44 -0300
Message-ID: <20140331072644.64897935@infradead.org>
References: <20140331130107.93488407b1f13f9d64679979@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50774 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753814AbaCaK0u (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Mar 2014 06:26:50 -0400
In-Reply-To: <20140331130107.93488407b1f13f9d64679979@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Antti Palosaari <crope@iki.fi>

Hi Stephen,

Em Mon, 31 Mar 2014 13:01:07 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Mauro,
> 
> After merging the v4l-dvb tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/media/usb/em28xx/em28xx-dvb.c: In function 'em28xx_dvb_resume':
> drivers/media/usb/em28xx/em28xx-dvb.c:1645:7: error: 'client' undeclared (first use in this function)
>    if (client) {
>        ^
> 
> Caused by commit 37571b163c15 ("[media] em28xx-dvb: fix PCTV 461e tuner
> I2C binding").  Basic build testing is a good idea :-(

Yeah, sorry for that. The affected patch came from another branch,
but one of the hunks got incorrectly merged. I'm applying a fix for
it in a few.

> 
> I have used the v4v-dvb tree from next-20140328 for today.

Thanks!
Mauro
