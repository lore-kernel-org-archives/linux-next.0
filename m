From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: EXPORT_SYMBOL(min_low_pfn);
Date: Wed, 6 Feb 2013 11:36:55 +1100
Message-ID: <20130206113655.dd95bbcfc4e47e5cc8009d67@canb.auug.org.au>
References: <CA+8MBbLW333z1Subx=fLu46u2RQXkNB1iTbORuKbq7YpZi1X_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__6_Feb_2013_11_36_55_+1100_UxIg5MW.gM3oNDYe"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:34659 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752034Ab3BFAhE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Feb 2013 19:37:04 -0500
In-Reply-To: <CA+8MBbLW333z1Subx=fLu46u2RQXkNB1iTbORuKbq7YpZi1X_w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Luck <tony.luck@intel.com>
Cc: Sanjay Lal <sanjayl@kymasys.com>, Ralf Baechle <ralf@linux-mips.org>, linux-next@vger.kernel.org, James Hogan <james.hogan@imgtec.com>

--Signature=_Wed__6_Feb_2013_11_36_55_+1100_UxIg5MW.gM3oNDYe
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 5 Feb 2013 11:31:22 -0800 Tony Luck <tony.luck@intel.com> wrote:
>
> Today i noticed in linux-next this commit:
>=20
> commit b0d9c17503444c2df8cb8e93ccfa4877edd71933
> Author: Sanjay Lal <sanjayl@kymasys.com>
> Date:   Wed Nov 21 18:34:14 2012 -0800
>=20
>     MIPS: Export symbols used by KVM/MIPS module
>=20
> which causes this kernel build warning on ia64:
>=20
> WARNING: vmlinux: 'min_low_pfn' exported twice. Previous export was in vm=
linux
>=20
>=20
> We just need to delete the arch/ia64 specific export (and grep says
> for arch/metag too):
>=20
> $ git grep min_low_pfn | grep EXPORT
> arch/ia64/kernel/ia64_ksyms.c:EXPORT_SYMBOL(min_low_pfn);	/* defined
> by bootmem.c, but not exported by generic code */
> arch/metag/kernel/metag_ksyms.c:EXPORT_SYMBOL(min_low_pfn);
> mm/bootmem.c:EXPORT_SYMBOL(min_low_pfn);
>=20
>=20
> Can you do this in the same branch as the mips change so the bits
> will flow to Linus together in the next window?
>=20
> ia64 change (which gmail will no doubt mangle)

It did :-)

> From: "Luck, Tony" <tony.luck@intel.com>
>=20
> min_low_pfn is now exported by generic code
>=20
> Signed-off-by: Tony Luck <tony.luck@intel.com>
>=20
> ---
>=20
> diff --git a/arch/ia64/kernel/ia64_ksyms.c b/arch/ia64/kernel/ia64_ksyms.c
> index 5b7791d..ca95c8b 100644
> --- a/arch/ia64/kernel/ia64_ksyms.c
> +++ b/arch/ia64/kernel/ia64_ksyms.c
> @@ -25,7 +25,6 @@ EXPORT_SYMBOL(copy_page);
>=20
>  #ifdef CONFIG_VIRTUAL_MEM_MAP
>  #include <linux/bootmem.h>
> -EXPORT_SYMBOL(min_low_pfn);    /* defined by bootmem.c, but not
> exported by generic code */
>  EXPORT_SYMBOL(max_low_pfn);    /* defined by bootmem.c, but not
> exported by generic code */
>  #endif

I applied this as a merge fix to the mips tree merge for today, but it
should be added to the mips tree.

I also applied this as a merge fix (which only I can apply as the metag
tree is not in Linus' tree yet):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 6 Feb 2013 11:31:24 +1100
Subject: [PATCH] metag: min_low_pfn is now exported by generic code

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/metag/kernel/metag_ksyms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/metag/kernel/metag_ksyms.c b/arch/metag/kernel/metag_ksym=
s.c
index 3cc4d1d..5381514 100644
--- a/arch/metag/kernel/metag_ksyms.c
+++ b/arch/metag/kernel/metag_ksyms.c
@@ -43,7 +43,6 @@ EXPORT_SYMBOL(pfn_base);
 #ifdef CONFIG_FLATMEM
 /* needed for the pfn_valid macro */
 EXPORT_SYMBOL(max_pfn);
-EXPORT_SYMBOL(min_low_pfn);
 #endif
=20
 /* TBI symbols */
--=20
1.8.1

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__6_Feb_2013_11_36_55_+1100_UxIg5MW.gM3oNDYe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJREaWnAAoJEECxmPOUX5FEeD0P/ik+gJ3GXLL6zKgicCabvqw3
ZWB34ssXrQkW6UWVc9UIkCtbR7WpvCmi+fKDXIgBhM+uTOpN1q19wU/nj2z2SZc3
m2JP6nwdgyDLjR+cf/Hm892+eopT7CpvtGAqheuFmbRff14PVcg94MAR4lsZgC4A
kcSodlq1NxcMlj++tgaOkhp04d1oNNao5dUk3NAeprFpd6GP/M+GX05+CRiUKxIW
MQ0vshetxN6hOmrzAojJlKskL3nUetCP7ExDWaKHcTMvxNEAA3Q8m87TPcWTS/9j
SoF3W4uwX7m5qBxyOobMUb+zmbJEnBq5V6VbUu2eFl2pI2XmwT5KJiDMbNUSvL/e
xsZIzf5BTyK3tO3JQ70yxveMbj3s/6VBxhhYKRx9HDlJivfKvBUA+V+R6yiKPHV3
/RynrDBfdPUUVOzxQy9SAHiSwqZmKVXcG7RGkdWnd3MRtgC6mv5TXSRPfNnIOTTe
tbMF35JC3ImmS1cEJOjboaYGwWYjtHZn8Xodf1z4Q8HtIP0spnivtF01X5tO9D+0
pbN1qcfy1F+pVhBuB7eUt1QEiV8CW2zw6s6GpQ7oBHsSSYfR7CVUkERk2Q3pK2oJ
PKhp7MqNMBwtbvJhISO1o0v+LCipUyceMWWsKAGcvsB8vbaDQ3ASdMHLFDv1NZhw
7w3X6DbRW1i5Bo7LbJON
=uDwO
-----END PGP SIGNATURE-----

--Signature=_Wed__6_Feb_2013_11_36_55_+1100_UxIg5MW.gM3oNDYe--
