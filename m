From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Date: Thu, 17 Mar 2016 02:43:19 +0100
Message-ID: <20160317014319.GP1990@wotan.suse.de>
References: <20160317114516.1af8f0e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160317114516.1af8f0e6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Vincent Abriou <vincent.abriou@st.com>
List-Id: linux-next.vger.kernel.org

Stephen,

thanks a lot for addressing that conflict.

Replying top-style on purpose. In the future such type of conflicts should
be resolvable automatically through a git conflict resolution hook that
would use Coccinelle if present when it detects a patch with Coccinelle SmPL
grammar has been used with no required addendums. Such a tool and
further enhancements (automatic SmPL inference, if a patch did not have
the grammar spelled out in the commit log) are documented here:

http://kernelnewbies.org/KernelProjects/linux-oven

If you want this tomorrow consider funding Julia's R&D more :D

  Luis

On Thu, Mar 17, 2016 at 11:45:16AM +1100, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next merge of the drm tree got a conflict in:
> 
>   drivers/gpu/drm/sti/sti_hqvdp.c
> 
> between commit:
> 
>   f6e45661f9be ("dma, mm/pat: Rename dma_*_writecombine() to dma_*_wc()")
> 
> from Linus' tree and commit:
> 
>   52807ae90e76 ("drm/sti: use u32 to store DMA addresses")
> 
> from the drm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/gpu/drm/sti/sti_hqvdp.c
> index 1d3c3d029603,d7c1f427811d..000000000000
> --- a/drivers/gpu/drm/sti/sti_hqvdp.c
> +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
> @@@ -617,9 -852,9 +852,8 @@@ static void sti_hqvdp_init(struct sti_h
>   
>   	/* Allocate memory for the VDP commands */
>   	size = NB_VDP_CMD * sizeof(struct sti_hqvdp_cmd);
> - 	hqvdp->hqvdp_cmd = dma_alloc_wc(hqvdp->dev, size,
> - 					&hqvdp->hqvdp_cmd_paddr,
>  -	hqvdp->hqvdp_cmd = dma_alloc_writecombine(hqvdp->dev, size,
>  -					 &dma_addr,
>  -					 GFP_KERNEL | GFP_DMA);
> ++	hqvdp->hqvdp_cmd = dma_alloc_wc(hqvdp->dev, size, &dma_addr,
>  +					GFP_KERNEL | GFP_DMA);
>   	if (!hqvdp->hqvdp_cmd) {
>   		DRM_ERROR("Failed to allocate memory for VDP cmd\n");
>   		return;
> 

-- 
Luis Rodriguez, SUSE LINUX GmbH
Maxfeldstrasse 5; D-90409 Nuernberg
