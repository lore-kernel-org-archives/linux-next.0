From: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>
Subject: RE: [PATCH] regmap: fix of_regmap_get_endian()
Date: Tue, 19 Aug 2014 05:43:57 +0000
Message-ID: <7374fedf5efa49edb3bc3f1d4f4e85d6@BY2PR0301MB0613.namprd03.prod.outlook.com>
References: <1408400044-2560-1-git-send-email-swarren@wwwdotorg.org>
 <20140819052141.GA12859@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bn1blp0181.outbound.protection.outlook.com ([207.46.163.181]:42487
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751624AbaHSFoC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Aug 2014 01:44:02 -0400
In-Reply-To: <20140819052141.GA12859@ulmo>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Brown <broonie@kernel.org>, Thierry Reding <treding@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>

Hi,

I found this patch has some confliction with the Mark's newest Remgap-Tree's
origin/topic/dt-endian branch.

Javier Martinez has already fix some of these.

Thanks,

BRs
Xiubo



> -----Original Message-----
> From: Thierry Reding [mailto:thierry.reding@gmail.com]
> Sent: Tuesday, August 19, 2014 1:22 PM
> To: Stephen Warren
> Cc: Mark Brown; Thierry Reding; linux-kernel@vger.kernel.org; linux-
> next@vger.kernel.org; Stephen Warren; Xiubo Li-B47053
> Subject: Re: [PATCH] regmap: fix of_regmap_get_endian()
> 
> On Mon, Aug 18, 2014 at 04:14:04PM -0600, Stephen Warren wrote:
> > From: Stephen Warren <swarren@nvidia.com>
> >
> > Commit d647c199510c ("regmap: add DT endianness binding support") has
> > some issues. Specifically, if config->reg_format_endian is not explicitly
> > set, it will be zero, i.e. REGMAP_ENDIAN_DEFAULT. The switch statement
> > that looks up the *endian from DT for the type==REGMAP_ENDIAN_VAL case
> > doesn't change *endian in the type==REGMAP_ENDIAN_REG case. However, the
> > test immediately following, compares *endian against REGMAP_ENDIAN_NATIVE,
> > and if not equal, returns *endian as is. This ends up returning
> > REGMAP_ENDIAN_DEFAULT, which the calling code does not expect, eventually
> > leading to e.g.:
> >
> > Unable to handle kernel NULL pointer dereference at virtual address 00000024
> > ...
> > [<c02efd64>] (regcache_cache_only) from [<c0465fa8>]
> (tegra30_ahub_probe+0x1b8/0x430)
> > [<c0465fa8>] (tegra30_ahub_probe) from [<c02e196c>]
> (platform_drv_probe+0x2c/0x5c)
> > [<c02e196c>] (platform_drv_probe) from [<c02e0580>]
> (driver_probe_device+0x10c/0x22c)
> > [<c02e0580>] (driver_probe_device) from [<c02e072c>]
> (__driver_attach+0x8c/0x90)
> >
> > This patch solves this by:
> > * When looking up the endianness from DT, don't change *endian at all if
> >   there is no DT property; leave it set to REGMAP_ENDIAN_DEFAULT so the
> >   code falls through to other data sources in the same way as before.
> >   Now, the "unspecified" case acts the same for both REGMAP_ENDIAN_REG and
> >   REGMAP_ENDIAN_VAL.
> > * After potentially looking up the endianness from DT, check *endian
> >   against REGMAP_ENDIAN_DEFAULT instead of REGMAP_ENDIAN_NATIVE to avoid
> >   returning unexpected values.
> >
> > Also, clean up the code a bit:
> >
> > * Make the comments briefer, and only refer to the specific action taken
> >   at their location. This makes most of the comments independent of DT,
> >   and easier to follow.
> > * Restore the overall default of REGMAP_ENDIAN_BIG if none of the config,
> >   DT, or the bus specify any endianness. Since all busses specify an
> >   endianness now, this makes no difference, but I saw no justification in
> >   the patch description for changing the default default.
> > * s/of_regmap_get_endian/regmap_get_endian/ since the function isn't DT-
> >   specific, even if the reason it was originally added was to add some
> >   DT-specific features.
> >
> > Reported-by: Thierry Reding <treding@nvidia.com>
> > Fixes: d647c199510c ("regmap: add DT endianness binding support")
> > Cc: Xiubo Li <Li.Xiubo@freescale.com>
> > Signed-off-by: Stephen Warren <swarren@nvidia.com>
> > ---
> >  drivers/base/regmap/regmap.c | 58 ++++++++++++++---------------------------
> ---
> >  1 file changed, 18 insertions(+), 40 deletions(-)
> 
> Thanks for fixing this, Stephen.
> 
> Tested-by: Thierry Reding <treding@nvidia.com>
