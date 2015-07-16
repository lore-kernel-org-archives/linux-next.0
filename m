From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: next-20150716 build: 4 failures 88 warnings (next-20150716)
Date: Thu, 16 Jul 2015 14:48:36 +0100
Message-ID: <20150716134836.GB26865@e104818-lin.cambridge.arm.com>
References: <E1ZFg2R-0001bO-R5@optimist>
 <20150716134152.GJ4039@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([146.101.78.143]:24254 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751913AbbGPNsj convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 09:48:39 -0400
In-Reply-To: <20150716134152.GJ4039@sirena.org.uk>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Toshi Kani <toshi.kani@hp.com>, Matthew Wilcox <willy@linux.intel.com>, Will Deacon <Will.Deacon@arm.com>, "kernel-build-reports@lists.linaro.org" <kernel-build-reports@lists.linaro.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jul 16, 2015 at 02:41:52PM +0100, Mark Brown wrote:
> On Thu, Jul 16, 2015 at 11:05:11AM +0100, Build bot for Mark Brown wrote:
> 
> Today's linux-next fails to build an arm64 allnoconfig due to "mm: make
> GUP handle pfn mapping unless FOLL_GET is requested" which causes:
> 
> > 	arm64-allnoconfig
> > ../mm/gup.c:51:4: error: implicit declaration of function 'update_mmu_cache' [-Werror=implicit-function-declaration]
> 
> The update_mmu_cache() function is defined unconditionally in
> asm/tlbflush.h so there is presumably some path of conditional
> inclusions which causes it not to get declared in an allnoconfig - I
> didn't chase that down yet.

Maybe we should move it to asm/pgtable.h like many other architectures.

-- 
Catalin
