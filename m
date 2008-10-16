From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Wed, 15 Oct 2008 21:23:54 -0700
Message-ID: <200810152123.55165.jbarnes@virtuousgeek.org>
References: <20081016144105.fd0f5d5b.sfr@canb.auug.org.au> <1224128641.8157.502.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-119.bluehost.com ([69.89.22.19]:58480 "HELO
	outbound-mail-119.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751042AbYJPEai (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 00:30:38 -0400
In-Reply-To: <1224128641.8157.502.camel@pasglop>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: benh@kernel.crashing.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wednesday, October 15, 2008 8:44 pm Benjamin Herrenschmidt wrote:
> On Thu, 2008-10-16 at 14:41 +1100, Stephen Rothwell wrote:
> > Hi Jesse,
> >
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> >
> > drivers/pci/probe.c: In function 'pci_create_legacy_files':
> > drivers/pci/probe.c:69: error: 'pci_read_legacy_io' undeclared (first use
> > in this function) drivers/pci/probe.c:70: error: 'pci_write_legacy_io'
> > undeclared (first use in this function) drivers/pci/probe.c:80: error:
> > 'pci_mmap_legacy_mem' undeclared (first use in this function)
> >
> > Direct cause (probably) is commit
> > 913d3708831ec551ca8560ea2cc793f738df88d6 ("powerpc/PCI: Add legacy PCI
> > access via sysfs") which I have reverted. Actually caused by the removal
> > of commit
> > d965c04f27d4df28b1ce77b0aea6329c07a8e13d ("PCI: Add ability to mmap
> > legacy_io on some platforms") which the above commit depends on.
>
> Yup, Jesse, patch 1/2 is still good :-) It's patch 2/2 that I've been
> updating 3 times :-)

Hm, I must have applied the wrong ones... but I didn't do a ppc build to test.  
I'll fix it up.

Thanks,
Jesse
