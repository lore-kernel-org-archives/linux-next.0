From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Date: Tue, 28 Sep 2010 22:40:05 -0300
Message-ID: <4CA298F5.40309@infradead.org>
References: <20100929112904.3fd117e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:36619 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754912Ab0I2BkL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2010 21:40:11 -0400
In-Reply-To: <20100929112904.3fd117e0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Delvare <khali@linux-fr.org>

Em 28-09-2010 22:29, Stephen Rothwell escreveu:
> Hi Mauro,
> 
> After merging the v4l-dvb tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/media/video/bt8xx/bttv-input.c: In function 'init_bttv_i2c_ir':
> drivers/media/video/bt8xx/bttv-input.c:306: error: too few arguments to function 'i2c_new_probed_device'
> 
> Caused by commit 3c81f945a74224d6e3017596297ee9903929b1a7 ("V4L/DVB:
> bttv: Move PV951 IR to the right driver") interacting with commit
> 9a94241afcc9a481691a9c29b7460217925b59b8 ("i2c: Add support for custom
> probe function") that entered Linus' tree in v2.6.36-rc1.  I guess that
> the v4l-dvb commit moved that code to a driver that is now being built.
> 
> I have used the v4l-dvb tree from next-20100928 for today.

Thanks. It is probably a badly handled merge conflict. I had to manually merge
bttv-i2c and cx88-i2c from two different trees locally.

I'll work on it and re-merge for the tomorrow's build.

Thanks,
Mauro
