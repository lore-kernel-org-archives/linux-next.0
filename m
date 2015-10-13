From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the tip tree with the arm64 tree
Date: Tue, 13 Oct 2015 10:50:03 +0100
Message-ID: <20151013095003.GC21550@arm.com>
References: <20151013131048.51f00118@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:51599 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751805AbbJMJuE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Oct 2015 05:50:04 -0400
Content-Disposition: inline
In-Reply-To: <20151013131048.51f00118@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 13, 2015 at 01:10:48PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/arm64/include/asm/atomic.h
> 
> between commit:
> 
>   305d454aaa29 ("arm64: atomics: implement native {relaxed, acquire, release} atomics")
> 
> from the arm64 tree and commit:
> 
>   62e8a3258bda ("atomic, arch: Audit atomic_{read,set}()")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/arm64/include/asm/atomic.h
> index 5e13ad76a249,1e247ac2601a..000000000000
> --- a/arch/arm64/include/asm/atomic.h
> +++ b/arch/arm64/include/asm/atomic.h
> @@@ -54,39 -54,8 +54,39 @@@
>   #define ATOMIC_INIT(i)	{ (i) }
>   
>   #define atomic_read(v)			READ_ONCE((v)->counter)
> - #define atomic_set(v, i)		(((v)->counter) = (i))
> + #define atomic_set(v, i)		WRITE_ONCE(((v)->counter), (i))

This is the correct fixup, and matches what I'm carrying locally.

Thanks, Stephen.

Will
