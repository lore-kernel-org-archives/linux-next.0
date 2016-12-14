From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Dec 14
Date: Wed, 14 Dec 2016 11:25:49 -0500
Message-ID: <CAP=VYLqtuDk-wyHqrp8kySo6Uz4=5QQ_P5qweW_g9W9QkYmzmg@mail.gmail.com>
References: <20161214152218.3a4fda3d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:33510 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753141AbcLNQ0V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Dec 2016 11:26:21 -0500
In-Reply-To: <20161214152218.3a4fda3d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Dec 13, 2016 at 11:22 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Please do not add any material for v4.11 to your linux-next included
> branches until after v4.10-rc1 has been released.
>
> Changes since 20161213:
>
> The vfs-miklos tree gained a conflict against the ubifs tree.
>
> The akpm-current tree gained a conflict against the jc_docs tree.
>
> Non-merge commits (relative to Linus' tree): 4498
>  4320 files changed, 189429 insertions(+), 94239 deletions(-)

New s390 build failure today:

http://kisskb.ellerman.id.au/kisskb/buildresult/12883922/

I reproduced it locally using the older korg s390 toolchain.

Reverting this and the file compiles fine:

commit d543a106f96d6f15e4507cf349128912d44356d9
Author: Heiko Carstens <heiko.carstens@de.ibm.com>
Date:   Tue Dec 6 15:52:10 2016 +0100

    s390: fix initrd corruptions with gcov/kcov instrumented kernels

Appears old toolchains don't like this commit.

Paul.
--


>
> ----------------------------------------------------------------------------
>
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
>
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc and an allmodconfig (with
> CONFIG_BUILD_DOCSRC=n) for x86_64, a multi_v7_defconfig for arm and a
> native build of tools/perf. After the final fixups (if any), I do an
> x86_64 modules_install followed by builds for x86_64 allnoconfig,
> powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig

[...]
