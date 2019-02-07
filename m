From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the fixes
 tree
Date: Thu, 7 Feb 2019 17:15:54 +1100
Message-ID: <20190207171554.59c91dbf@canb.auug.org.au>
References: <20190207154747.03209c75@canb.auug.org.au>
        <20190207165134.57c853dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//gUIvffR+3eiz_1lp/KzzB6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207165134.57c853dd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_//gUIvffR+3eiz_1lp/KzzB6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 7 Feb 2019 16:51:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Thu, 7 Feb 2019 15:47:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the scsi-mkp tree got a conflict in:
> >=20
> >   drivers/scsi/osd/osd_initiator.c
> >=20
> > between commit:
> >=20
> >   24648908acac ("scsi: osd: osd_initiator: mark expected switch fall-th=
roughs") =20
>=20
> I will remove that from my fixes tree for tomorrow.

And that same patch appears in the kspp-gustavo tree as well ...

--=20
Cheers,
Stephen Rothwell

--Sig_//gUIvffR+3eiz_1lp/KzzB6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbzRoACgkQAVBC80lX
0Gy3fAf9FuF+gmrSuy2vecljZu2FoEgFQYTgks5+762fF5L8Fs0J4yLIbLPtZ2Pu
M0FJqSa0mxfEFIvpTcRKpx5d2bIFr1iResq3gshY+nKXOeo7kokUTAAVEH8W1DiO
vRGygI6/JnRKLHmKhokV2UQjqjyzM9Jnw2GcnM5ctz+9933PxZ5bUHqs1voxq2iO
JRx4O3iYn4re1uGfxPJa7YzuGKx8klAHzKDYL0n67X/um8/20yOevkgQYz+l9wsM
ypb0rxjkggucDW/ZM5ku4CaTHd6X1WEa8gAzB4Re11geajD7ihJ7LEDO1RIqO+ct
tGFl/ol0bCBzZoBDsgk9CtmXI2r1+w==
=awF7
-----END PGP SIGNATURE-----

--Sig_//gUIvffR+3eiz_1lp/KzzB6--
