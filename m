From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
Date: Mon, 3 Jul 2017 12:58:04 +1000
Message-ID: <20170703125804.75340917@canb.auug.org.au>
References: <20170626105154.27dbca9d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36321 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752434AbdGCC6N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Jul 2017 22:58:13 -0400
In-Reply-To: <20170626105154.27dbca9d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>

Hi all,

With the merge window opening, just a reminder that this conflict still
exists.

On Mon, 26 Jun 2017 10:51:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Bjorn,
> 
> Today's linux-next merge of the pci tree got a conflict in:
> 
>   drivers/gpu/drm/radeon/radeon_device.c
> 
> between commit:
> 
>   4eb59793cca0 ("drm/radeon: add a PX quirk for another K53TK variant")
> 
> from Linus' tree and commit:
> 
>   22c21de73087 ("drm/radeon: make MacBook Pro d3_delay quirk more generic")
> 
> from the pci tree.
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
> diff --cc drivers/gpu/drm/radeon/radeon_device.c
> index 0a6444d72000,aecaafbc8417..000000000000
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@@ -136,12 -135,6 +135,10 @@@ static struct radeon_px_quirk radeon_px
>   	 * https://bugzilla.kernel.org/show_bug.cgi?id=51381
>   	 */
>   	{ PCI_VENDOR_ID_ATI, 0x6840, 0x1043, 0x2122, RADEON_PX_QUIRK_DISABLE_PX },
>  +	/* Asus K53TK laptop with AMD A6-3420M APU and Radeon 7670m GPU
>  +	 * https://bugs.freedesktop.org/show_bug.cgi?id=101491
>  +	 */
>  +	{ PCI_VENDOR_ID_ATI, 0x6741, 0x1043, 0x2122, RADEON_PX_QUIRK_DISABLE_PX },
> - 	/* macbook pro 8.2 */
> - 	{ PCI_VENDOR_ID_ATI, 0x6741, PCI_VENDOR_ID_APPLE, 0x00e2, RADEON_PX_QUIRK_LONG_WAKEUP },
>   	{ 0, 0, 0, 0, 0 },
>   };
>   

-- 
Cheers,
Stephen Rothwell
