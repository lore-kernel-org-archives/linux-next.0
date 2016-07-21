From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Jul 21
Date: Thu, 21 Jul 2016 19:52:43 -0400
Message-ID: <CAP=VYLoa6C1uFtuqEhqTw6fdjGrNhFCQyUv3FNNkOWH2m2kTDw@mail.gmail.com>
References: <20160721165631.6508756a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35444 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751411AbcGUXxO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jul 2016 19:53:14 -0400
In-Reply-To: <20160721165631.6508756a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, Jul 21, 2016 at 2:56 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Changes since 20160720:
>
> The xfs tree gained a conflict against Linus' tree.

A new xfs related fail in mips allmodconfig:

ERROR: "dax_do_io" [fs/xfs/xfs.ko] undefined!
make[2]: *** [__modpost] Error 1
make[1]: *** [modules] Error 2

http://kisskb.ellerman.id.au/kisskb/buildresult/12749968/

Sparc and sparc64 allmodconfig get the same error.

>
> The net-next tree gained a conflict against the net tree.
>
> The l2-mtd tree lost its build failure.
>
> The crypto tree lost its build failure.

A new crypto related fail appeared in sun3_defconfig:

crypto/rsa_helper.c:18:28: fatal error: rsapubkey-asn1.h: No such file
or directory
make[2]: *** [crypto/rsa_helper.o] Error 1
make[1]: *** [crypto] Error 2

http://kisskb.ellerman.id.au/kisskb/buildresult/12749771/

>
> The kspp tree gained a conflict against the arm64 tree.
>
> The block tree gained a conflict against Linus' tree.
>
> The device-mapper tree gained a conflict against the block tree.
>
> The kvm tree gained a conflict against the powerpc tree.
>
> The nvdimm tree gained a build failure so I used the version from
> next-20160720.
>
> The akpm tree lost a patch that turned up elsewhere.
>
> Non-merge commits (relative to Linus' tree): 10587
>  9749 files changed, 534253 insertions(+), 187882 deletions(-)

A new i386-allmodconfig fail showed up relating to VDSO:

I tried to reproduce it locally with x86-64 build host and could
not, so I wonder if it is a missing HOSTCC vs. CC since next
coverage is power host...

  VDSO2C  arch/x86/entry/vdso/vdso-image-32.c
Error: input is not a shared object
make[4]: *** [arch/x86/entry/vdso/vdso-image-32.c] Error 1
make[3]: *** [arch/x86/entry/vdso] Error 2
make[2]: *** [arch/x86/entry] Error 2

http://kisskb.ellerman.id.au/kisskb/buildresult/12749836/

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
> (this fails its final link) and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig.
>
> Below is a summary of the state of the merge.
>
> I am currently merging 239 trees (counting Linus' and 35 trees of patches
> pending for Linus' tree).
>
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
>
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.
>
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
>
> --
> Cheers,
> Stephen Rothwell
