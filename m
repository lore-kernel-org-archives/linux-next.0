From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Nov 24
Date: Thu, 24 Nov 2016 10:53:20 -0500
Message-ID: <CAP=VYLpEvqtHJ_CDgFY4QHKSduJESg7dCxOvJrcKByfM4w9NPA@mail.gmail.com>
References: <20161124163524.46a65a8e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161124163524.46a65a8e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Helge Deller <deller@gmx.de>
List-Id: linux-next.vger.kernel.org

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

The parisc allmodconfig started failing recently.   An automated
bisect comes up with the following commit:

af3dcc1705ead3cbff4450a1b16c8b060c7ef69a is the first bad commit
commit af3dcc1705ead3cbff4450a1b16c8b060c7ef69a
Author: Helge Deller <deller@gmx.de>
Date:   Tue Nov 22 18:08:30 2016 +0100

    parisc: Switch to generic sched_clock implementation

    Drop the open-coded sched_clock() function and replace it by the provided
    GENERIC_SCHED_CLOCK implementation.  We have seen quite some hung
tasks in the
    past, which seem to be fixed by this patch.

    Signed-off-by: Helge Deller <deller@gmx.de>
    Cc: <stable@vger.kernel.org> # v4.8

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
