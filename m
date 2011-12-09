From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm-lpae tree with the arm tree
Date: Fri, 9 Dec 2011 10:36:52 +0000
Message-ID: <20111209103652.GA23753@arm.com>
References: <20111208110059.1d88730db9358e079949b89c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:50641 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750844Ab1LIKhK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Dec 2011 05:37:10 -0500
Content-Disposition: inline
In-Reply-To: <20111208110059.1d88730db9358e079949b89c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, Russell King <rmk@arm.linux.org.uk>

Hi Stephen,

On Thu, Dec 08, 2011 at 12:00:59AM +0000, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-lpae tree got a conflict in
> arch/arm/mm/idmap.c between commits 8903826d0cd9 ("ARM: idmap: populate
> identity map pgd at init time using .init.text") and 4e8ee7de227e ("ARM:
> SMP: use idmap_pgd for mapping MMU enable during secondary booting") from
> the arm tree and commit 1932aa1edc86 ("ARM: LPAE: Add identity mapping
> support for the 3-level page table format") from the arm-lpae tree.
> 
> I tried to fix it up (see below) and can carry the fix as necessary.

The fix looks correct but Russell merged the LPAE patches into his tree
last night and sorted out the conflicts, so you can now drop my for-next
branch from -next (I'll still keep the kmemleak one).

Thanks.

-- 
Catalin
