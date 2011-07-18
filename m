From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Mon, 18 Jul 2011 10:58:21 -0700 (PDT)
Message-ID: <20110718.105821.1680531803712429890.davem@davemloft.net>
References: <20110718193053.623d28dc4643ab488b6347d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110718193053.623d28dc4643ab488b6347d5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Jul 2011 19:30:53 +1000

> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> In file included from arch/sparc/include/asm/pgtable.h:4:0,
>                  from include/linux/mm.h:41,
>                  from include/linux/fs.h:395,
>                  from include/linux/compat.h:15,
>                  from arch/sparc/include/asm/siginfo.h:19,
>                  from include/linux/signal.h:5,
>                  from include/linux/sched.h:73,
>                  from arch/sparc/kernel/asm-offsets.c:13:
> arch/sparc/include/asm/pgtable_64.h: In function '__set_pte_at':
> arch/sparc/include/asm/pgtable_64.h:674:6: error: 'init_mm' undeclared (first use in this function)
> 
> I assume some include file changes.  Anyone have any clues how to find
> this?

The great irony is that sparc64 doesn't use anything this file
generates (you won't find a single asm-offsets.h include in any
sparc64 code).

This asm-offset mechanim is, for whatever reason, enabled on every
single architecture whether it's needed or not.  Maybe we should
rethink that.
