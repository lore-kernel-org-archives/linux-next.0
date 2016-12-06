From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 6 Dec 2016 12:55:38 +0000
Message-ID: <20161206125538.GF25385@dell.home>
References: <20161206111459.77b05dc4@canb.auug.org.au>
 <87inqxc2lr.wl%kuninori.morimoto.gx@renesas.com>
 <20161206093745.gerksfd5gygxk6ym@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:37516 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbcLFMxV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2016 07:53:21 -0500
Received: by mail-wm0-f47.google.com with SMTP id t79so124380437wmt.0
        for <linux-next@vger.kernel.org>; Tue, 06 Dec 2016 04:52:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20161206093745.gerksfd5gygxk6ym@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 06 Dec 2016, Mark Brown wrote:

> On Tue, Dec 06, 2016 at 12:41:15AM +0000, Kuninori Morimoto wrote:
> > > In file included from sound/soc/codecs/cq93vc.c:32:0:
> > > include/linux/mfd/davinci_voicecodec.h:31:27: fatal error: mach/hardware.h: No such file or directory
> > > 
> 
> > As I indicated on cover letter, this patch is based on
> 
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git :: for-mfd-next
> 
> > 	Especially this commit
> 
> > 	8ca9edc837932469b81b8b47ea43a074b6add970
> > 	("mfd: davinci_voicecodec: Tidyup header difinitions")
> 
> Reverted.  Lee, there is actually a dependency here...

No idea what you're talking about.

Are you going to allude to the patch you reverted?

I assume you wish for me to pick it up?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
