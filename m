From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] tile: fix build failure
Date: Tue, 14 Feb 2017 10:01:57 +1100
Message-ID: <20170214100157.1740cdee@canb.auug.org.au>
References: <1485275961-20112-1-git-send-email-sudip.mukherjee@codethink.co.uk>
        <0a7c53b5-0d1f-baa1-b159-b188e68e8f26@mellanox.com>
        <58A23A20.30000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45539 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751288AbdBMXB7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Feb 2017 18:01:59 -0500
In-Reply-To: <58A23A20.30000@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Chris Metcalf <cmetcalf@mellanox.com>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

Hi Sudip,

On Mon, 13 Feb 2017 22:58:40 +0000 Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
>
> On Tuesday 24 January 2017 04:56 PM, Chris Metcalf wrote:
> > On 1/24/2017 11:39 AM, Sudip Mukherjee wrote:  
> >> From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> >>
> >> The build of tilegx allmodconfig was failing with errors like:
> >> ../arch/tile/include/asm/div64.h:5:15: error: unknown type name 'u64'
> >>   static inline u64 mul_u32_u32(u32 a, u32 b)
> >>                 ^~~
> >> ../arch/tile/include/asm/div64.h:5:31: error: unknown type name 'u32'
> >>   static inline u64 mul_u32_u32(u32 a, u32 b)
> >>                                 ^~~
> >> ../arch/tile/include/asm/div64.h:5:38: error: unknown type name 'u32'
> >>   static inline u64 mul_u32_u32(u32 a, u32 b)
> >>                                        ^~~
> >> In file included from ../fs/ubifs/ubifs.h:26:0,
> >>                   from ../fs/ubifs/shrinker.c:42:
> >> ../include/linux/math64.h: In function 'mul_u64_u32_shr':
> >> ../arch/tile/include/asm/div64.h:9:21: error: implicit declaration of
> >>     function 'mul_u32_u32' [-Werror=implicit-function-declaration]
> >>
> >> The simplest solution was to include the types header file.
> >>
> >> Fixes: 9e3d6223d209 ("math64, timers: Fix 32bit mul_u64_u32_shr() and
> >> friends")
> >> Cc: Peter Zijlstra <peterz@infradead.org>
> >> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
> >> ---
> >>
> >> build log is at:
> >> https://travis-ci.org/sudipm-mukherjee/parport/jobs/194717687
> >>
> >>   arch/tile/include/asm/div64.h | 1 +
> >>   1 file changed, 1 insertion(+)  
> >
> > Acked-by: Chris Metcalf <cmetcalf@mellanox.com>
> >  
> 
> linux-next is still failing for this error. Who will pick this up?

Presumably the tip tree (timers/core).  Added Thomas to cc.

-- 
Cheers,
Stephen Rothwell
