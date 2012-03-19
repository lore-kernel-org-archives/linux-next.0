From: Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: Tree for Mar 19 (uml)
Date: Mon, 19 Mar 2012 17:14:48 +0100
Message-ID: <4F675B78.8060300@nod.at>
References: <20120319184830.fce597a16eaf7206195a7a45@canb.auug.org.au> <4F674A2D.5080504@xenotime.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig1AFB6C47EA9010465AAAFDF0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a.ns.miles-group.at ([95.130.255.143]:47834 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161563Ab2CSQOx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Mar 2012 12:14:53 -0400
In-Reply-To: <4F674A2D.5080504@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig1AFB6C47EA9010465AAAFDF0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 19.03.2012 16:01, schrieb Randy Dunlap:
>   CC      arch/um/kernel/asm-offsets.s
> In file included from include/linux/mm_types.h:16:0,
>                  from include/linux/sched.h:64,
>                  from arch/x86/um/shared/sysdep/kernel-offsets.h:2,
>                  from arch/um/kernel/asm-offsets.c:1:
> arch/um/include/asm/mmu.h:15:14: error: array type has incomplete eleme=
nt type
> make[2]: *** [arch/um/kernel/asm-offsets.s] Error 1
>=20

Looks like this commit introduced the issue:

commit 1ed71e0439cba3609d3c69bf04795e0389cd35e4
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Thu Feb 23 01:33:19 2012 -0500

    um: embed ->stub_pages[] into mmu_context

    seriously, kmalloc() for two-element array of pointers?

    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

The size of struct page is not known to all users of asm/mmu.h

Thanks,
//richard


--------------enig1AFB6C47EA9010465AAAFDF0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPZ1t4AAoJEN9758yqZn9edrMH+wSybdchj06DsFSDEHSMm15P
ELjN88FGu0R8J3g/ny6FKjmOSyeER5Fmn3d3wJgPVYADaHEmgcvVu/BZRnzu6gsd
oIYxL+NS+HwHUec3IEH/h7/yMgfs9VKtJZbk5rDyMI13tGYpRWkZy01LxTGoNhRo
H3IbeMcgHzyDlxmASRTteWt635n6VREBCiAwKaNVEdSTvpS6Yt24Qq4XDC6hRmXx
nDWtEh0hZiMNeDRD99ohNK8Lo6OlTMd2ysLnksTKy9UeH7bOIEutbQCyTu2O8r8p
aw+Rj8/7nzTMDXty+Ga1O4AikDB8bcaewhiw6t4LEuM5vd6gg3z3mzJk8YxG6aw=
=ejaE
-----END PGP SIGNATURE-----

--------------enig1AFB6C47EA9010465AAAFDF0--
