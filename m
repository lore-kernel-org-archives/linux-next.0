From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with the arm64-acpi
 tree
Date: Thu, 26 Mar 2015 18:35:13 +0000
Message-ID: <alpine.DEB.2.02.1503261834490.7982@kaball.uk.xensource.com>
References: <20150326173127.27fc5f42@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150326173127.27fc5f42@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Will Deacon <will.deacon@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hanjun Guo <hanjun.guo@linaro.org>, David Vrabel <david.vrabel@citrix.com>
List-Id: linux-next.vger.kernel.org

On Thu, 26 Mar 2015, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xen-tip tree got a conflict in
> drivers/xen/Kconfig between commit 94ccae47e02d ("XEN / ACPI: Make XEN
> ACPI depend on X86") from the arm64-acpi tree and commit 628c28eefd6f
> ("xen: unify foreign GFN map/unmap for auto-xlated physmap guests")
> from the xen-tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

That's all right, thank you.


> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/xen/Kconfig
> index a31cd29b68a8,afc39ca5cc4f..000000000000
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@@ -253,8 -253,10 +253,14 @@@ config XEN_EF
>   	def_bool y
>   	depends on X86_64 && EFI
>   
>  +config XEN_ACPI
>  +	def_bool y
>  +	depends on X86 && ACPI
>  +
> + config XEN_AUTO_XLATE
> + 	def_bool y
> + 	depends on ARM || ARM64 || XEN_PVHVM
> + 	help
> + 	  Support for auto-translated physmap guests.
> + 
>   endmenu
> 
