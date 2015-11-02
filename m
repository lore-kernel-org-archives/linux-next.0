From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Mon, 2 Nov 2015 10:39:13 +0000
Message-ID: <20151102103911.GC11516@MBP>
References: <20151101105327.49bffef4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:50278 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752067AbbKBKjR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Nov 2015 05:39:17 -0500
Content-Disposition: inline
In-Reply-To: <20151101105327.49bffef4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will.deacon@arm.com>

On Sun, Nov 01, 2015 at 10:53:27AM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/kernel/suspend.c
> 
> between commit:
> 
>   e13d918a19a7 ("arm64: kernel: fix tcr_el1.t0sz restore on systems with extended idmap")
> 
> from Linus' tree and commit:
> 
>   8e63d3887669 ("arm64: flush: use local TLB and I-cache invalidation")
> 
> from the arm64 tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary
> (no action is required).

The fix-up is fine. Thanks.

-- 
Catalin
