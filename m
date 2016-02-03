From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 3 Feb 2016 11:28:19 +0530
Message-ID: <20160203055819.GA5528@sudip-pc>
References: <20160203161030.459d5c26@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:36096 "EHLO
	mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752073AbcBCF6j (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Feb 2016 00:58:39 -0500
Content-Disposition: inline
In-Reply-To: <20160203161030.459d5c26@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>

On Wed, Feb 03, 2016 at 04:10:30PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
>=20
> After merging the akpm-current tree, today's linux-next build (i386
> defconfig) failed like this:
>=20
> In file included from include/linux/mm.h:67:0,
>                  from include/linux/suspend.h:8,
>                  from arch/x86/kernel/asm-offsets.c:12:
> arch/x86/include/asm/pgtable.h:212:24: error: redefinition of 'pud_tr=
ans_huge'
>  #define pud_trans_huge pud_trans_huge
>                         ^
> include/asm-generic/pgtable.h:696:19: note: in expansion of macro 'pu=
d_trans_huge'
>  static inline int pud_trans_huge(pud_t pud)
>                    ^
> arch/x86/include/asm/pgtable.h:208:19: note: previous definition of '=
pud_trans_huge' was here
>  static inline int pud_trans_huge(pud_t pud)
>                    ^
>=20
> Caused by commit
>=20
>   42416e8d1a10 ("x86-add-support-for-pud-sized-transparent-hugepages-=
fix")
>=20
> Which, it turns out, is "wrong/hacky" :-)
>=20
> I have reverted that patch for today and added this (also maybe
> wrong/hacky) patch:

And x86_64 defconfig also fails with:
=2E./fs/proc/task_mmu.c: In function =E2=80=98smaps_pud_range=E2=80=99:
=2E./fs/proc/task_mmu.c:596:2: error: implicit declaration of function
	=E2=80=98is_huge_zero_pud=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]

regards
sudip
