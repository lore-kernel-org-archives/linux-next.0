From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: please clean up the hid tree
Date: Wed, 13 Jul 2016 11:20:01 +1000
Message-ID: <20160713112001.641f6bf1@canb.auug.org.au>
References: <20160713092809.566559b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56044 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751285AbcGMBUE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Jul 2016 21:20:04 -0400
In-Reply-To: <20160713092809.566559b5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jiri,

On Wed, 13 Jul 2016 09:28:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> The hid tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid.git#for-next)
> seems to be based on v3.19 and constists of a large number of merges
> (of stuff that is now in Linus' tree) and ends with one particulary
> large revert (of a merge).

What I forgot to say is that that last revert creates lots of conflicts
when I merge your tree:

CONFLICT (content): Merge conflict in sound/pci/hda/patch_realtek.c
CONFLICT (content): Merge conflict in mm/shmem.c
CONFLICT (content): Merge conflict in fs/dcache.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/inc/smu74_discrete.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/hwmgr/polaris10_hwmgr.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/hwmgr/polaris10_hwmgr.c
CONFLICT (content): Merge conflict in arch/powerpc/Kconfig
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/omap-smp.c
CONFLICT (content): Merge conflict in Makefile

So I have just dropped the hid tree until it is cleaned up.

-- 
Cheers,
Stephen Rothwell
