From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: linux-next: manual merge of the xen-two tree with Linus' tree
Date: Tue, 2 Oct 2012 11:44:14 +0100
Message-ID: <alpine.DEB.2.02.1210021141370.29232@kaball.uk.xensource.com>
References: <20121002141949.f6e61437bdce0d56d9d4321e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.eu.citrix.com ([62.200.22.115]:29068 "EHLO
	SMTP.EU.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750708Ab2JBKpP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Oct 2012 06:45:15 -0400
In-Reply-To: <20121002141949.f6e61437bdce0d56d9d4321e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <JBeulich@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>

On Tue, 2 Oct 2012, Stephen Rothwell wrote:
> Hi Konrad,
> 
> Today's linux-next merge of the xen-two tree got a conflict in
> drivers/xen/Makefile between commit 9fa5780beea1 ("USB EHCI/Xen:
> propagate controller reset information to hypervisor") from Linus' tree
> and commit 13febc84849d ("xen: do not compile manage, balloon, pci, acpi,
> pcpu and cpu_hotplug on ARM") from the xen-two tree.
> 
> I fixed it up (I am not sure exactly what it should depend on - see
> below) and can carry the fix as necessary (no action is required).
>
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/xen/Makefile
> index a4a3cab,cd28aae..0000000
> --- a/drivers/xen/Makefile
> +++ b/drivers/xen/Makefile
> @@@ -4,8 -8,11 +8,12 @@@ obj-y	+= xenbus
>   nostackp := $(call cc-option, -fno-stack-protector)
>   CFLAGS_features.o			:= $(nostackp)
>   
> + obj-$(CONFIG_XEN_DOM0)			+= $(dom0-y)
> + dom0-$(CONFIG_PCI) += pci.o
> ++dom0-$(CONFIG_X86) += dbgp.o
> + dom0-$(CONFIG_ACPI) += acpi.o
> + dom0-$(CONFIG_X86) += pcpu.o
>   obj-$(CONFIG_BLOCK)			+= biomerge.o
> - obj-$(CONFIG_HOTPLUG_CPU)		+= cpu_hotplug.o
>   obj-$(CONFIG_XEN_XENCOMM)		+= xencomm.o
>   obj-$(CONFIG_XEN_BALLOON)		+= xen-balloon.o
>   obj-$(CONFIG_XEN_SELFBALLOONING)	+= xen-selfballoon.o
 

Considering that dbgp doesn't seem to be very useful without PCI at the
moment, could we just turn it into:

dom0-$(CONFIG_PCI) += dbgp.o

?
