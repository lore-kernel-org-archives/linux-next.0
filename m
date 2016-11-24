From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Nov 24
Date: Thu, 24 Nov 2016 11:00:53 -0500
Message-ID: <CAP=VYLq6Lz89GHmudoqVOxQ3Zj57z+adsu6JuVfvp3XhTo=4-Q@mail.gmail.com>
References: <20161124163524.46a65a8e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:35032 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965473AbcKXQBZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Nov 2016 11:01:25 -0500
In-Reply-To: <20161124163524.46a65a8e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@ozlabs.org>

On Thu, Nov 24, 2016 at 12:35 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Changes since 20161123:
>
> Removed tree: remoteproc (no longer used)
>
> The powerpc tree gained a conflict against the powerpc-fixes tree.
>
> The kvm-ppc-paulus tree gained conflicts against the powerpc-fixes and
> powerpc trees.
>
> The staging tree gained a conflict against the net-next tree.
>
> The akpm-current tree gained a build failure for which I disabled
> CONFIG_KEXEC_FILE on powerpc.
>
> Non-merge commits (relative to Linus' tree): 7885
>  7978 files changed, 461386 insertions(+), 174925 deletions(-)

One of the PPC configs failed today.  An automated bisect leads
to the following commit:

commit 1704a81ccebc69b5223220df97cde8a645271828
Author: Paul Mackerras <paulus@ozlabs.org>
Date:   Fri Nov 18 08:47:08 2016 +1100

    KVM: PPC: Book3S HV: Use msgsnd for IPIs to other cores on POWER9

    On POWER9, the msgsnd instruction is able to send interrupts to
    other cores, as well as other threads on the local core.  Since
    msgsnd is generally simpler and faster than sending an IPI via the
    XICS, we use msgsnd for all IPIs sent by KVM on POWER9.

    Signed-off-by: Paul Mackerras <paulus@ozlabs.org>

Here is the fail link:

http://kisskb.ellerman.id.au/kisskb/buildresult/12866462/

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
> (with KALLSYMS_EXTRA_PASS=1) and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig.
>
> Below is a summary of the state of the merge.
>
> I am currently merging 243 trees (counting Linus' and 34 trees of bug
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
