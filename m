From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the m68k tree
Date: Thu, 31 Jul 2008 14:05:57 +1000
Message-ID: <20080731140557.a9c66bb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__31_Jul_2008_14_05_57_+1000_UVO6/zf_=wRCjNhg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46637 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750741AbYGaEGF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Jul 2008 00:06:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__31_Jul_2008_14_05_57_+1000_UVO6/zf_=wRCjNhg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Today's linux-next merge of the m68k tree got a conflict in init/main.c
between commit bd673c7c3b1681dbfabab0062e67398dadf806af ("initrd: cast
`initrd_start' to `void *'") from Linus' tree and commit
d9c4ef589d1eda15333fb3d307bf4df85337820a ("initrd: Fix virtual/physical
mix-up in overwrite test") from the m68k tree (which is also in Linus'
tree).

I took the version from Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__31_Jul_2008_14_05_57_+1000_UVO6/zf_=wRCjNhg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiROiUACgkQjjKRsyhoI8zSFACeJbNfBHmSREOELdTsT6bWH5t5
bMAAn0PUUb1TC3cZ9ryXggO3GXFlNRiQ
=JQb8
-----END PGP SIGNATURE-----

--Signature=_Thu__31_Jul_2008_14_05_57_+1000_UVO6/zf_=wRCjNhg--
