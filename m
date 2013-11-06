From: Chris Mason <chris.mason@fusionio.com>
Subject: Re: Boot failure on Arndale with next-20131105
Date: Tue, 5 Nov 2013 19:04:32 -0500
Message-ID: <20131106000432.3802.22331@localhost.localdomain>
References: <CAHbNUh1Cw3bc4WR0VcD1H_eKYqGBtv_215_euh6mwTbZ41ejUw@mail.gmail.com>
 <52794823.7080503@kernel.dk>
 <CAOesGMj1xXXM-gNgWQwBKOczpJtM7CobYy4h7Fe=4W3U43EJGQ@mail.gmail.com>
 <20131105203308.3802.45122@localhost.localdomain>
 <CAOesGMirg=ex9hLCjGBpj0cMhLeQ5cJQoRv72tgg7PoSKWUDhA@mail.gmail.com>
 <20131105205623.3802.5166@localhost.localdomain>
 <52796BE1.5010306@wwwdotorg.org>
 <CAOesGMiyp3VNUZf=A_MMVAKsdqtE8nJqNuNCmZh6PO2zkU-oTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from dkim1.fusionio.com ([66.114.96.53]:60142 "EHLO
	dkim1.fusionio.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755558Ab3KFAEi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2013 19:04:38 -0500
Received: from mx1.fusionio.com (unknown [10.101.1.160])
	by dkim1.fusionio.com (Postfix) with ESMTP id DB9AD7C06CD
	for <linux-next@vger.kernel.org>; Tue,  5 Nov 2013 17:04:37 -0700 (MST)
In-Reply-To: <CAOesGMiyp3VNUZf=A_MMVAKsdqtE8nJqNuNCmZh6PO2zkU-oTA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Jens Axboe <axboe@kernel.dk>, Tushar Behera <tushar.behera@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Kent Overstreet <kmo@daterainc.com>

Quoting Olof Johansson (2013-11-05 17:41:42)
> On Tue, Nov 5, 2013 at 2:06 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> > On 11/05/2013 01:56 PM, Chris Mason wrote:
> >> Quoting Olof Johansson (2013-11-05 15:38:33)
> >>> On Tue, Nov 5, 2013 at 12:33 PM, Chris Mason <chris.mason@fusionio.com> wrote:
> >>>> Quoting Olof Johansson (2013-11-05 15:23:51)
> >>>>> On Tue, Nov 5, 2013 at 11:33 AM, Jens Axboe <axboe@kernel.dk> wrote:
> >>>>
> >>>> [ horrible crashes fixed by removing my patch ]
> >>>>
> > ...
> >> Ok, I think I see it.  My guess is that you're hitting bounce buffers.
> >> __blk_queue_bounce is the only caller of the bio splitting code I can
> >> see that you might be hitting.
> >>
> >> My first patch exposed a lurking bug in bio_clone_biovec.  Basically
> >> bio->bi_vcnt is being doubled instead of initialized.
> >>
> >> This patch is only compile tested, but I think it'll fix it.
> >
> > Tested-by: Stephen Warren <swarren@nvidia.com>
> > (this fixes the issue on Tegra30/Beaver at least)
> 
> Tested-by: Olof Johansson <olof@lixom.net>
> 
> This resolves boot failures on:
> * Tegra30/beaver
> * OMAP4/panda
> * i.MX6/wandboard
> 
> Thanks Chris!

Perfect, thanks for bisecting and trying the patches.  Kent, if things
get rebased, could you please fold this patch and my bi_vcnt patch in?

-chris
