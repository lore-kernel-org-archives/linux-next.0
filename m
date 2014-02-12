From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 0/8] Improved seccomp-bpf support for MIPS
Date: Tue, 11 Feb 2014 19:58:19 -0500
Message-ID: <CAP=VYLoNjfC8ZBgfLtCSv=s638p3faY-wm2cj2rn482KekyA7A@mail.gmail.com>
References: <1390401604-11830-1-git-send-email-markos.chandras@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:43231 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978AbaBLA6u (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Feb 2014 19:58:50 -0500
Received: by mail-wi0-f172.google.com with SMTP id e4so5787198wiv.17
        for <linux-next@vger.kernel.org>; Tue, 11 Feb 2014 16:58:49 -0800 (PST)
In-Reply-To: <1390401604-11830-1-git-send-email-markos.chandras@imgtec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Markos Chandras <markos.chandras@imgtec.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Wed, Jan 22, 2014 at 9:39 AM, Markos Chandras
<markos.chandras@imgtec.com> wrote:
> Hi,
>
> This patch improves the existing seccomp-bpf support for MIPS.
> It fixes a bug when copying system call arguments for the filter
> checks and it also moves away from strict filtering to actually
> use the filter supplied by the userspace process.

Hi all,

It seems this causes a build fail on linux-next allmodconfig.  I left
a mindless "git bisect run .." go against it and it came up with:
----------------------------
make[2]: *** [samples/seccomp/bpf-direct.o] Error 1
make[1]: *** [samples/seccomp] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [vmlinux] Error 2
5c5df77172430c6377ec3434ce62f2b14a6799fc is the first bad commit
commit 5c5df77172430c6377ec3434ce62f2b14a6799fc
Author: Markos Chandras <markos.chandras@imgtec.com>
Date:   Wed Jan 22 14:40:04 2014 +0000

    MIPS: Select HAVE_ARCH_SECCOMP_FILTER

    Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
    Reviewed-by: James Hogan <james.hogan@imgtec.com>
    Reviewed-by: Paul Burton <paul.burton@imgtec.com>
    Cc: linux-mips@linux-mips.org
    Patchwork: https://patchwork.linux-mips.org/patch/6401/
    Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
---------------------

The original linux-next fail is at:

http://kisskb.ellerman.id.au/kisskb/buildresult/10601740/

Paul.
--

>
> This patchset has been tested with libseccomp
> (MIPS support not upstream yet) on mips, mipsel and mips64
> and with Chromium test suite (MIPS support not upstream yet)
> on mipsel.
>
> This patchset is based on the upstream-sfr/mips-for-linux-next tree.
>
> Markos Chandras (8):
>   MIPS: asm: syscall: Fix copying system call arguments
>   MIPS: asm: syscall: Add the syscall_rollback function
>   MIPS: asm: syscall: Define syscall_get_arch
>   MIPS: asm: thread_info: Add _TIF_SECCOMP flag
>   MIPS: ptrace: Move away from secure_computing_strict
>   MIPS: kernel: scalls: Skip the syscall if denied by the seccomp filter
>   MIPS: seccomp: Handle indirect system calls (o32)
>   MIPS: Select HAVE_ARCH_SECCOMP_FILTER
>
>  arch/mips/Kconfig                   |  1 +
>  arch/mips/include/asm/ptrace.h      |  2 +-
>  arch/mips/include/asm/syscall.h     | 35 ++++++++++++++++++++++++++++++-----
>  arch/mips/include/asm/thread_info.h |  3 ++-
>  arch/mips/kernel/ptrace.c           | 11 ++++++-----
>  arch/mips/kernel/scall32-o32.S      | 15 +++++++++++++--
>  arch/mips/kernel/scall64-64.S       |  5 ++++-
>  arch/mips/kernel/scall64-n32.S      |  5 ++++-
>  arch/mips/kernel/scall64-o32.S      | 17 +++++++++++++++--
>  9 files changed, 76 insertions(+), 18 deletions(-)
>
> --
> 1.8.5.3
>
>
>--
