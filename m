From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the arm-lpae tree with the arm tree
Date: Fri, 10 Jun 2011 15:43:27 +0100
Message-ID: <20110610144326.GC18133@e102109-lin.cambridge.arm.com>
References: <20110610105255.3105eef2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([94.185.240.25]:36357 "HELO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753421Ab1FJOne convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Jun 2011 10:43:34 -0400
In-Reply-To: <20110610105255.3105eef2.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <rmk@arm.linux.org.uk>

On Fri, Jun 10, 2011 at 01:52:55AM +0100, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-lpae tree got a conflict in
> arch/arm/mm/context.c between commit 07989b7ad63a ("Revert "ARM: 6943/1:
> mm: use TTBR1 instead of reserved context ID"") from the arm tree and
> commit 21fa7e3ea279 ("ARM: LPAE: Add context switching support") from the
> arm-lpae tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.

Thanks for this. I replaced the conflicting commit (21fa7e4e ARM: LPAE:
Add context switching support) with an older version (prior to patch
6943/1 that Russell reverted). The cpu_set_reserved_ttbr0() is now
called cpu_set_asid() and does something different.

In my for-next branch I also included the patches that Russell pushed
via his tree to be able to solve the conflicts:

51b5dba Revert "ARM: 6943/1: mm: use TTBR1 instead of reserved context ID"
25194f6 Revert "ARM: 6944/1: mm: allow ASID 0 to be allocated to tasks"

and I removed from my branch:

b488121 ARM: mm: fix racy ASID rollover broadcast on SMP platforms

Hopefully there shouldn't be further conflicts in tomorrow's -next tree.

-- 
Catalin
