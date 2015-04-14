From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Mon, 13 Apr 2015 18:07:06 -0700
Message-ID: <20150414010706.GB29061@sonymobile.com>
References: <20150409143309.3a1fac67@canb.auug.org.au>
 <20150409093556.GP6023@sirena.org.uk>
 <20150414094403.30126f2d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([212.209.106.2]:10649 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752032AbbDNBHM (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 21:07:12 -0400
Content-Disposition: inline
In-Reply-To: <20150414094403.30126f2d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hai Li <hali@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>

On Mon 13 Apr 16:44 PDT 2015, Stephen Rothwell wrote:

> Hi all,
> 
> On Thu, 9 Apr 2015 10:35:56 +0100 Mark Brown <broonie@kernel.org> wrote:
> >
> > On Thu, Apr 09, 2015 at 02:33:09PM +1000, Stephen Rothwell wrote:
> > 
> > > After merging the regulator tree, today's linux-next build (arm multi_v7_defconfig)
> > > failed like this:
> > 
> > > drivers/gpu/drm/msm/dsi/dsi_host.c: In function 'dsi_host_regulator_disable':
> > > drivers/gpu/drm/msm/dsi/dsi_host.c:330:4: error: implicit declaration of function 'regulator_set_optimum_mode' [-Werror=implicit-function-declaration]
> > >     regulator_set_optimum_mode(s[i].consumer,
> > >     ^
> > 
> > > Caused by commit a689554ba6ed ("drm/msm: Initial add DSI connector
> > > support") from the drm tree interacting with commit ae6e808f1574
> > > ("regulator: Drop temporary regulator_set_optimum_mode wrapper") from
> > > the regulator tree.
> > 
> > > This happens every time someone renames/changes an API :-(
> > 
> > It's *really* questionable if anyone should be using that API in the
> > first place, one of the reasons it's being removed is that it's really
> > unclear that anything would be able to successfully use it as-is.  The
> > easist thing might be to drop the new usage for the time being.
> 
> This fix up patch is now needed when the drm tree is merged with Linus'
> tree (the regulator part has been merged).
> 
> Mark, what did you above response mean?  Should the drm tree be using
> something different?
> 

What Mark mean is basically that there shouldn't be any users of
regulator_set_optimum_mode() for various reasons and we introduced
regulator_set_load() to solve these, before any users popped up.

Unfortunately we weren't fast enough and people got some code in that
uses the API that isn't implemented for any Qualcomm platform today...


Your patch looks correct and should preferrably be added to the drm
tree, or the last patch in my series that drops the API wrapper should
be held back until rc1(?)

Regards,
Bjorn
