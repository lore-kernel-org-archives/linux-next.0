From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the v4l-dvb tree
Date: Fri, 31 Dec 2010 11:59:55 +1100
Message-ID: <20101231115955.f6a11505.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__31_Dec_2010_11_59_55_+1100_NQEh8hBSOqR29vEc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34062 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751255Ab0LaBAA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Dec 2010 20:00:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__31_Dec_2010_11_59_55_+1100_NQEh8hBSOqR29vEc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

After merging the v4l-dvb tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/media/video/ivtv/ivtv-i2c.c: In function 'get_key_adaptec':
drivers/media/video/ivtv/ivtv-i2c.c:170: warning: cast from pointer to inte=
ger of different size
drivers/media/video/ivtv/ivtv-i2c.c:171: warning: cast from pointer to inte=
ger of different size

Introduced by commit e1e2c57565635310209566a31a300e593f74cc22 ("[media]
ivtv: Add Adaptec Remote Controller").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__31_Dec_2010_11_59_55_+1100_NQEh8hBSOqR29vEc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNHSsLAAoJEDMEi1NhKgbsgvUH/RpcaYQmShLoBTsVLBjUkR2Z
DK8t05xHgV4vxUxb1UHfyOtVQKcb9B43OJGPoRhExpyxFkXcCnRrsnRofxB07iZL
prHLpwBtvpxxSU/YCLWLm7pKE4GV7J7Z+oCUzEW66dzhdWPPpUkXJP5lsIKUPDsg
sQtt548QY5d+hwCcKehn7sM9RT+0SP4NN7732mL870gARvc79gORlgFTe2k7CfbS
qAy86ewJyL8ky4rIFStw9zOEFQ3dXWQ2SbkJSgoACOa8vpqw/eMdvqQ3VSQmf4Xl
dPQc7C0DdzfyO4aqfgQhikvMRyKIIwP+KwcZvlaJgepND8enB2GzBSWTEdI2HGg=
=59Lz
-----END PGP SIGNATURE-----

--Signature=_Fri__31_Dec_2010_11_59_55_+1100_NQEh8hBSOqR29vEc--
