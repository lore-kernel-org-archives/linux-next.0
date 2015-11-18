From: Simon Horman <horms@verge.net.au>
Subject: Re: linux-next: manual merge of the tegra tree with the renesas tree
Date: Wed, 18 Nov 2015 08:04:25 -0800
Message-ID: <20151118160425.GB23302@verge.net.au>
References: <20151118101512.0691d12f@canb.auug.org.au>
 <20151118142257.GA32301@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50834 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755463AbbKRQE3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Nov 2015 11:04:29 -0500
Content-Disposition: inline
In-Reply-To: <20151118142257.GA32301@ulmo.nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <treding@nvidia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <damm+renesas@opensource.se>

On Wed, Nov 18, 2015 at 03:22:58PM +0100, Thierry Reding wrote:
> On Wed, Nov 18, 2015 at 10:15:12AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the tegra tree got a conflict in:
> > 
> >   arch/arm64/configs/defconfig
> > 
> > between commit:
> > 
> >   727e8d0126e3 ("arm64: defconfig: renesas: Enable Renesas r8a7795 SoC")
> > 
> > from the renesas tree and commit:
> > 
> >   0a31289369f8 ("arm64: defconfig: Enable serial-tegra driver")
> > 
> > from the tegra tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> 
> Looks good, thanks.

Likewise.
