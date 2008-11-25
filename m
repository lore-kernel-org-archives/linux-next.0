From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kbuild tree build failure
Date: Tue, 25 Nov 2008 15:47:05 +1100
Message-ID: <20081125154705.09683583.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_15_47_05_+1100_9HQo2IR0tDZwFNds"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33707 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753175AbYKYErW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 23:47:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__25_Nov_2008_15_47_05_+1100_9HQo2IR0tDZwFNds
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

WARNING: modpost: Found 11 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=3Dy'
.tmp_kallsyms1.S:1:23: error: asm/types.h: No such file or directory

I have dropped the kbuild tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_15_47_05_+1100_9HQo2IR0tDZwFNds
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrg0kACgkQjjKRsyhoI8wudgCglVlWWbxZG0kG6qryo0r6QoTm
WL0AoK7JHpOyus4r5uPPwLa0QCTxyIzP
=DxSO
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_15_47_05_+1100_9HQo2IR0tDZwFNds--
