From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: linux-next: manual merge of the i.MX tree with the  tree
Date: Mon, 23 May 2011 09:19:09 +0200
Message-ID: <20110523071909.GD20715@pengutronix.de>
References: <20110523114542.9868cba1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110523114542.9868cba1.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Mon, May 23, 2011 at 11:45:42AM +1000, Stephen Rothwell wrote:
> Hi Sascha,
> 
> Today's linux-next merge of the i.MX tree got a conflict in
> arch/arm/mach-imx/Kconfig arch/arm/plat-mxc/Kconfig between the "same"
> commits from the arm tree and the i.MX tree.
> 
> Please don't rearrange commits when upstreaming them - or if you do, then
> update the source tree as well.  I am assuming that the commits that are
> in the arm tree amount to the same as what has been int the i.MX tree for
> some time.  There are a couple of extra commits in the i.MX tree, so I
> just used the i.MX version of those files.   This may not work.

I have forgotten that my tree shows up in -next twice once rmk pulled
from me. I removed these patches from my -next queue and will hopefully
remember it next time aswell.

Thanks
 Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
