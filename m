From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Jul 22
Date: Fri, 22 Jul 2016 15:28:43 -0400
Message-ID: <CAP=VYLrkNuvwL0T=0ot_3Wk_VpSzdiJ-ZTcGA71D1od6dQRzAg@mail.gmail.com>
References: <20160722171035.1886c8b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:32911 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750989AbcGVT3P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Jul 2016 15:29:15 -0400
In-Reply-To: <20160722171035.1886c8b0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 22, 2016 at 3:10 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Changes since 20160721:
>
> The powerpc tree gained a build failure for which I applied a fix patch.

There still are new failures in corenet32/64 and mpc85xx; looks like:

arch/powerpc/sysdev/fsl_rio.c:702:11: error: 'struct rio_mport' has no
member named 'phy_type'
arch/powerpc/sysdev/fsl_rio.c:702:25: error: 'RIO_PHY_SERIAL'
undeclared (first use in this function)
make[2]: *** [arch/powerpc/sysdev/fsl_rio.o] Error 1

http://kisskb.ellerman.id.au/kisskb/buildresult/12750610/

>
> The fuse tree gained a build failure due to an interaction with the
> btrfs-kdave tree, so I applied a merge fix patch.
>
> The pm tree gained a build failure, so I used the version from
> next-20160721.
>
> The nvdimm tree lost its build failure but gained another due to an
> interaction with the device-mapper tree.  I applied a merge fix patch.
>
> Non-merge commits (relative to Linus' tree): 10807
>  9936 files changed, 548899 insertions(+), 195049 deletions(-)

The crypto issue I mentioned yesterday seems to be gone.

The allmod xfs issue for mips/sparc  remains.

For x86-64 allmod, I am seeing this issue for the 1st time today
in my local builds, even though it doesn't appear in sfr's builds:

FATAL: drivers/input/evbug: sizeof(struct input_device_id)=312 is not
a modulo of the size of section
__mod_input__<identifier>_device_table=384.
Fix definition of struct input_device_id in mod_devicetable.h
make[2]: *** [__modpost] Error 1
make[1]: *** [modules] Error 2
make: *** [sub-make] Error 2

paul@builder:~/git/linux-head$ git describe
next-20160722

Nothing has touched drivers/input/evbug.c for years...

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
>
