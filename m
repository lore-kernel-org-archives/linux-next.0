From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kbuild tree build failure
Date: Fri, 25 Jul 2008 14:13:30 +1000
Message-ID: <20080725141330.c58e0a07.sfr@canb.auug.org.au>
References: <20080707184038.aaeb8d40.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__25_Jul_2008_14_13_30_+1000_0ZtDO6qI53KCAVxo"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39740 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750720AbYGYENm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Jul 2008 00:13:42 -0400
In-Reply-To: <20080707184038.aaeb8d40.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Milton Miller <miltonm@bga.com>, Michael Ellerman <michael@ellerman.id.au>

--Signature=_Fri__25_Jul_2008_14_13_30_+1000_0ZtDO6qI53KCAVxo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Mon, 7 Jul 2008 18:40:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>=20
> arch/powerpc/platforms/cell/spu_base.c: In function '__spu_trap_data_seg':
> arch/powerpc/platforms/cell/spu_base.c:194: error: duplicate case value
> arch/powerpc/platforms/cell/spu_base.c:177: error: previously used here

This still fails in linux-next today.  We need some solution before you
send these commits to Linus.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__25_Jul_2008_14_13_30_+1000_0ZtDO6qI53KCAVxo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiJUusACgkQjjKRsyhoI8xkYACgmhCRENes9NWIVzQUS1jyLt6X
7LgAnRvpsvjOAMwlflGTEU1ryoEnT92W
=+Bz7
-----END PGP SIGNATURE-----

--Signature=_Fri__25_Jul_2008_14_13_30_+1000_0ZtDO6qI53KCAVxo--
