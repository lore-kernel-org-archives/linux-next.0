From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci-current tree build failure
Date: Mon, 28 Jul 2008 19:15:23 -0700
Message-ID: <200807281915.24018.jbarnes@virtuousgeek.org>
References: <20080729105213.0ac2acbd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-11.bluehost.com ([69.89.18.111]:46936 "HELO
	outbound-mail-11.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751792AbYG2CPg (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 22:15:36 -0400
In-Reply-To: <20080729105213.0ac2acbd.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Joerg Roedel <joerg.roedel@amd.com>, Ingo Molnar <mingo@elte.hu>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org

On Monday, July 28, 2008 5:52 pm Stephen Rothwell wrote:
> Hi Jesse,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> arch/powerpc/kernel/iommu.c:54: error: static declaration of
> 'iommu_num_pages' follows non-static declaration
> include/linux/iommu-helper.h:11: error: previous declaration of
> 'iommu_num_pages' was here
>
> Caused by commit 3bc9f79ee1ddc913be0a6d3592036683ef8a3148 ("iommu: add
> iommu_num_pages helper function") which introduced a global version of a
> function that powerpc has a different version of.  I am not sure that the
> two do the same thing - in fact they don't since powerpc can have a 64k
> page size and still need to use a 4k iommu pages.  I applied the
> patch below (which I personally hate :-))

Hopefully my ppc machine will arrive soon and I can build & test boot things 
so this won't happen in the future.

Joerg, what do you think here?

Thanks,
Jesse
