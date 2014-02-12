From: Markos Chandras <Markos.Chandras@imgtec.com>
Subject: Re: [PATCH 0/8] Improved seccomp-bpf support for MIPS
Date: Wed, 12 Feb 2014 09:39:07 +0000
Message-ID: <52FB413B.80902@imgtec.com>
References: <1390401604-11830-1-git-send-email-markos.chandras@imgtec.com> <CAP=VYLoNjfC8ZBgfLtCSv=s638p3faY-wm2cj2rn482KekyA7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:40863 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751923AbaBLJjI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Feb 2014 04:39:08 -0500
In-Reply-To: <CAP=VYLoNjfC8ZBgfLtCSv=s638p3faY-wm2cj2rn482KekyA7A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 02/12/2014 12:58 AM, Paul Gortmaker wrote:
> On Wed, Jan 22, 2014 at 9:39 AM, Markos Chandras
> <markos.chandras@imgtec.com> wrote:
>> Hi,
>>
>> This patch improves the existing seccomp-bpf support for MIPS.
>> It fixes a bug when copying system call arguments for the filter
>> checks and it also moves away from strict filtering to actually
>> use the filter supplied by the userspace process.
>
> Hi all,
>
> It seems this causes a build fail on linux-next allmodconfig.  I left
> a mindless "git bisect run .." go against it and it came up with:
> ----------------------------
> make[2]: *** [samples/seccomp/bpf-direct.o] Error 1
> make[1]: *** [samples/seccomp] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [vmlinux] Error 2
> 5c5df77172430c6377ec3434ce62f2b14a6799fc is the first bad commit
> commit 5c5df77172430c6377ec3434ce62f2b14a6799fc
> Author: Markos Chandras <markos.chandras@imgtec.com>
> Date:   Wed Jan 22 14:40:04 2014 +0000
>
>      MIPS: Select HAVE_ARCH_SECCOMP_FILTER
>
>      Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>      Reviewed-by: James Hogan <james.hogan@imgtec.com>
>      Reviewed-by: Paul Burton <paul.burton@imgtec.com>
>      Cc: linux-mips@linux-mips.org
>      Patchwork: https://patchwork.linux-mips.org/patch/6401/
>      Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> ---------------------
>
> The original linux-next fail is at:
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/10601740/
>
> Paul.

Hi Paul,

I don't think this is caused by my patch. My patch just exposed it. To 
my understanding, the samples/seccomp are not meant to be 
cross-compiled. The tests use the host toolchain. However, when 
cross-compiling for MIPS, for example, __NR_write is only defined if

1) _MIPS_SIM == _MIPS_SIM_ABI64
2) _MIPS_SIM == _MIPS_SIM_ABI32
3) _MIPS_SIM == _MIPS_SIM_NABI32

which clearly makes no sense for the x86_64 toolchain. I would propose a 
fix like this in order to prevent test from being cross-compiled.

diff --git a/samples/seccomp/Makefile b/samples/seccomp/Makefile
index 7203e66..f3a018e 100644
--- a/samples/seccomp/Makefile
+++ b/samples/seccomp/Makefile
@@ -17,9 +17,9 @@ HOSTCFLAGS_bpf-direct.o += -I$(objtree)/usr/include
  HOSTCFLAGS_bpf-direct.o += -idirafter $(objtree)/include
  bpf-direct-objs := bpf-direct.o

+ifndef CROSS_COMPILE
  # Try to match the kernel target.
  ifndef CONFIG_64BIT
-ifndef CROSS_COMPILE

  # s390 has -m31 flag to build 31 bit binaries
  ifndef CONFIG_S390
@@ -36,7 +36,7 @@ HOSTLOADLIBES_bpf-direct += $(MFLAG)
  HOSTLOADLIBES_bpf-fancy += $(MFLAG)
  HOSTLOADLIBES_dropper += $(MFLAG)
  endif
-endif

  # Tell kbuild to always build the programs
  always := $(hostprogs-y)
+endif


-- 
markos
