From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the staging tree
Date: Wed, 6 May 2015 14:10:50 +1000
Message-ID: <20150506141050.5689c298@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bwDXCXO0Lf1XsZ5Z.O+bQ4O"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56142 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753195AbbEFEK5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 May 2015 00:10:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/bwDXCXO0Lf1XsZ5Z.O+bQ4O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

drivers/staging/lustre/lustre/llite/file.c: In function 'll_iocontrol_unreg=
ister':
drivers/staging/lustre/lustre/llite/file.c:3249:17: warning: unused variabl=
e 'size' [-Wunused-variable]
    unsigned int size =3D tmp->iocd_size;
                 ^
drivers/staging/lustre/lustre/llite/llite_lib.c: In function 'll_fill_super=
':
drivers/staging/lustre/lustre/llite/llite_lib.c:912:12: warning: unused var=
iable 'instlen' [-Wunused-variable]
  const int instlen =3D sizeof(cfg->cfg_instance) * 2 + 2;
            ^

Introduced by commit 97903a26fcfc ("staging: lustre: llite: drop uses
of OBD free functions").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/bwDXCXO0Lf1XsZ5Z.O+bQ4O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVSZRPAAoJEMDTa8Ir7ZwV+TQP+wS7OTC2vHGmq6BsTIsY9XlC
TH32lZB2sKGwidkg+Xmjs3qOQhizmlXJ3A4vYliR5FWluca3Kba2WESA+o5/mLe6
kJcs6auKda6/ndVODzKYfSFqLRfLAdid3Au7QioaJo1XxyYw+Ihz2u3esizw+nsL
xa8+9zkZhBdxPVxCWw+Nzljk99WoPaYzJ2sO1siJSg1A6atBXLNVeqCJX+46AsZ7
yEKckx1HIUVNgVO4lu8WfzxRCeNT7KibqHQ3WmWGsslFRfcCYZ7KGa3s3GEUoN49
MkYkNEvtACZWmX2aYZcyUrkVH0ozNL0AVSkaRtYUP1JYpT4gLnirXiVwXPHThArD
KxsGnLeGOxDuT3COKHP4YwbbdYzygFdG6RbDsYzoMfaCwh+PEWxVPnZ58aiqGocT
IrZscwp0ur11TsSoSQXM8E6LzKfgB4RY8O3f8CxZ889ATbmSuFSB2mDZqbGoJyLh
E7RETFn537uXHm5MkKe9F0tc9SQWogjNOqa6YZDhvMChaa/l+vzkM4U2uEEhocIB
ck+To/3EgubOPhK4OSYnQvxl71Ef+je9Z2xMW+41hCrCStNfQkJVIIfxNjyqG0HQ
qdBqlWyQ+FaDxUJPOD8uISlNIdaF8QUIUZjQBoKXDQLdFYUIplieR6oNbSs1vBJm
EHHNwA+Xq/Op7X87pXOT
=1u9b
-----END PGP SIGNATURE-----

--Sig_/bwDXCXO0Lf1XsZ5Z.O+bQ4O--
