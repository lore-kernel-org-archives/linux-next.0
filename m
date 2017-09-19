From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 19 (drivers/gpu/drm/i915/i915_gem.c)
Date: Tue, 19 Sep 2017 08:49:36 -0700
Message-ID: <537cae4b-0157-85da-2a47-a768e34eb412@infradead.org>
References: <20170919141557.03ffb2a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:39736 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751365AbdISPti (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Sep 2017 11:49:38 -0400
In-Reply-To: <20170919141557.03ffb2a7@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On 09/18/17 21:15, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20170918:
> 
> Linus' tree still had its build failure for which I reverted a commit.
> 
> The drm-intel tree gained conflicts against Linus' tree.
> 

on x86_64:

In file included from ../drivers/gpu/drm/i915/i915_gem.c:5342:0:
../drivers/gpu/drm/i915/selftests/mock_gem_device.c: In function 'mock_gem_device':
../drivers/gpu/drm/i915/selftests/mock_gem_device.c:150:20: error: 'struct dev_archdata' has no member named 'iommu'
  pdev->dev.archdata.iommu = (void *)-1;
                    ^

when IOMMU_SUPPORT, INTEL_IOMMU, and AMD_IOMMU are not enabled.

struct dev_archdata {
#if defined(CONFIG_INTEL_IOMMU) || defined(CONFIG_AMD_IOMMU)
	void *iommu; /* hook for IOMMU specific extension */
#endif
};



-- 
~Randy
