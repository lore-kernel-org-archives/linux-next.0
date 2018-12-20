From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the scsi-mkp tree
Date: Thu, 20 Dec 2018 17:34:57 +1100
Message-ID: <20181220173457.66c83c0f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H0LAdbIO0_=hHQZK7vD+B+u"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Carroll <david.carroll@microsemi.com>, Kees Cook <keescook@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/H0LAdbIO0_=hHQZK7vD+B+u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/scsi/smartpqi/smartpqi_init.c: In function 'pqi_build_raid_path_req=
uest':
drivers/scsi/smartpqi/smartpqi_init.c:478:14: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
   cdb_length =3D 0;
   ~~~~~~~~~~~^~~
drivers/scsi/smartpqi/smartpqi_init.c:479:2: note: here
  case BMIC_IDENTIFY_CONTROLLER:
  ^~~~
drivers/scsi/smartpqi/smartpqi_init.c:487:14: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
   cdb_length =3D 0;
   ~~~~~~~~~~~^~~
drivers/scsi/smartpqi/smartpqi_init.c:488:2: note: here
  case BMIC_WRITE_HOST_WELLNESS:
  ^~~~

Introduced by commit

  171c28653a2d ("scsi: smartpqi: turn off lun data caching for ptraid")

This due to my use of -Wimplicit-fallthrough for Kees Cook.  This is
new code.  The warning can be suppressed by adding a comment like

  /* fall through */

just above the following "case" or "default" to indicate that the
fallthrough is intended.

--=20
Cheers,
Stephen Rothwell

--Sig_/H0LAdbIO0_=hHQZK7vD+B+u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwbOBEACgkQAVBC80lX
0GyXGAf/fH+35bQsUAb8scL5DoD5Wcdir4zL8vov+SOSYxKm3Hii4wR/sf52o4QM
ayLMmH9IZjb2cNb0NHJnYODClquFRwxkmXgckjrieAp0Dao6RxXXq5/lCuQV4NRQ
M3yySxokn7WmtqZ1hp1cWj9cU/atw2Zwu3PBAc3+1aBHi3jP0sB8KM7KU+92mlRw
HSKdlG/jVxYgmBmn6NY2UNYskwjKWgI/bn6yKdtIcg3tW/r71AWqWVUIkEyAMRB2
ZrvZkXnWLLpbJ13Oncgu1fu5mjayL4dPFNwn0B6FHyS2ceMcqrg7mjaHxZVzWdPS
R0CVqCGXiICYTAvT7jU+Nymz8W5DXg==
=UTwG
-----END PGP SIGNATURE-----

--Sig_/H0LAdbIO0_=hHQZK7vD+B+u--
