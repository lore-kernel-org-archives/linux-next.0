From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the powerpc tree with the powerpc-fixes tree
Date: Thu, 10 May 2018 10:45:02 +1000
Message-ID: <87d0y4z6cx.fsf@concordia.ellerman.id.au>
References: <20180510101703.57ffb774@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180510101703.57ffb774@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>
>   arch/powerpc/include/asm/ftrace.h
>
> between commit:
>
>   edf6a2dfe388 ("powerpc/trace/syscalls: Update syscall name matching logic to account for ppc_ prefix")
>
> from the powerpc-fixes tree and commit:
>
>   c3e59d778403 ("powerpc64/ftrace: Rearrange #ifdef sections in ftrace.h")
>
> from the powerpc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> Michael, I think the version in your merge branch is not quite right ...

Yep.

Don't do merges after midnight kids.

I've pushed a fixed version, which I think matches yours.

I'll resolve it in my next when I merge my fixes & next later in the
cycle.

cheers
