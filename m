From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Mon, 20 Aug 2018 12:52:50 -0700
Message-ID: <20180820125250.85db3bcb0052e1007a86358f@linux-foundation.org>
References: <20180820143222.5aaa69d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180820143222.5aaa69d9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, James Morse <james.morse@arm.com>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

On Mon, 20 Aug 2018 14:32:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the akpm-current tree got conflicts in:
> 
>   fs/proc/kcore.c
>   include/linux/kcore.h
> 
> between commit:
> 
>   6855dc41b246 ("x86: Add entry trampolines to kcore")
> 
> from the tip tree and commits:
> 
>   4eb27c275abf ("fs/proc/kcore.c: use __pa_symbol() for KCORE_TEXT list entries")
>   ea551910d3f4 ("proc/kcore: clean up ELF header generation")
>   537412a2958f ("proc/kcore: don't grab lock for kclist_add()")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Yup.

What's happening here?  A two month old patch turns up in linux-next in the
middle of the merge window, in the "perf/urgent" branch.  That's a strange
branch for a June 6 patch!

Is it intended that this material be merged into 4.19-rc1?
