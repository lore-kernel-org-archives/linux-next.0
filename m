From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: v4l-dvb tree build failure
Date: Fri, 27 Mar 2009 11:40:35 +1100
Message-ID: <20090327114035.d039243a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__27_Mar_2009_11_40_35_+1100_mIfy.2UbfU44MXN0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50510 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933377AbZC0Ako (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2009 20:40:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, Mike Isely <isely@pobox.com>

--Signature=_Fri__27_Mar_2009_11_40_35_+1100_mIfy.2UbfU44MXN0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "pvr2_cs53l32a_subdev_update" [drivers/media/video/pvrusb2/pvrusb2.k=
o] undefined!

Probably caused by commit 0c0ffee771caed42ab9655c36cceb0c70f518eda
("V4L/DVB (11207): pvrusb2: Add composite and s-video input support for
OnAir devices").

I have used the v4l-dvb tree from next-20090326 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__27_Mar_2009_11_40_35_+1100_mIfy.2UbfU44MXN0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknMIIMACgkQjjKRsyhoI8wlwQCdFKXmgkcI50D4H+FrMtaBVZy0
YO4AoKyWkmYvZ6hLCWx8JZYrfXVODUrK
=bCPv
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Mar_2009_11_40_35_+1100_mIfy.2UbfU44MXN0--
