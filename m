From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Nov 17
Date: Fri, 18 Nov 2016 17:12:33 -0500
Message-ID: <CAP=VYLpnZVEdpB1Dd_UDnMWhXE-QwwE7RoFDy3R7ucWuQpoM1w@mail.gmail.com>
References: <20161117170851.70c20904@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:35807 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753171AbcKRWNF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Nov 2016 17:13:05 -0500
In-Reply-To: <20161117170851.70c20904@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, Nov 17, 2016 at 1:08 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> There will be no linux-next releases on Friday (tomorrow) or Monday.
>
> Changes since 20161116:

FYI, I saw this warning appear today (make allmodconfig; multi arch)

drivers/remoteproc/Kconfig:3:error: recursive dependency detected!
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/remoteproc/Kconfig:3:   symbol REMOTEPROC is selected by QCOM_ADSP_PIL
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/remoteproc/Kconfig:81:  symbol QCOM_ADSP_PIL depends on REMOTEPROC

A zombie bot "git bisect run" blames this commit/merge:

Paul.
--

commit de9e059739efe4c762cde105fd312c0f66794678
Merge: d31d45e068e6 1314ed74840c
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Thu Nov 17 15:57:18 2016 +1100

    Merge remote-tracking branch 'rpmsg/for-next'

diff --cc drivers/remoteproc/Kconfig
index 14d5d2d43a38,c199b360067f..9c41128750ca
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@@ -100,10 -106,9 +107,9 @@@ config QCOM_WCNSS_PI
        tristate "Qualcomm WCNSS Peripheral Image Loader"
        depends on OF && ARCH_QCOM
        depends on QCOM_SMEM
 +      depends on REMOTEPROC
        select QCOM_MDT_LOADER
        select QCOM_SCM
-       select QCOM_WCNSS_IRIS
 -      select REMOTEPROC
        help
          Say y here to support the Peripheral Image Loader for the Qualcomm
          Wireless Connectivity Subsystem.


>
> The net-next tree gained conflicts against the net tree.
>
> The drm tree gained a conflict against the arm tree.
>
> The block tree gained conflicts against the btrfs-kdave tree.
>
> The tip tree gained conflicts against the drm and net-next trees and a
> build failure for which I applied a merge fix patch.
>
> The kvm tree gained a conflict against the tip tree.
>
> Non-merge commits (relative to Linus' tree): 6305
>  6661 files changed, 401169 insertions(+), 146155 deletions(-)
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
> I am currently merging 244 trees (counting Linus' and 34 trees of bug
> fix patches pending for the current merge release).
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
