From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] mfd: Fixup clients of
 multi_reg_write/register_patch
Date: Fri, 18 Sep 2015 09:33:36 +0100
Message-ID: <20150918083336.GE7694@ck-lbox>
References: <20150717143934.4f0ce5d7@canb.auug.org.au>
 <20150717094436.GC21939@opensource.wolfsonmicro.com>
 <20150717103450.GJ11162@sirena.org.uk>
 <20150717140926.GG21939@opensource.wolfsonmicro.com>
 <20150720115935.686b556e@canb.auug.org.au>
 <20150918135015.1c5ab86e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:35395 "EHLO
	mx0a-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753000AbbIRI5Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Sep 2015 04:57:24 -0400
Content-Disposition: inline
In-Reply-To: <20150918135015.1c5ab86e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Nariman Poushin <nariman@opensource.wolfsonmicro.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>

On Fri, Sep 18, 2015 at 01:50:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 20 Jul 2015 11:59:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Fri, 17 Jul 2015 15:09:26 +0100 Nariman Poushin <nariman@opensource.wolfsonmicro.com> wrote:
> > >
> > > Introduced by:
> > > commit 8019ff6cfc04
> > > ("regmap: Use reg_sequence for multi_reg_write / register_patch")
> > > 
> > > Interacting with:
> > > commit 561629755a21 ("mfd: arizona: Add support for WM8998 and WM1814")
> > > commit 81207880cef2 ("mfd: wm5110: Add register patch for rev E and above")
> > > 
> > > Signed-off-by: Nariman Poushin <nariman@opensource.wolfsonmicro.com>
> > > ---
> > >  drivers/mfd/wm5110-tables.c | 2 +-
> > >  drivers/mfd/wm8998-tables.c | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > I will apply both these patches as merge fix patches in linux-next
> > today.  Thanks.
> 
> It looks like that patch has been forgotten as I am still applying it
> to the linux-next tree every day ...

Apologies if I am a little out of my depth here, but are we in
the situation where you are expecting this to go through the MFD
tree and Lee is expecting it to go through your tree?

Assuming this is the case, Lee could you perhaps pull this fix in
fairly soon? As it is causing build warning for some configs, in
Linus's tree at the moment. I am quite happy to resend it on
Nariman's behalf if required (he is on holiday at the moment).

Thanks,
Charles
