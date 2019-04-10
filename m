From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Date: Wed, 10 Apr 2019 11:21:38 +1000
Message-ID: <20190410112138.178aa7bd@canb.auug.org.au>
References: <20190409162749.7eb6656f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YMm6ymw/H5cdz.xhM=FcdLi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409162749.7eb6656f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bvanassche@acm.org>
List-Id: linux-next.vger.kernel.org

--Sig_/YMm6ymw/H5cdz.xhM=FcdLi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Apr 2019 16:27:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the scsi-mkp tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> drivers/scsi/qla2xxx/tcm_qla2xxx.c: In function 'tcm_qla2xxx_init_lport':
> drivers/scsi/qla2xxx/tcm_qla2xxx.c:1614:3: error: implicit declaration of=
 function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=3Dimplicit-function-=
declaration]
>    vzalloc(array_size(65536,
>    ^~~~~~~
>    kvzalloc
> drivers/scsi/qla2xxx/tcm_qla2xxx.c:1613:26: warning: assignment to 'struc=
t tcm_qla2xxx_fc_loopid *' from 'int' makes pointer from integer without a =
cast [-Wint-conversion]
>   lport->lport_loopid_map =3D
>                           ^
> drivers/scsi/qla2xxx/tcm_qla2xxx.c: In function 'tcm_qla2xxx_make_lport':
> drivers/scsi/qla2xxx/tcm_qla2xxx.c:1677:2: error: implicit declaration of=
 function 'vfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-decl=
aration]
>   vfree(lport->lport_loopid_map);
>   ^~~~~
>   kvfree
>=20
> Caused by commit
>=20
>   523c106ad4b1 ("scsi: tcm_qla2xxx: Minimize #include directives")
>=20
> I have reverted that commit for today.

This has now migrated to the scsi tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YMm6ymw/H5cdz.xhM=FcdLi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlytRSIACgkQAVBC80lX
0Gx91Qf+Idg8Pb9uQjgxBCmoy4xSSwoBb0GBPLAP/lsrd8046RB7kKYfVEKl8Afw
czePqWwhD60OfAaa503jraRGPAnlcyCTNwTF6s6egB15O1l9PV9Ma1TSOkyakr9V
M0xbP5PnL9hFAgzcOsNhzSwa8DrhDtwKbYTqOclIi+oyVGGiHzNu29CdFlusp9fW
zcHjOodxM7dmepKThK0cDnzdSylQ9ptFdSStn+Qklbvwp5ktehVcpzpZ9OetHCyj
v1r38A67HDfsYbBF2kZK/FLAkRsB2Tj8R3h0avFbMzXJDg3Po7MFsDmS957Oy9W/
XIpPiu7iakivgRBuK591d5aE9LbeLA==
=YKcB
-----END PGP SIGNATURE-----

--Sig_/YMm6ymw/H5cdz.xhM=FcdLi--
