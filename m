From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] staging/lustre: fix build errors
Date: Wed, 5 Jun 2013 10:42:50 +1000
Message-ID: <20130605104250.b332e5e9db6c4e458130abd0@canb.auug.org.au>
References: <1882637210201641A747464075FFC6490E57F19F@MX101CL02.corp.emc.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__5_Jun_2013_10_42_50_+1000_hOwt=ocjbHnBnIDB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:54468 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752051Ab3FEAnC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Jun 2013 20:43:02 -0400
In-Reply-To: <1882637210201641A747464075FFC6490E57F19F@MX101CL02.corp.emc.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Peng, Tao" <tao.peng@emc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andreas Dilger <andreas.dilger@intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>

--Signature=_Wed__5_Jun_2013_10_42_50_+1000_hOwt=ocjbHnBnIDB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 4 Jun 2013 08:45:41 +0000 "Peng, Tao" <tao.peng@emc.com> wrote:
>
> From 369398c782c914e5f0548d5bbad22c00c6b58b6a Mon Sep 17 00:00:00 2001
> From: Peng Tao <bergwolf@gmail.com>
> Date: Tue, 4 Jun 2013 15:48:17 +0800
> Subject: [PATCH] staging/lustre: fix build errors
>=20
> There are several issues:
> 1. set_cpus_allowed() is not available with CONFIG_CPUMASK_OFFSTACK on
> 2. CONFIG_MODULES may not be defined
> 3. CONFIG_MODULE_UNLOAD may not be defined
>=20
> Signed-off-by: Peng Tao <tao.peng@emc.com>
> ---
> Stephen, please see if this fixes your build failure. I have tested it lo=
cally but only on X86 architecture, with CONFIG_CPUMASK_OFFSTACK on and CON=
FIG_MODULES/CONFIG_MODULE_UNLOAD off.

I have tried this with an x86_64 allmodconfig build and now I get just
this build problem:

drivers/built-in.o: In function `crc32_pclmul_le_16':
(.text+0x28b9310): multiple definition of `crc32_pclmul_le_16'
arch/x86/built-in.o:(.text+0xe70d0): first defined here

BTW all the build problems I reported yesterday were with the x86_64
allmodconfig build, my PowerPC build was fine (since it doesn't even try
to build the lustre code).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__5_Jun_2013_10_42_50_+1000_hOwt=ocjbHnBnIDB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJRromPAAoJEECxmPOUX5FEUCcQAKhjuDCou2hfs5NLL37/GUwW
lMbYAMC3LQc4emq5rW91xwCUgPZdb+L09BOJ+6QULtTATEvCyhs8AVKpn81xAbqn
LnpMkMOOhM/u/wxYmwDlSVc/m7XpNb496hwIM3UFRKY7jlNZEZ+0uBPep6+0IZEf
zdH2ZCzUCCQON3/85QZ3/23fh+eNN69b57RryzAhxnHr601TETd8IrCUsw6NqSDd
SoODJ/59xjfa46KRLCWDwnX8w9rbeMbA1EDJxvAjK+g/FNUD6IulFUfpxJILr/A6
9bf/uk44xDwl7Q65eT38OMwrhxDjSm5gYE/d/u81fbxi09MwiSA9/9W5JGx2vd/M
TUI+Yi8Rd7dfeqf5p+O5tkB6mIz/ZCEi+PCc9KbpiJ68GsKAxQQY0Z9YJ0j2m2mn
WHY1PwIMaoi5zONnKQpYOmAQYG4qSj9de2PX8txjL3zfGM3pAgyn8EiWgz16mbYk
zpeBSm0SrKNcEXyLwaSVHQKfZLGjOHqOosWuD64oloEfN+8CCsnAgtrJ8kpr7m1n
rQxwGoWyU7vkBGaDHRx1WJOZGWiHuEF2p5RReIeLBrntv1F6Zk/BcvefTGUfvLwe
n+JpSfWV3Tzq6qd/d2tGlz+VAakGctM77cmOePdJNce425NPQcLFAgVLDIav70X4
YiNkeLNCxv56+/kgj1yO
=v+4Q
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Jun_2013_10_42_50_+1000_hOwt=ocjbHnBnIDB--
