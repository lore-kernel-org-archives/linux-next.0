From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
Date: Wed, 30 Aug 2017 18:42:00 +0200
Message-ID: <20170830164200.pys3njx3zd2ktd4p@piout.net>
References: <20170830230712.55db7911@canb.auug.org.au>
 <20170830131930.bvu6furm7dlhes3i@piout.net>
 <CAOesGMg130BvqS1vGid9jm-G7-Gub+7bOQFKtaSg4qPTvosxcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:48374 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750972AbdH3QmB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Aug 2017 12:42:01 -0400
Content-Disposition: inline
In-Reply-To: <CAOesGMg130BvqS1vGid9jm-G7-Gub+7bOQFKtaSg4qPTvosxcA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Rezvanov <dmitry.rezvanov@yandex.ru>

On 30/08/2017 at 09:21:47 -0700, Olof Johansson wrote:
> On Wed, Aug 30, 2017 at 6:19 AM, Alexandre Belloni
> <alexandre.belloni@free-electrons.com> wrote:
> > On 30/08/2017 at 23:07:12 +1000, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Commit
> >>
> >>   1a9f9af07e80 ("ARM: dts: at91: at91sam9g45: add AC97")
> >>
> >> is missing a Signed-off-by from its author.
> >>
> >
> > Oh crap, it was the only one not in linux-next... iThe original
> > submission had the SoB:
> > https://patchwork.kernel.org/patch/9794803/
> >
> > Olof, how do you want to proceed?
> 
> Please prepare a new branch. I'll rebuild next/dt (and our for-next)
> to drop your previous version, and merge it when it's ready.
> 
> Thanks for the heads up, Stephen. I presume you have a script that
> checks this? It's something we should run too, do you keep it in a
> shared location?
> 

Yeah, I'm interested as well as I'm already using a pre_push hook to check
that my SoB is there.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
