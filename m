From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: linux-next: manual merge of the l2-mtd tree with the
 kbuild-current tree
Date: Tue, 22 Aug 2017 07:37:01 +0200
Message-ID: <20170822073701.34d77cc8@bbrezillon>
References: <20170822115614.1590b368@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170822115614.1590b368@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Brian Norris <computersforpeace@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

Le Tue, 22 Aug 2017 11:56:14 +1000,
Stephen Rothwell <sfr@canb.auug.org.au> a écrit :

> Hi Brian,
> 
> Today's linux-next merge of the l2-mtd tree got a conflict in:
> 
>   include/asm-generic/vmlinux.lds.h
> 
> between commit:
> 
>   cb87481ee89d ("kbuild: linker script do not match C names unless LD_DEAD_CODE_DATA_ELIMINATION is configured")

Masahiro, according to this message [1], you queued the above patch to
your fixes branch. Do you plan to send a fixes PR to Linus before
-rc7? If that's the case I'll merge -rc7 in l2-mtd/master, otherwise
I'll need an immutable branch.

Thanks,

Boris

[1]https://www.spinics.net/lists/arm-kernel/msg599088.html

> 
> from the kbuild-current tree and commit:
> 
>   129f6c4820dd ("mtd: only use __xipram annotation when XIP_KERNEL is set")
> 
> from the l2-mtd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
