From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sh tree build failure
Date: Thu, 13 Nov 2008 11:04:16 +1100
Message-ID: <20081113110416.6d93c698.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__13_Nov_2008_11_04_16_+1100_8vq.QfG_PgxzbFCg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44508 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751064AbYKMAE2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 19:04:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__13_Nov_2008_11_04_16_+1100_8vq.QfG_PgxzbFCg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "clk_enable" [drivers/media/video/sh_mobile_ceu_camera.ko] undefined!
ERROR: "clk_disable" [drivers/media/video/sh_mobile_ceu_camera.ko] undefine=
d!
ERROR: "clk_put" [drivers/media/video/sh_mobile_ceu_camera.ko] undefined!
ERROR: "clk_get" [drivers/media/video/sh_mobile_ceu_camera.ko] undefined!

Maybe that needs restricting to SH or those routines need exporting?
Anyway, I have dropped the sh tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__13_Nov_2008_11_04_16_+1100_8vq.QfG_PgxzbFCg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkbbwAACgkQjjKRsyhoI8ziyACfRpWOvggoAaB/NPk/4i/irnhj
YfgAn3mHXJY+7W8i2wiNX8UCJZyHvuHN
=6oFh
-----END PGP SIGNATURE-----

--Signature=_Thu__13_Nov_2008_11_04_16_+1100_8vq.QfG_PgxzbFCg--
