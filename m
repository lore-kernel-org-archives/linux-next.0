From: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: linux-next: build failure after merge of the iommu tree
Date: Mon, 07 Jul 2014 22:12:35 -0600
Message-ID: <1404792755.4256.110.camel@ul30vt.home>
References: <20140708140246.72b72682@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:64670 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751060AbaGHEMm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2014 00:12:42 -0400
In-Reply-To: <20140708140246.72b72682@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joerg Roedel <joro@8bytes.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2014-07-08 at 14:02 +1000, Stephen Rothwell wrote:
> Hi Joerg,
> 
> After merging the iommu tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> arch/powerpc/platforms/built-in.o:(.opd+0x29e8): multiple definition of `iommu_device_destroy'
> arch/powerpc/kernel/built-in.o:(.opd+0x5628): first defined here
> arch/powerpc/platforms/built-in.o: In function `.iommu_device_unlink':
> (.text+0x13240): multiple definition of `.iommu_device_unlink'
> arch/powerpc/kernel/built-in.o:(.text+0x2b240): first defined here
> arch/powerpc/platforms/built-in.o: In function `.iommu_device_create':
> (.text+0x13210): multiple definition of `.iommu_device_create'
> arch/powerpc/kernel/built-in.o:(.text+0x2b210): first defined here
> arch/powerpc/platforms/built-in.o: In function `.iommu_device_destroy':
> (.text+0x13220): multiple definition of `.iommu_device_destroy'
> arch/powerpc/kernel/built-in.o:(.text+0x2b220): first defined here
> arch/powerpc/platforms/built-in.o: In function `.iommu_device_link':
> (.text+0x13230): multiple definition of `.iommu_device_link'
> arch/powerpc/kernel/built-in.o:(.text+0x2b230): first defined here
> arch/powerpc/platforms/built-in.o:(.opd+0x2a00): multiple definition of `iommu_device_link'
> arch/powerpc/kernel/built-in.o:(.opd+0x5640): first defined here
> arch/powerpc/platforms/built-in.o:(.opd+0x2a18): multiple definition of `iommu_device_unlink'
> arch/powerpc/kernel/built-in.o:(.opd+0x5658): first defined here
> arch/powerpc/platforms/built-in.o:(.opd+0x29d0): multiple definition of `iommu_device_create'
> arch/powerpc/kernel/built-in.o:(.opd+0x5610): first defined here
> 
> Caused by commit c61959ecbbc6 ("iommu: Add sysfs support for IOMMUs").
> CONFIG_IOMMU_API is not set for this build.  Forgotten "static
> inline"s :-(

Yep, I already posted a patch for this:

http://lists.linuxfoundation.org/pipermail/iommu/2014-July/009123.html

Sorry for the trouble.  Thanks,

Alex
