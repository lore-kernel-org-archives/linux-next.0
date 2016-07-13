From: Jiri Kosina <jikos@kernel.org>
Subject: Re: linux-next: please clean up the hid tree
Date: Wed, 13 Jul 2016 11:21:36 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1607131111340.24757@cbobk.fhfr.pm>
References: <20160713092809.566559b5@canb.auug.org.au> <20160713112001.641f6bf1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43542 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753085AbcGMJVn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Jul 2016 05:21:43 -0400
In-Reply-To: <20160713112001.641f6bf1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 13 Jul 2016, Stephen Rothwell wrote:

> Hi Jiri,
> 
> The hid tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid.git#for-next)
> seems to be based on v3.19 and constists of a large number of merges
> (of stuff that is now in Linus' tree) and ends with one particulary
> large revert (of a merge).

Hi Stephen,

I try to keep the tree completely non-rebasing, as people are actually 
using it for development. But for-next is a bit special in this respect, 
and if there is a branch that could potentially be considered for 
ocasional rebasing, it's probably for-next one.

OTOH, what issues exactly are the extra merges causing for you please?

On Wed, 13 Jul 2016, Stephen Rothwell wrote:

> On Wed, 13 Jul 2016 09:28:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > The hid tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid.git#for-next)
> > seems to be based on v3.19 and constists of a large number of merges
> > (of stuff that is now in Linus' tree) and ends with one particulary
> > large revert (of a merge).
> 
> What I forgot to say is that that last revert creates lots of conflicts
> when I merge your tree:
> 
> CONFLICT (content): Merge conflict in sound/pci/hda/patch_realtek.c
> CONFLICT (content): Merge conflict in mm/shmem.c
> CONFLICT (content): Merge conflict in fs/dcache.c
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/inc/smu74_discrete.h
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/hwmgr/polaris10_hwmgr.h
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/hwmgr/polaris10_hwmgr.c
> CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
> CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap-smp.c
> CONFLICT (content): Merge conflict in Makefile
> 
> So I have just dropped the hid tree until it is cleaned up.

Ok, this is pretty odd. I'll look into what happened, it'll be resolved in 
a couple minutes, so please start pulling for-next again.

Thanks,

-- 
Jiri Kosina
SUSE Labs
