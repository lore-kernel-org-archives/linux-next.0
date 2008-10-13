From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ide tree import failure
Date: Tue, 14 Oct 2008 10:55:59 +1100
Message-ID: <20081014105559.a2ecd2fc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_10_55_59_+1100_WLOSIC=K95loQYMK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40553 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755278AbYJNC0o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Oct 2008 22:26:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__14_Oct_2008_10_55_59_+1100_WLOSIC=K95loQYMK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Importing the ide quilt series today gave me this error:

ide-remove-dead-asm-arm-arch-sa1100-ide-h.patch
error: include/asm-arm/arch-sa1100/ide.h: does not exist in index

That file doesn't seem to be in the tree you based your patches on, so I
just removed the patch (as all it did was remove the file).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_10_55_59_+1100_WLOSIC=K95loQYMK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjz4A8ACgkQjjKRsyhoI8yWLQCdHdUnSGMeC0pqk6GE3FuDNsdU
EZoAoKByEmBzZ96q8h0VHpuuypbRIf+l
=MWLb
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_10_55_59_+1100_WLOSIC=K95loQYMK--
