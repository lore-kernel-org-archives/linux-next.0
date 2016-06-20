From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: manual merge of the tpmdd tree with Linus' tree
Date: Mon, 20 Jun 2016 17:33:50 +0300
Message-ID: <20160620143350.GA7982@intel.com>
References: <20160620131345.1d6f64bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:38995 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752432AbcFTOhR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jun 2016 10:37:17 -0400
Content-Disposition: inline
In-Reply-To: <20160620131345.1d6f64bd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Christophe Ricard <christophe.ricard@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>

On Mon, Jun 20, 2016 at 01:13:45PM +1000, Stephen Rothwell wrote:
> Hi Jarkko,
> 
> Today's linux-next merge of the tpmdd tree got a conflict in:
> 
>   Documentation/devicetree/bindings/vendor-prefixes.txt
> 
> between commit:
> 
>   7aa5d38cfb77 ("of: Add Inforce Computing to vendor prefix list")
>   3eefa7e8cc85 ("dt-bindings: Add vendor prefix for TechNexion")
> 
> from Linus' tree and commits:
> 
>   45a33961f81a ("devicetree: Add infineon to vendor-prefix.txt")
>   3a34e75f6a91 ("devicetree: Add Trusted Computing Group to vendor-prefix.txt")
> 
> from the tpmdd tree.
> 
> BTW: commit 3a34e75f6a91 added the new entry out of alphabetical order.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Got you, thanks.

> -- 
> Cheers,
> Stephen Rothwell

/Jarkko

> 
> diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
> index d2bce2239769,717bae92e28a..000000000000
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@@ -125,10 -111,9 +125,11 @@@ hp	Hewlett Packar
>   i2se	I2SE GmbH
>   ibm	International Business Machines (IBM)
>   idt	Integrated Device Technologies, Inc.
>  +ifi	Ingenieurburo Fur Ic-Technologie (I/F/I)
>   iom	Iomega Corporation
>   img	Imagination Technologies Ltd.
> + infineon Infineon Technologies
>  +inforce	Inforce Computing
>   ingenic	Ingenic Semiconductor
>   innolux	Innolux Corporation
>   intel	Intel Corporation
> @@@ -251,12 -227,10 +252,13 @@@ st	STMicroelectronic
>   startek	Startek
>   ste	ST-Ericsson
>   stericsson	ST-Ericsson
>  +syna	Synaptics Inc.
>   synology	Synology, Inc.
>  +SUNW	Sun Microsystems, Inc
>   tbs	TBS Technologies
>  -tcl	Toby Churchill Ltd.
> + tcg	Trusted Computing Group
>  +tcl	Toby Churchill Ltd.
>  +technexion	TechNexion
>   technologic	Technologic Systems
>   thine	THine Electronics, Inc.
>   ti	Texas Instruments
