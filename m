From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Apr 24
Date: Mon, 24 Apr 2017 11:44:13 -0400
Message-ID: <CAP=VYLrEVMbEnnLkOvjmJ5pw2YO0Cwbdq2oF_LJexeHJqhW=jg@mail.gmail.com>
References: <20170424181011.04e3f8e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:36165 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S972067AbdDXPoo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Apr 2017 11:44:44 -0400
In-Reply-To: <20170424181011.04e3f8e0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Apr 24, 2017 at 4:10 AM, Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> Hi all,
>
> News: there will be no linux-next release tomorrow.
>
> Changes since 20170421:
>
> The arm tree lost its build failure.
>
> The rdma tree lost its build failure.
>
> The tip tree gained a build failure for which I reverted a commit.

There are also some new fails around kernel/events/core.c in arm32/arm64

include/linux/jump_label.h: In function
=E2=80=98static_key_disable_cpuslocked.constprop.66=E2=80=99:
include/linux/jump_label.h:260:20: error: inlining failed in call to
always_inline =E2=80=98static_key_disable_cpuslocked.constprop.66=E2=80=99:=
 recursive
inlining
 static inline void static_key_disable_cpuslocked(struct static_key *key)
                    ^

http://kisskb.ellerman.id.au/kisskb/buildresult/13011884/
http://kisskb.ellerman.id.au/kisskb/buildresult/13011947/
...and others.

A mindless automated bisect run came back with this:

924726b2b5e5000dfb8eb6032651baed1b1bdc6c is the first bad commit
commit 924726b2b5e5000dfb8eb6032651baed1b1bdc6c
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Sun Apr 23 12:13:09 2017 +0200

    perf: Cure hotplug lock ordering issues

I gave tglx and peterz a heads up on irc.

P.
--

>
> The nvdimm tree gained conflicts against the block tree and a build
> failure due to an interaction with the vfs tree for which I applied a
> fix patch.
>
> The akpm-current tree gained conflicts against Linus', the kselftest
> and nvdimm trees.
>
> Non-merge commits (relative to Linus' tree): 11126
>  10396 files changed, 1176561 insertions(+), 214871 deletions(-)
>
> -------------------------------------------------------------------------=
---
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
> CONFIG_BUILD_DOCSRC=3Dn) for x86_64, a multi_v7_defconfig for arm and a
> native build of tools/perf. After the final fixups (if any), I do an
> x86_64 modules_install followed by builds for x86_64 allnoconfig,
> powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
> and pseries_le_defconfig and i386, sparc and sparc64 defconfig.
>
> Below is a summary of the state of the merge.
>
> I am currently merging 258 trees (counting Linus' and 37 trees of bug
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
>
