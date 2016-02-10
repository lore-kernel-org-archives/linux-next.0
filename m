From: Will Deacon <will.deacon@arm.com>
Subject: Re: next-20160210 build: 2 failures 4 warnings (next-20160210)
Date: Wed, 10 Feb 2016 10:12:39 +0000
Message-ID: <20160210101238.GC1052@arm.com>
References: <E1aTQoy-0005cH-Tr@optimist>
 <20160210100837.GT13270@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:45861 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751994AbcBJKMg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Feb 2016 05:12:36 -0500
Content-Disposition: inline
In-Reply-To: <20160210100837.GT13270@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Andrew Pinski <apinski@cavium.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, Feb 10, 2016 at 10:08:37AM +0000, Mark Brown wrote:
> On Wed, Feb 10, 2016 at 09:12:25AM +0000, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build an arm64 allmodconfig due to:
> 
> > 	arm64-allmodconfig
> > ../arch/arm64/include/asm/processor.h:183:15: error: expected string literal before 'ARM64_LSE_ATOMIC_INSN'
> 
> due to 52e662326e1e915 (arm64: prefetch: don't provide
> spin_lock_prefetch with LSE) which adds use of ARM64_LSE_ATOMIC_INSN but
> does not add an inclusion of asm/lse.h which defines it.  Most files
> have an implicit include so build fine but a few don't which causes the
> failure.  It does add an inclusion of asm/alternative.h which may be the
> best place to add the inclusion.

I just sent a fix to the list.

Will
