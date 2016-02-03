From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 3 Feb 2016 16:08:06 +0900
Message-ID: <20160203070806.GA30520@swordfish>
References: <20160203162728.32e6f283@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:34461 "EHLO
	mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933179AbcBCHGy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Feb 2016 02:06:54 -0500
Content-Disposition: inline
In-Reply-To: <20160203162728.32e6f283@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>

Hello,

On (02/03/16 16:27), Stephen Rothwell wrote:
> Hi Andrew,
>=20
> After merging the akpm-current tree, today's linux-next build (arm
> allnoconfig) failed like this:
>=20
> In file included from kernel/memremap.c:17:0:
> include/linux/pfn_t.h:108:7: error: 'pud_mkdevmap' declared as functi=
on returning an array
>=20
> Caused by commit
>=20
>   a27da20ed50e ("mm: add support for PUD-sized transparent hugepages"=
)
>=20
> Discovered after the linux-next release.


=2Econfig

  CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
# CONFIG_TRANSPARENT_HUGEPAGE is not set


makes the build unhappy

fs/proc/task_mmu.c: In function =E2=80=98smaps_pud_range=E2=80=99:
fs/proc/task_mmu.c:596:6: error: implicit declaration of function =E2=80=
=98is_huge_zero_pud=E2=80=99 [-Werror=3Dimplicit-function-declaration]
  if (is_huge_zero_pud(*pud))
      ^


seems there is no =E2=80=98is_huge_zero_pud=E2=80=99 for !CONFIG_TRANSP=
ARENT_HUGEPAGE.


and a bunch of other errors as a result


In file included from include/asm-generic/bug.h:4:0,
                 from ./arch/x86/include/asm/bug.h:35,
                 from include/linux/bug.h:4,
                 from include/linux/mmdebug.h:4,
                 from include/linux/mm.h:8,
                 from fs/proc/task_mmu.c:1:
include/linux/compiler.h:505:38: error: call to =E2=80=98__compiletime_=
assert_599=E2=80=99 declared with attribute error: BUILD_BUG failed
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
include/linux/compiler.h:488:4: note: in definition of macro =E2=80=98_=
_compiletime_assert=E2=80=99
    prefix ## suffix();    \
    ^
include/linux/compiler.h:505:2: note: in expansion of macro =E2=80=98_c=
ompiletime_assert=E2=80=99
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
include/linux/bug.h:50:37: note: in expansion of macro =E2=80=98compile=
time_assert=E2=80=99
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
include/linux/bug.h:84:21: note: in expansion of macro =E2=80=98BUILD_B=
UG_ON_MSG=E2=80=99
 #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                     ^
include/linux/huge_mm.h:221:27: note: in expansion of macro =E2=80=98BU=
ILD_BUG=E2=80=99
 #define HPAGE_PUD_SIZE ({ BUILD_BUG(); 0; })
                           ^
fs/proc/task_mmu.c:599:19: note: in expansion of macro =E2=80=98HPAGE_P=
UD_SIZE=E2=80=99
  mss->resident +=3D HPAGE_PUD_SIZE;
                   ^
In function =E2=80=98smaps_pud_range.part.10=E2=80=99,
    inlined from =E2=80=98smaps_pud_range=E2=80=99:
include/linux/compiler.h:505:38: error: call to =E2=80=98__compiletime_=
assert_602=E2=80=99 declared with attribute error: BUILD_BUG failed
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
include/linux/compiler.h:488:4: note: in definition of macro =E2=80=98_=
_compiletime_assert=E2=80=99
    prefix ## suffix();    \
    ^
include/linux/compiler.h:505:2: note: in expansion of macro =E2=80=98_c=
ompiletime_assert=E2=80=99
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
include/linux/bug.h:50:37: note: in expansion of macro =E2=80=98compile=
time_assert=E2=80=99
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
include/linux/bug.h:84:21: note: in expansion of macro =E2=80=98BUILD_B=
UG_ON_MSG=E2=80=99
 #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                     ^
include/linux/huge_mm.h:221:27: note: in expansion of macro =E2=80=98BU=
ILD_BUG=E2=80=99
 #define HPAGE_PUD_SIZE ({ BUILD_BUG(); 0; })
                           ^
fs/proc/task_mmu.c:602:25: note: in expansion of macro =E2=80=98HPAGE_P=
UD_SIZE=E2=80=99
    mss->shared_dirty +=3D HPAGE_PUD_SIZE;
                         ^
include/linux/compiler.h:505:38: error: call to =E2=80=98__compiletime_=
assert_604=E2=80=99 declared with attribute error: BUILD_BUG failed
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
include/linux/compiler.h:488:4: note: in definition of macro =E2=80=98_=
_compiletime_assert=E2=80=99
    prefix ## suffix();    \
    ^
include/linux/compiler.h:505:2: note: in expansion of macro =E2=80=98_c=
ompiletime_assert=E2=80=99
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
include/linux/bug.h:50:37: note: in expansion of macro =E2=80=98compile=
time_assert=E2=80=99
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
include/linux/bug.h:84:21: note: in expansion of macro =E2=80=98BUILD_B=
UG_ON_MSG=E2=80=99
 #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                     ^
include/linux/huge_mm.h:221:27: note: in expansion of macro =E2=80=98BU=
ILD_BUG=E2=80=99
 #define HPAGE_PUD_SIZE ({ BUILD_BUG(); 0; })
                           ^
fs/proc/task_mmu.c:604:25: note: in expansion of macro =E2=80=98HPAGE_P=
UD_SIZE=E2=80=99
    mss->shared_clean +=3D HPAGE_PUD_SIZE;
                         ^
fs/proc/task_mmu.c: In function =E2=80=98smaps_pud_range=E2=80=99:
include/linux/compiler.h:505:38: error: call to =E2=80=98__compiletime_=
assert_607=E2=80=99 declared with attribute error: BUILD_BUG failed
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
include/linux/compiler.h:488:4: note: in definition of macro =E2=80=98_=
_compiletime_assert=E2=80=99
    prefix ## suffix();    \
    ^
include/linux/compiler.h:505:2: note: in expansion of macro =E2=80=98_c=
ompiletime_assert=E2=80=99
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
include/linux/bug.h:50:37: note: in expansion of macro =E2=80=98compile=
time_assert=E2=80=99
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
include/linux/bug.h:84:21: note: in expansion of macro =E2=80=98BUILD_B=
UG_ON_MSG=E2=80=99
 #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                     ^
include/linux/huge_mm.h:221:27: note: in expansion of macro =E2=80=98BU=
ILD_BUG=E2=80=99
 #define HPAGE_PUD_SIZE ({ BUILD_BUG(); 0; })
                           ^
fs/proc/task_mmu.c:607:26: note: in expansion of macro =E2=80=98HPAGE_P=
UD_SIZE=E2=80=99
    mss->private_dirty +=3D HPAGE_PUD_SIZE;
                          ^
include/linux/compiler.h:505:38: error: call to =E2=80=98__compiletime_=
assert_609=E2=80=99 declared with attribute error: BUILD_BUG failed
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
include/linux/compiler.h:488:4: note: in definition of macro =E2=80=98_=
_compiletime_assert=E2=80=99
    prefix ## suffix();    \
    ^
include/linux/compiler.h:505:2: note: in expansion of macro =E2=80=98_c=
ompiletime_assert=E2=80=99
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
include/linux/bug.h:50:37: note: in expansion of macro =E2=80=98compile=
time_assert=E2=80=99
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
include/linux/bug.h:84:21: note: in expansion of macro =E2=80=98BUILD_B=
UG_ON_MSG=E2=80=99
 #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                     ^
include/linux/huge_mm.h:221:27: note: in expansion of macro =E2=80=98BU=
ILD_BUG=E2=80=99
 #define HPAGE_PUD_SIZE ({ BUILD_BUG(); 0; })
                           ^
fs/proc/task_mmu.c:609:26: note: in expansion of macro =E2=80=98HPAGE_P=
UD_SIZE=E2=80=99
    mss->private_clean +=3D HPAGE_PUD_SIZE;
                          ^
cc1: some warnings being treated as errors
scripts/Makefile.build:258: recipe for target 'fs/proc/task_mmu.o' fail=
ed
make[2]: *** [fs/proc/task_mmu.o] Error 1
scripts/Makefile.build:407: recipe for target 'fs/proc' failed
make[1]: *** [fs/proc] Error 2
make[1]: *** Waiting for unfinished jobs....


	-ss
