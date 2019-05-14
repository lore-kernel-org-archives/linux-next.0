From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: linux-next: manual merge of the thermal-soc tree with Linus' tree
Date: Mon, 13 May 2019 20:44:11 -0700
Message-ID: <20190514034409.GA5691@localhost.localdomain>
References: <20190513104928.0265b40f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190513104928.0265b40f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gal Pressman <galpress@amazon.com>, Jason Gunthorpe <jgg@mellanox.com>, Talel Shenhar <talel@amazon.com>
List-Id: linux-next.vger.kernel.org

Stephen,

On Mon, May 13, 2019 at 10:49:28AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the thermal-soc tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   f23afd75fc99 ("RDMA/efa: Add driver to Kconfig/Makefile")
> 
> from Linus' tree and commit:
> 
>   7e34eb7dd067 ("thermal: Introduce Amazon's Annapurna Labs Thermal Driver")
> 
> from the thermal-soc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for spotting this. I am re-doing the branch based off v5.1-rc7,
where the last conflict went in with my current queue.

> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc MAINTAINERS
> index 2ff031b5e620,7defe065470d..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -745,15 -744,12 +745,21 @@@ S:	Supporte
>   F:	Documentation/networking/device_drivers/amazon/ena.txt
>   F:	drivers/net/ethernet/amazon/
>   
> + AMAZON ANNAPURNA LABS THERMAL MMIO DRIVER
> + M:	Talel Shenhar <talel@amazon.com>
> + S:	Maintained
> + F:	Documentation/devicetree/bindings/thermal/amazon,al-thermal.txt
> + F:	drivers/thermal/thermal_mmio.c
> + 
>  +AMAZON RDMA EFA DRIVER
>  +M:	Gal Pressman <galpress@amazon.com>
>  +R:	Yossi Leybovich <sleybo@amazon.com>
>  +L:	linux-rdma@vger.kernel.org
>  +Q:	https://patchwork.kernel.org/project/linux-rdma/list/
>  +S:	Supported
>  +F:	drivers/infiniband/hw/efa/
>  +F:	include/uapi/rdma/efa-abi.h
>  +
>   AMD CRYPTOGRAPHIC COPROCESSOR (CCP) DRIVER
>   M:	Tom Lendacky <thomas.lendacky@amd.com>
>   M:	Gary Hook <gary.hook@amd.com>
