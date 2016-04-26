From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: linux-next: manual merge of the xen-tip tree with the arm64
 tree
Date: Tue, 26 Apr 2016 10:34:58 +0100 (BST)
Message-ID: <alpine.DEB.2.10.1604261034360.24872@sstabellini-ThinkPad-X260>
References: <20160426150041.4d86d498@canb.auug.org.au> <20160426092534.GD27312@arm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:49748 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751583AbcDZJfh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2016 05:35:37 -0400
In-Reply-To: <20160426092534.GD27312@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Shannon Zhao <shannon.zhao@linaro.org>

On Tue, 26 Apr 2016, Will Deacon wrote:
> On Tue, Apr 26, 2016 at 03:00:41PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the xen-tip tree got a conflict in:
> > 
> >   arch/arm64/kernel/setup.c
> > 
> > between commit:
> > 
> >   3194ac6e66cc ("arm64: Move unflatten_device_tree() call earlier.")
> > 
> > from the arm64 tree and commit:
> > 
> >   3915fea959b6 ("ARM: XEN: Move xen_early_init() before efi_init()")
> > 
> > from the xen-tip tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thanks Stephen, looks good to me.

It looks good to me too.

 
> > diff --cc arch/arm64/kernel/setup.c
> > index 65f515949baa,7cf992fe6684..000000000000
> > --- a/arch/arm64/kernel/setup.c
> > +++ b/arch/arm64/kernel/setup.c
> > @@@ -277,13 -336,13 +278,11 @@@ void __init setup_arch(char **cmdline_p
> >   
> >   	early_ioremap_reset();
> >   
> >  -	if (acpi_disabled) {
> >  -		unflatten_device_tree();
> >  +	if (acpi_disabled)
> >   		psci_dt_init();
> >  -	} else {
> >  +	else
> >   		psci_acpi_init();
> >  -	}
> >   
> > - 	xen_early_init();
> > - 
> >   	cpu_read_bootcpu_ops();
> >   	smp_init_cpus();
> >   	smp_build_mpidr_hash();
> > 
> 
