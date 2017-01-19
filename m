From: Stafford Horne <shorne@gmail.com>
Subject: Re: linux-next: Tree for Jan 19
Date: Fri, 20 Jan 2017 06:59:41 +0900
Message-ID: <20170119215941.GB7836@lianli.shorne-pla.net>
References: <20170119163959.07a25ca8@canb.auug.org.au>
 <CAP=VYLptRY21K58v6BXj-WoZ1cm9Hv=UPF6z8Owfzct=fobbzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35547 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751497AbdASWAR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Jan 2017 17:00:17 -0500
Content-Disposition: inline
In-Reply-To: <CAP=VYLptRY21K58v6BXj-WoZ1cm9Hv=UPF6z8Owfzct=fobbzQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi Paul,

On Thu, Jan 19, 2017 at 11:42:45AM -0500, Paul Gortmaker wrote:
> On Thu, Jan 19, 2017 at 12:39 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Changes since 20170118:
> >
> > The audit tree gained a conflict against Linus' tree.
> >
> > The tip tree gained a conflict against the security tree.
> >
> > The rcu tree gained a semantic conflict against the net-next tree for
> > which I applied a merge fix patch.
> >
> > I dropped 4 patches from the akpm tree that turned up in the tip tree.
> >
> > Non-merge commits (relative to Linus' tree): 3931
> >  4740 files changed, 146960 insertions(+), 87918 deletions(-)
> >
> 
> The or32 builds started failing in the last couple days:
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/12912013/
> 
> I was able to reproduce it locally, and a mindless bisect says:
> 
> 116ded1356614cff3facc9010125b5a28718cbf1 is the first bad commit
> commit 116ded1356614cff3facc9010125b5a28718cbf1
> Author: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Date:   Mon May 12 14:08:26 2014 +0300
> 
>     openrisc: add atomic bitops
> 
> I expect the binutils sfr is using is probably similar vintage to
> what I've got here locally - from kernel.org crosstool stuff:
> 
> $ or32-linux-as --version
> GNU assembler (GNU Binutils) 2.20.1.20100303
> Copyright 2009 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public License version 3 or later.
> This program has absolutely no warranty.
> This assembler was configured for a target of `or32-linux'.

I put a note on this in reply to previous build failures and also on the
patch series. This indroduces some recent instructions (2 years old) for
handling atomic memory load stores.

Sorry, I wasn't sure who all to notify.

TOOLCHAIN

These are likely due to the lwa/swa instructions.  A toolchain from the
last 2 years would be needed to build these instructions.  Can I suggest
that the test chain be updated?  I would suggest musl. But there are
currently two options openrisc team is maintaining.

The l.swa/l.lwa atomic memory operations were added to the openrisc spec
2 years back. These are the first kernel patches to use them.

:: or1k-musl-linux- chain ::

Get it here:
https://github.com/openrisc/or1k-gcc/tree/musl-5.4.0/gcc
  - build using
    https://github.com/openrisc/musl-cross

OR

:: or1k-elf- chain ::

Get it here:
  https://github.com/openrisc/or1k-gcc/tree/or1k-5.4.0/gcc
  - build using baremetal/newlib
    https://github.com/openrisc/newlib
  - instructions
    http://openrisc.io/newlib/building.html


QEMU

The l.swa and l.lwa emulation is broken in qemu openrisc port. I have
sent patches [1] to qemu-devel to fix the qemu issues.

 [1] lists.nongnu.org/archive/html/qemu-devel/2017-01/msg02764.html


-Stafford
