From: Chris Ball <cjb@laptop.org>
Subject: Re: linux-next: build failure after merge of the mmc tree
Date: Tue, 08 Nov 2011 20:35:07 -0500
Message-ID: <m21utiw01g.fsf@bob.laptop.org>
References: <20111109120600.2fadafaa1a6c0e38b79ecc1c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from void.printf.net ([89.145.121.20]:55898 "EHLO void.printf.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751146Ab1KIBfW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Nov 2011 20:35:22 -0500
In-Reply-To: <20111109120600.2fadafaa1a6c0e38b79ecc1c@canb.auug.org.au>
	(Stephen Rothwell's message of "Wed, 9 Nov 2011 12:06:00 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Qiang Liu <qiang.liu@freescale.com>

Hi Stephen,

On Tue, Nov 08 2011, Stephen Rothwell wrote:
> Hi Chris,
>
> After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> drivers/mmc/core/sd.c: In function 'mmc_read_switch':
> drivers/mmc/core/sd.c:310:19: error: 'SD_MODE_HIGH_SPEED' undeclared
> (first use in this function)
>
> Caused by commit f1649241a293 ("mmc: sd: Macro name cleanup for high
> speed dtr").  SD_MODE_HIGH_SPEED is not defined anywhere ...
>
> I have used the version of the mmc tree from next-20111108 for today.

Oops, I'm sorry about this.  It's fixed now.

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
