From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the
 wireless-drivers-next tree
Date: Mon, 27 Jul 2015 16:04:24 +1000
Message-ID: <20150727160424.6af47528@canb.auug.org.au>
References: <20150722103239.04995fda@canb.auug.org.au>
	<876156b1ia.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45449 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750779AbbG0GE1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jul 2015 02:04:27 -0400
In-Reply-To: <876156b1ia.fsf@kamboji.qca.qualcomm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>

Hi Kalle,

On Mon, 27 Jul 2015 08:41:49 +0300 Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > After merging the wireless-drivers-next tree, today's linux-next build
> > (x86_64 allmodconfig) failed like this:
> >
> > ERROR: "of_default_bus_match_table" [drivers/bcma/bcma.ko] undefined!
> >
> > Caused by commit
> >
> >   cae761b5a6bd ("bcma: populate bus DT subnodes as platform_device-s")
> >
> > I have used the wireless-drivers-next tree from next-20150721 for today.
> 
> Yesterday I pushed the commit below which should fix this issue. Please
> let me know if you still have any problems.
> 
> commit 92ff7a698badec3938edd3ba6b3e3ae035555365
> Author: Hauke Mehrtens <hauke@hauke-m.de>
> Date:   Sat Jul 25 21:10:27 2015 +0200
> 
>     bcma: fix build error when build as module

It is fixed today, thanks.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
