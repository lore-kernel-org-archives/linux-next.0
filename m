From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build warning
Date: Wed, 12 Nov 2008 16:38:56 +1100
Message-ID: <20081112163856.d08845fd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__12_Nov_2008_16_38_56_+1100_JS40SCH/bcaKnLpR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52765 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750778AbYKLFjJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 00:39:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__12_Nov_2008_16_38_56_+1100_JS40SCH/bcaKnLpR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

fs/devpts/inode.c:324: warning: 'compare_init_pts_sb' defined but not used

That function is only used if CONFIG_DEVPTS_MULTIPLE_INSTANCES is set, so
needs moving inside the ifdef just below it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__12_Nov_2008_16_38_56_+1100_JS40SCH/bcaKnLpR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkaa/AACgkQjjKRsyhoI8yaowCeOZSpjLcmOhMgCJlpAaSlMbDg
JloAn3+iLCJ41WXz5nBy5IvMrB5DWPbT
=/3Q/
-----END PGP SIGNATURE-----

--Signature=_Wed__12_Nov_2008_16_38_56_+1100_JS40SCH/bcaKnLpR--
