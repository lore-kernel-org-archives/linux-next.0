From: matthieu castet <castet.matthieu@free.fr>
Subject: Re: [PATCH 2/3 V8] [tip:x86/mm] NX protection for kernel data
Date: Tue, 14 Sep 2010 19:51:18 +0200
Message-ID: <4C8FB616.2070807@free.fr>
References: <4C856211.7080802@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <4C856211.7080802@free.fr>
Sender: linux-security-module-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org
Cc: Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi,

any feedback on that ?

Thanks,

Matthieu


matthieu castet a =C3=A9crit :
>    Note: this patch depends on "Correct improper large page=20
> preservation" patch
>       This patch expands functionality of CONFIG_DEBUG_RODATA to set =
main
>    (static) kernel data area as NX.
>    The following steps are taken to achieve this:
>    1. Linker script is adjusted so .text always starts and ends on a=20
> page bound
>    2. Linker script is adjusted so .rodata always start and
>    end on a page boundary
>    3. NX is set for all pages from _etext through _end in mark_rodata=
_ro.
>    4. free_init_pages() sets released memory NX in arch/x86/mm/init.c
>    5. bios rom is set to x when pcibios is used.
>       The results of patch application may be observed in the diff of=
=20
> kernel page
>    table dumps.
>    pcibios :
>    --- data_nx_pt_before.txt       2009-10-13 07:48:59.000000000 -040=
0
>    +++ data_nx_pt_after.txt        2009-10-13 07:26:46.000000000 -040=
0
>    @@ -2,8 +2,9 @@
>     0x00000000-0xc0000000           3G                           pmd
>     ---[ Kernel Mapping ]---
>    -0xc0000000-0xc0100000           1M     RW             GLB x  pte
>    +0xc0000000-0xc00a0000         640K     RW             GLB NX pte
>    +0xc00a0000-0xc0100000         384K     RW             GLB x  pte
>    -0xc0100000-0xc03d7000        2908K     ro             GLB x  pte
>    +0xc0100000-0xc0318000        2144K     ro             GLB x  pte
>    +0xc0318000-0xc03d7000         764K     ro             GLB NX pte
>    -0xc03d7000-0xc0600000        2212K     RW             GLB x  pte
>    +0xc03d7000-0xc0600000        2212K     RW             GLB NX pte
>     0xc0600000-0xf7a00000         884M     RW         PSE GLB NX pmd
>     0xf7a00000-0xf7bfe000        2040K     RW             GLB NX pte
>     0xf7bfe000-0xf7c00000           8K                           pte
>       no pcibios :
>    --- data_nx_pt_before.txt       2009-10-13 07:48:59.000000000 -040=
0
>    +++ data_nx_pt_after.txt        2009-10-13 07:26:46.000000000 -040=
0
>    @@ -2,8 +2,9 @@
>     0x00000000-0xc0000000           3G                           pmd
>     ---[ Kernel Mapping ]---
>    -0xc0000000-0xc0100000           1M     RW             GLB x  pte
>    +0xc0000000-0xc0100000           1M     RW             GLB NX pte
>    -0xc0100000-0xc03d7000        2908K     ro             GLB x  pte
>    +0xc0100000-0xc0318000        2144K     ro             GLB x  pte
>    +0xc0318000-0xc03d7000         764K     ro             GLB NX pte
>    -0xc03d7000-0xc0600000        2212K     RW             GLB x  pte
>    +0xc03d7000-0xc0600000        2212K     RW             GLB NX pte
>     0xc0600000-0xf7a00000         884M     RW         PSE GLB NX pmd
>     0xf7a00000-0xf7bfe000        2040K     RW             GLB NX pte
>     0xf7bfe000-0xf7c00000           8K                           pte
>       The patch have been developed for Linux 2.6.34-rc2 x86 by Siarh=
ei=20
> Liakh
>    <sliakh.lkml@gmail.com> and Xuxian Jiang <jiang@cs.ncsu.edu>.
>       V1:  initial patch for 2.6.30
>    V2:  patch for 2.6.31-rc7
>    V3:  moved all code into arch/x86, adjusted credits
>    V4:  fixed ifdef, removed credits from CREDITS
>    V5:  fixed an address calculation bug in mark_nxdata_nx()
>    V6:  added acked-by and PT dump diff to commit log
>    V7:  minor adjustments for -tip
>    V8:  rework with the merge of "Set first MB as RW+NX"
>       Signed-off-by: Siarhei Liakh <sliakh.lkml@gmail.com>
>    Signed-off-by: Xuxian Jiang <jiang@cs.ncsu.edu>
>    Signed-off-by: Matthieu CASTET <castet.matthieu@free.fr>
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
