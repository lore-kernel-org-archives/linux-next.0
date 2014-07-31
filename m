From: Michal Hocko <mhocko@suse.cz>
Subject: Re: [PATCH] kexec-export-free_huge_page-to-vmcoreinfo-fix (was: Re:
 mmotm 2014-07-30-15-57 uploaded)
Date: Thu, 31 Jul 2014 12:01:00 +0200
Message-ID: <20140731100100.GD13561@dhcp22.suse.cz>
References: <53d978aa.dtIIGjOqrXXmAm4e%akpm@linux-foundation.org>
 <20140731092452.GB13561@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56043 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750969AbaGaKBD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Jul 2014 06:01:03 -0400
Content-Disposition: inline
In-Reply-To: <20140731092452.GB13561@dhcp22.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, Atsushi Kumagai <kumagai-atsushi@mxc.nes.nec.co.jp>, Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>

On Thu 31-07-14 11:24:52, Michal Hocko wrote:
> On Wed 30-07-14 15:58:50, Andrew Morton wrote:
> > * kexec-export-free_huge_page-to-vmcoreinfo.patch
>=20
> This one seems to be missing ifdef for CONFIG_HUGETLBFS

Ohh, David has already posted the fix
http://marc.info/?l=3Dlinux-mm&m=3D140676663218869

> ---
> From bcccb6696b89c700712421858b05dd89ea0d1ec5 Mon Sep 17 00:00:00 200=
1
> From: Michal Hocko <mhocko@suse.cz>
> Date: Thu, 31 Jul 2014 11:18:57 +0200
> Subject: [PATCH] kexec-export-free_huge_page-to-vmcoreinfo-fix
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> free_huge_page is not defined for !CONFIG_HUGETLBFS. Fix the followin=
g
> compilation error:
>=20
> kernel/kexec.c: In function =E2=80=98crash_save_vmcoreinfo_init=E2=80=
=99:
> kernel/kexec.c:1628:20: error: =E2=80=98free_huge_page=E2=80=99 undec=
lared (first use in this function)
>   VMCOREINFO_SYMBOL(free_huge_page);
>=20
> Signed-off-by: Michal Hocko <mhocko@suse.cz>
> ---
>  kernel/kexec.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/kernel/kexec.c b/kernel/kexec.c
> index a3ccf9d7174b..507614acf938 100644
> --- a/kernel/kexec.c
> +++ b/kernel/kexec.c
> @@ -1625,7 +1625,9 @@ static int __init crash_save_vmcoreinfo_init(vo=
id)
>  #endif
>  	VMCOREINFO_NUMBER(PG_head_mask);
>  	VMCOREINFO_NUMBER(PAGE_BUDDY_MAPCOUNT_VALUE);
> +#ifdef CONFIG_HUGETLBFS
>  	VMCOREINFO_SYMBOL(free_huge_page);
> +#endif
> =20
>  	arch_crash_save_vmcoreinfo();
>  	update_vmcoreinfo_note();
> --=20
> 2.0.1
>=20
> --=20
> Michal Hocko
> SUSE Labs
>=20
> --
> To unsubscribe, send a message with 'unsubscribe linux-mm' in
> the body to majordomo@kvack.org.  For more info on Linux MM,
> see: http://www.linux-mm.org/ .
> Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>

--=20
Michal Hocko
SUSE Labs
