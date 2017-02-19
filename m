From: Stafford Horne <shorne@gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the openrisc tree
Date: Sun, 19 Feb 2017 16:26:54 +0900
Message-ID: <20170219072654.GB2379@lianli.shorne-pla.net>
References: <20170217124321.7b4b394d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170217124321.7b4b394d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 17, 2017 at 12:43:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/openrisc/include/asm/Kbuild
> 
> between commit:
> 
>   157e82f58007 ("openrisc: add cmpxchg and xchg implementations")
> 
> from the openrisc tree and commit:
> 
>   b672592f0221 ("sched/cputime: Remove generic asm headers")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you, the below looks good.  I dont think there is much that can be
done other than sorting the conflict during merge.

I will mention this to linus. Hopefully this will be next week.

-Stafford

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/openrisc/include/asm/Kbuild
> index a669c141436e,ef8d1ccc3e45..000000000000
> --- a/arch/openrisc/include/asm/Kbuild
> +++ b/arch/openrisc/include/asm/Kbuild
> @@@ -9,7 -10,8 +9,6 @@@ generic-y += bugs.
>   generic-y += cacheflush.h
>   generic-y += checksum.h
>   generic-y += clkdev.h
> - generic-y += cputime.h
>  -generic-y += cmpxchg-local.h
>  -generic-y += cmpxchg.h
>   generic-y += current.h
>   generic-y += device.h
>   generic-y += div64.h
