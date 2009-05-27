From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Linus' tree build warning
Date: Wed, 27 May 2009 11:22:46 +1000
Message-ID: <20090527112246.5c9734ec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_May_2009_11_22_46_+1000_Yfdqo5le/ySqqMht"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41523 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753988AbZE0BWv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 May 2009 21:22:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__27_May_2009_11_22_46_+1000_Yfdqo5le/ySqqMht
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Today's linux-next build (powerpc ppc64_defconfig) produced these
warnings:

drivers/md/raid5.c: In function 'reshape_request':
drivers/md/raid5.c:3814: warning: comparison of distinct pointer types lack=
s a cast
drivers/md/raid5.c:3819: warning: comparison of distinct pointer types lack=
s a cast
drivers/md/raid5.c:3820: warning: comparison of distinct pointer types lack=
s a cast

Introduced by commit 848b3182365fdf5a05bcd5ed949071cac2c894b3 ("md:
raid5: avoid sector values going negative when testing reshape progress").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_May_2009_11_22_46_+1000_Yfdqo5le/ySqqMht
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkocleYACgkQjjKRsyhoI8wMGQCeMDj8EfEgj4fOB6v7P1956RA0
BAIAoKALq3hAtrOLmte5c19Wup9kRtcT
=PU20
-----END PGP SIGNATURE-----

--Signature=_Wed__27_May_2009_11_22_46_+1000_Yfdqo5le/ySqqMht--
