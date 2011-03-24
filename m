From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Wed, 23 Mar 2011 21:13:46 -0700
Message-ID: <20110323211346.9ae51356.akpm@linux-foundation.org>
References: <20110324143019.cce06baa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:49444 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1749667Ab1CXER6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Mar 2011 00:17:58 -0400
In-Reply-To: <20110324143019.cce06baa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, David Rientjes <rientjes@google.com>, "Luck, Tony" <tony.luck@intel.com>

On Thu, 24 Mar 2011 14:30:19 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc32 defconfig)
> failed like this:
> 
> lib/lib.a(show_mem.o): In function `show_mem':
> show_mem.c:(.text+0x1f4): multiple definition of `show_mem'
> arch/sparc/mm/built-in.o:(.text+0xd70): first defined here

I discovered this on ia64 today.

> This has been reported elsewhere, caused by commit ddd588b5dd55 ("oom:
> suppress nodes that are not allowed from meminfo on oom kill").
> 

Yeah, this is tricky.  The addition of the symbol __show_mem caused the
linker to newly take lib/show_mem.o out of lib/lib.a, whereas
previously that object file would have been omitted from the build
altogether.  Even though we compile it!

Making show_mem() __weak would "fix" it, but it's still wrong.  Given
that architectures can implement private versions of show_mem(), the
patch was wrong to call the generic version (renamed to __show_mem) at
all.

So...  a suitable fix would be to remove __show_mem and to add the
extra arg to show_mem() itself then fix up all callers and to fix up
all implementations to honour "filter".

Meanwhile, ddd588b5dd55f143203799 reverts cleanly and I'd suggest we do
that.

The dependence on linker .a handling is just gross and we should clean
that up.  CONFIG_ARCH_HAS_SHOW_MEM or something.
