From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: randconfig build error with next-20150603, in fs/xfs/xfs_inode.c
Date: Wed, 3 Jun 2015 23:15:58 -0400
Message-ID: <20150604031557.GS29898@windriver.com>
References: <CA+r1Zhh5oW+z_DwszUehhF+ke41soBzHPcC7QCYH9yV+0A=upA@mail.gmail.com>
 <CAP=VYLppm7teN4LMpOAgXFunmDjnYLFV_mdbZTPaPWMqTwQPtg@mail.gmail.com>
 <20150604030103.GJ9143@dastard>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:43786 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751735AbbFDDQH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2015 23:16:07 -0400
Content-Disposition: inline
In-Reply-To: <20150604030103.GJ9143@dastard>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Chinner <david@fromorbit.com>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com

[Re: randconfig build error with next-20150603, in fs/xfs/xfs_inode.c] On 04/06/2015 (Thu 13:01) Dave Chinner wrote:

> On Wed, Jun 03, 2015 at 10:36:54PM -0400, Paul Gortmaker wrote:
> > On Wed, Jun 3, 2015 at 12:31 PM, Jim Davis <jim.epost@gmail.com> wrote:
> > > Building with the attached random configuration file,
> > >
> > > fs/built-in.o: In function `xfs_ifree_cluster':
> > > /home/jim/linux/fs/xfs/xfs_inode.c:2268: undefined reference to `__umoddi3'
> > 
> > I don't think this is specific to a particular randconfig.
> > 
> > On ARM allmodconfig, I saw:
> > 
> > ERROR: "__aeabi_uldivmod" [fs/xfs/xfs.ko] undefined!
> > 
> > On powerpc with an older gcc-4.5 toolchain, I saw:
> > 
> > /bin/sh: line 1: 23453 Segmentation fault      powerpc-linux-ld -EB -m
> > elf64ppc -r -T /home/paul/git/linux-head/scripts/module-common.lds
> > arch/powerpc/lib/crtsavres.o --build-id -o fs/xfs/xfs.ko fs/xfs/xfs.o
> > fs/xfs/xfs.mod.o
> > make[2]: *** [fs/xfs/xfs.ko] Error 139
> > 
> > I have not investigated further than that.
> 
> A fix is already pending. Probably be in tomorrow's linux-next
> build.

Thanks Dave -- sounds good.  After all, the whole point of linux-next is
to spot these and vet out arch/merge issues before they get merged.

No matter what level of arch and config coverage I try to do, it seems
linux-next still finds a corner case that I somehow missed.

Hopefully we don't lose sight of that underlying goal and we don't
inadvertently intimidate folks from requesting their changes to be added
to linux-next.

Paul.
--

> 
> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com
