From: Steve Capper <steve.capper@linaro.org>
Subject: Re: linux-next: manual merge of the arm64-hugepages tree with the
 arm64 tree
Date: Mon, 17 Jun 2013 09:42:25 +0100
Message-ID: <20130617084224.GB28225@linaro.org>
References: <20130617174528.fc0381c10f8c5296b4efe776@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130617174528.fc0381c10f8c5296b4efe776@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 17, 2013 at 05:45:28PM +1000, Stephen Rothwell wrote:
> Hi Steve,

Hi Stephen,

> 
> Today's linux-next merge of the arm64-hugepages tree got conflicts in
> arch/arm64/include/asm/pgtable-hwdef.h and
> arch/arm64/include/asm/pgtable.h between commit 363116073a26 ("arm64:
> KVM: define HYP and Stage-2 translation page flags") from the arm64 tree
> and commits 072b1b62a643 ("ARM64: mm: Make PAGE_NONE pages read only and
> no-execute") and af07484863e0 ("ARM64: mm: THP support") from the
> arm64-hugepages tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 

Thanks, the fixup looks good to me.

> Note that the arm64 tree version of PMD_SECT_USER used a pteval_t where I
> would have expected a pmdval_t like the arm64-hugepages tree version.

Yes I think it should be a pmdval_t too, I will follow this up.

Cheers,
-- 
Steve
