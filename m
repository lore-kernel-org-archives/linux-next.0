From: Kevin Winchester <kjwinchester@gmail.com>
Subject: Re: linux-next: Tree for June 11
Date: Wed, 11 Jun 2008 21:17:09 -0300
Message-ID: <48506B05.6030507@gmail.com>
References: <20080611193840.08a35b14.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.29]:44091 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751826AbYFLARk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Jun 2008 20:17:40 -0400
Received: by yw-out-2324.google.com with SMTP id 9so2078430ywe.1
        for <linux-next@vger.kernel.org>; Wed, 11 Jun 2008 17:17:12 -0700 (PDT)
In-Reply-To: <20080611193840.08a35b14.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since next-20080610:
> 
> Dropped trees (temporary): ldp (it is unfetchable - probably something to
> do with the new Staging tree), block (it just has too many conflicts and
> breaks the powerpc build).
> 
> The kbuild-current tree is now itself again.
> 
> The kbuild tree fixed it build problem.
> 
> The usb tree lost its hid build problem.
> 
> The tip-core tree lost its conflict (since the kbuild tree effectively
> moved).
> 
> The x86 tree gained two conflicts with the ftrace tree.
> 
> The pci tree lost its conflict with the kbuild-current tree but gained
> one with the x86 tree and one with the driver-core tree.
> 
> The hid tree lost its conflict with the driver-core tree.
> 
> The nsfd tree gained a conflict with the cpus4096 tree.
> 
> The powerpc tree was fixed up so that it no longer needed a commit
> reverted.
> 
> The net tree lost its conflict with the net-current tree.
> 
> The galak tree gained a conflict with the net tree.
> 
> The wireless tree lost all its conflicts.
> 
> The rr tree gained a conflict with the net-current tree.
> 
> I have applied the following temporary patch for known build problems:
> 
> 	"Fix various 8390 builds" - the net tree broke builds on various
> architectures - hopefully this patch will go into the net tree shortly.
> 
> The powerpc64 allyesconfig build is broken, probably by ftrace.
> The sparc32 defconfig build is broken, probably by the kbuild tree.
> 

I see a problem with this tree (and possibly with ones from previous 
days - I haven't tested next in 2-3 days or so).  I have no direct 
rendering as reported by glxinfo, whereas with Linus' latest tree I do.

I checked my logs and I see:


PCI: Using ACPI for IRQ routing
PCI: Cannot allocate resource region 0 of device 0000:00:00.0
agpgart: Detected AGP bridge 0
agpgart: Aperture conflicts with PCI mapping.
agpgart: Aperture from AGP @ e0000000 size 128 MB
agpgart: Aperture conflicts with PCI mapping.
agpgart: No usable aperture found.
agpgart: Consider rebooting with iommu=memaper=2 to get a good aperture.


In a working kernel, all I see is:

PCI: Using ACPI for IRQ routing
agpgart: Detected AGP bridge 0
agpgart: Aperture from AGP @ e0000000 size 128 MB

Does anyone have any idea where I would start to look for the cause? 
Would it be a PCI problem?  An AGP problem?  An x86 problem?

If necessary I can bisect, but 12-13 compile-boot cycles will take me a 
few evenings worth of computer time.  A targeted revert or two to try 
would help.

Thanks,

-- 
Kevin Winchester

