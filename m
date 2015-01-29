From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: Hangs in libhugetlbfs tests in -next
Date: Thu, 29 Jan 2015 16:42:17 +0000
Message-ID: <20150129164217.GK8951@e104818-lin.cambridge.arm.com>
References: <20150128152412.GX21293@sirena.org.uk>
 <CAPvkgC3OLdf7ZgDfAC5R4wgZDirAZAmY+ZsBLQedpjq+HJHACw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss-mx-na.foss.arm.com ([217.140.108.86]:46113 "EHLO
	foss-mx-na.foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755880AbbA2Qm1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Jan 2015 11:42:27 -0500
Content-Disposition: inline
In-Reply-To: <CAPvkgC3OLdf7ZgDfAC5R4wgZDirAZAmY+ZsBLQedpjq+HJHACw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve Capper <steve.capper@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Will Deacon <Will.Deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mel Gorman <mgorman@suse.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, Jan 29, 2015 at 04:02:27PM +0000, Steve Capper wrote:
> On 28 January 2015 at 15:24, Mark Brown <broonie@kernel.org> wrote:
> > For at least the past couple of days tests of libhugetlbfs have been
> > hanging on mustang in the mlock test running ARMv8 defconfig with both
> > 32 bit and 64 bit userspace - after the mprotect test (the one before
> > it) we get no console output for several hours so it appears that the
> > test has deadlocked.  The tail of the log is:
> >
> > | find_path (2M: 64):   PASS
> > | unlinked_fd (2M: 64): PASS
> > | readback (2M: 64):    PASS
> > | truncate (2M: 64):    PASS
> > | shared (2M: 64):      PASS
> > | mprotect (2M: 64):    PASS
> >
> > and then a timeout.
> >
> > This may be a generic bug but my ability to run these tests on other
> > platforms with huge page support using the infrastructure I'm using is
> > limited so I've not been able to test elsewhere and confirm.
> 
> I've bisected this problem down to commit:
> f2c0507 mm: remove remaining references to NUMA hinting bits and helpers
> 
> Essentially the mlock unit test from libhugetlbfs then fails with
> hugetlbf_fault being called in an infinite loop.
> 
> After this commit is applied we get the following definition of:
> static inline int is_swap_pte(pte_t pte)
> {
>         return !pte_none(pte);
> }
> 
> rather than:
> static inline int is_swap_pte(pte_t pte)
> {
>         return !pte_none(pte) && !pte_present_nonuma(pte);
> }
> 
> (note here that pte_present_nonuma == pte_present on arm64)
> 
> I think this is a typo in the patch, as entries should be checked for
> present before being determined to be swap or file?

pte_file() check is removed in commit 7823d501c417fc but I can't tell
exactly why, I haven't followed the patch series. But Mel's commit
removes pte_present_nonuma() entirely, I think it should have been
replaced with pte_present().

-- 
Catalin
