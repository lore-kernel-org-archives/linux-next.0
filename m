From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 00/12] Thumb-2 kernel support
Date: Mon, 30 Jun 2008 12:51:10 -0700
Message-ID: <20080630125110.1dc5689a.akpm@linux-foundation.org>
References: <20080606173300.7930.31525.stgit@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:53671 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1763356AbYF3Tvu (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 15:51:50 -0400
In-Reply-To: <20080606173300.7930.31525.stgit@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-next@vger.kernel.org

On Fri, 06 Jun 2008 18:33:00 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> This series of patches allows the kernel to be compiled to Thumb-2 mode
> (on ARMv7 CPUs). The patches have been posted a few times on the list
> and the comments were implemented (hopefully I haven't missed any).
> 
> If/when there are no more comments, I'd like the series to be merged
> into the -mm tree if Andrew agrees. It was tested and generated against
> the 2.6.26-rc2-mm1 kernel.
> 
> It is also available via Git at git://linux-arm.org/linux-2.6 for-akpm.
> 
> Thanks.
> 
> 
> Catalin Marinas (12):
>       Thumb-2: Add Thumb-2 support to the build files
>       Thumb-2: Handle the exceptions in Thumb mode on noMMU kernels
>       Thumb-2: Implement the unified support for the RealView boards
>       Thumb-2: Implement the unified support for the Integrator boards
>       Thumb-2: Implement the unified boot code
>       Thumb-2: Implement the unified VFP support
>       Thumb-2: Implement unified locking support
>       Thumb-2: Implement the unified arch/arm/lib functions
>       Thumb-2: Implement the unified arch/arm/mm support
>       Thumb-2: Implementation of the unified start-up and exceptions code
>       Thumb-2: Add macros for the unified assembler syntax
>       Thumb-2: Add the ENDPROC declarations to the .S files

OK, I added this tree to -mm.  Nobody is likely to test or review it
there, but at least I might pick up on any merge or build issues.

If you're hankering for a 2.6.27 merge of this material it might be
more approprite to add it to linux-next.
