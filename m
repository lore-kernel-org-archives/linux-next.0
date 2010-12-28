From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the sound tree with the s5p tree
Date: Tue, 28 Dec 2010 11:24:49 +0900
Message-ID: <018b01cba636$6c3a8390$44af8ab0$%kim@samsung.com>
References: <20101223115339.1ce18216.sfr@canb.auug.org.au>
 <003f01cba28c$872214f0$95663ed0$%kim@samsung.com>
 <s5hk4j0n43g.wl%tiwai@suse.de>
 <004001cba292$3827d2d0$a8777870$%kim@samsung.com>
 <s5hvd2ku49r.wl%tiwai@suse.de>
 <004101cba294$8639de30$92ad9a90$%kim@samsung.com>
 <s5h7hf0tvct.wl%tiwai@suse.de>
 <008f01cba30a$72f5c160$58e14420$%kim@samsung.com>
 <20101224082736.GA31540@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:13132 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753056Ab0L1CZ1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Dec 2010 21:25:27 -0500
In-reply-to: <20101224082736.GA31540@flint.arm.linux.org.uk>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Russell King' <rmk@arm.linux.org.uk>
Cc: 'Takashi Iwai' <tiwai@suse.de>, 'Stephen Rothwell' <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Jassi Brar' <jassi.brar@samsung.com>

Russell King wrote:
> 
> On Fri, Dec 24, 2010 at 10:32:33AM +0900, Kukjin Kim wrote:
> > Takashi Iwai wrote:
> > > I basically don't like to rebase and the commits have been already in
> > > sound tree, but if this is the only way and Russell prefers this, it
> > > can be a possible option.
> > >
> > I agree with you...now, rebase stuff is unnecessary load to you.
> >
> > Ok...firstly, need to ask to Russell.
> > (Added Russell in To)
> >
> > Hi Russell,
> >
> > Sorry for bothering...
> > If possible, please read this thread :-)
> >
> > So...
> >
> > May/Should I merge sound tree for avoiding build error and conflict
between
> > each other for 37 merge window instead of cherry-pick?
> 
Russell, thanks for your reply :-)

> IMHO it is never appropriate to cherry pick commits from someone elses
> tree into your own tree as it creates duplicates in the history.
> 
Absolutely, you're right. I missed.

> What would be better is to talk to the person who owns the tree with
> the commits you're interested in, and see about merging the minimal
> set of commits you need into your own tree.  They may tell you the
> name of a branch for you to merge into your tree (preferred), or more
> obscurely tell you a commit id in their tree.
> 
Yeah, would be nice to me ;-)

> Now there are two options:
> - If you know the branch you need, you can then either pull that branch
>   into your tree, and commit the dependent patches on top of that.
> 
Unfortunately, as I know, there is no suitable branch for it and me in
sound-2.6 tree now :-(

> - If you only have a commit ID in the remote tree, you can fetch their
>   tree first, use gitk to visualize the history and check you have it,
>   and then do:
>     git merge --no-commit <commitid>
>   in your tree.  Then commit the result with your own commit message
>   explaining what's going on.
> 
Hmm...happened error when merged but I don't know how can solve that :-(

IMHO, your first option is better to me but it depends on Takashi...hehe...
Anyway Thanks and Happy New year!


Takashi, as Russell's first option, could you please make some branch which
includes following to me?
Of course, I know you need rebase you tree for it...so sorry for bothering.

git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-2.6.git
#topic/asoc

commit 83e37b8e400ca51cc97946815b3055daacd92fa8
Author: Jassi Brar <jassi.brar@samsung.com>
Date:   Mon Nov 22 15:35:53 2010 +0900

    ARM: Samsung: Define common audio-dma device

    The ASoC uses common DMA driver for Audio devices. So it makes
    sense to a common audio-dma device shared across all platforms.

    Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
    Acked-by: Kukjin Kim <kgene.kim@samsung.com>
    Acked-by: Liam Girdwood <lrg@slimlogic.co.uk>
    Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

commit 58bb4072132c54d832082cc6eac396a6db009cbd
Author: Jassi Brar <jassi.brar@samsung.com>
Date:   Mon Nov 22 15:35:50 2010 +0900

    ASoC: Samsung: Rename DMA device

    Some Samsung SoCs have a PCM(DSP) controller. So the name
    s3c24xx-pcm-audio for DMA driver is not very appropraite.
    This patch moves :-
        s3c24xx-pcm-audio -> samsung-audio

    Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
    Acked-by: Kukjin Kim <kgene.kim@samsung.com>
    Acked-by: Liam Girdwood <lrg@slimlogic.co.uk>
    Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Please let me know your opinion.
Happy New year ;-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
