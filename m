From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: randconfig build error with next-20150603, in fs/xfs/xfs_inode.c
Date: Wed, 3 Jun 2015 22:36:54 -0400
Message-ID: <CAP=VYLppm7teN4LMpOAgXFunmDjnYLFV_mdbZTPaPWMqTwQPtg@mail.gmail.com>
References: <CA+r1Zhh5oW+z_DwszUehhF+ke41soBzHPcC7QCYH9yV+0A=upA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:32896 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751196AbbFDCh0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2015 22:37:26 -0400
In-Reply-To: <CA+r1Zhh5oW+z_DwszUehhF+ke41soBzHPcC7QCYH9yV+0A=upA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, david@fromorbit.com, xfs@oss.sgi.com

On Wed, Jun 3, 2015 at 12:31 PM, Jim Davis <jim.epost@gmail.com> wrote:
> Building with the attached random configuration file,
>
> fs/built-in.o: In function `xfs_ifree_cluster':
> /home/jim/linux/fs/xfs/xfs_inode.c:2268: undefined reference to `__umoddi3'

I don't think this is specific to a particular randconfig.

On ARM allmodconfig, I saw:

ERROR: "__aeabi_uldivmod" [fs/xfs/xfs.ko] undefined!

On powerpc with an older gcc-4.5 toolchain, I saw:

/bin/sh: line 1: 23453 Segmentation fault      powerpc-linux-ld -EB -m
elf64ppc -r -T /home/paul/git/linux-head/scripts/module-common.lds
arch/powerpc/lib/crtsavres.o --build-id -o fs/xfs/xfs.ko fs/xfs/xfs.o
fs/xfs/xfs.mod.o
make[2]: *** [fs/xfs/xfs.ko] Error 139

I have not investigated further than that.

Paul.
