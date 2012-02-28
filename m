From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] sound: fix trivial build error in mpc5200_dma.c
Date: Mon, 27 Feb 2012 19:43:20 -0500
Message-ID: <CAP=VYLrdAqUrn0WERvbM_JqVSPWxU94ZJkF7C0HaJysy6fCy7A@mail.gmail.com>
References: <1330204350-386-1-git-send-email-paul.gortmaker@windriver.com>
	<20120227145926.GK3191@opensource.wolfsonmicro.com>
	<4F4BFC16.2090602@freescale.com>
	<20120227235630.GC23230@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:62820 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753710Ab2B1AnV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Feb 2012 19:43:21 -0500
Received: by pbcup15 with SMTP id up15so2652193pbc.19
        for <linux-next@vger.kernel.org>; Mon, 27 Feb 2012 16:43:20 -0800 (PST)
In-Reply-To: <20120227235630.GC23230@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Timur Tabi <timur@freescale.com>, perex@perex.cz, tiwai@suse.de, lrg@ti.com, linux-next@vger.kernel.org

On Mon, Feb 27, 2012 at 6:56 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Feb 27, 2012 at 03:56:38PM -0600, Timur Tabi wrote:
>> Mark Brown wrote:
>
>> > Please also try to use changelog headers consistent with the subsy=
stem.
>
>> Can you explain what that means? =A0What are "changelog headers"?
>
> The first line of the changelog which gets treated specially in vario=
us
> ways.

Automated scripts?  Something else?   I'd be interested to know.

I have to admit being confused by this as well.  I paged through the
git whatchanged info, and guessed that I should have used a prefix
like "ASoC: mpc5200_dma" (camelcase sic) but I think that to expect
that level of awareness from general contributors is probably expecting
a bit much.  I like to think I'm not totally clueless, but I would have
never thought of the above in advance...

In any case, if I have further fixups I happen across, I will try to fe=
ed
your bots the correct prefix.

Paul.
