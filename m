From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the devicetree tree with the drm
 tree
Date: Mon, 13 Nov 2017 16:58:31 +1100
Message-ID: <20171113165831.19ebc9fa@canb.auug.org.au>
References: <20171030203756.35brom4ulrbgqesv@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34041 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751308AbdKMF6d (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 00:58:33 -0500
In-Reply-To: <20171030203756.35brom4ulrbgqesv@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Rob Herring <robh@kernel.org>, ave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Mark Brown <broonie@kernel.org>, Frank Rowand <frank.rowand@sony.com>, Stephen Boyd <stephen.boyd@linaro.org>, Jyri Sarha <jsarha@ti.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

On Mon, 30 Oct 2017 20:37:56 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the devicetree tree got a conflict in:
> 
>   drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
> 
> between commit:
> 
>   44cd3939c111b7 ("drm/tilcdc: Remove redundant OF_DETACHED flag setting")
> 
> from the drm tree and commit:
> 
>   f948d6d8b792bb ("of: overlay: avoid race condition between applying multiple overlays")
> 
> from the devicetree tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
> index 482299a6f3b0,54025af534d4..000000000000
> --- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
> @@@ -163,12 -162,8 +162,6 @@@ static struct device_node * __init tilc
>   		return NULL;
>   	}
>   
> - 	ret = of_resolve_phandles(overlay);
> - 	if (ret) {
> - 		pr_err("%s: Failed to resolve phandles: %d\n", __func__, ret);
> - 		return NULL;
> - 	}
>  -	of_node_set_flag(overlay, OF_DETACHED);
> --
>   	return overlay;
>   }
>   

Just a reminder that this conflict still exists.

-- 
Cheers,
Stephen Rothwell
