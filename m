From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rpmsg tree
Date: Thu, 26 Apr 2018 13:33:10 +1000
Message-ID: <20180426133310.0ec74122@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6.KL=Q6=KT_sHpA9WmOruHH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/6.KL=Q6=KT_sHpA9WmOruHH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

After merging the rpmsg tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/remoteproc/remoteproc_core.c: In function 'rproc_handle_devmem':
drivers/remoteproc/remoteproc_core.c:557:8: error: implicit declaration of =
function 'iommu_map_sync'; did you mean 'iommu_map_sg'? [-Werror=3Dimplicit=
-function-declaration]
  ret =3D iommu_map_sync(rproc->domain, rsc->da,
        ^~~~~~~~~~~~~~
        iommu_map_sg
drivers/remoteproc/remoteproc_core.c: In function 'rproc_resource_cleanup':
drivers/remoteproc/remoteproc_core.c:845:14: error: implicit declaration of=
 function 'iommu_unmap_sync'; did you mean 'iommu_unmap_fast'? [-Werror=3Di=
mplicit-function-declaration]
   unmapped =3D iommu_unmap_sync(rproc->domain, entry->da,
              ^~~~~~~~~~~~~~~~
              iommu_unmap_fast

Caused by commit

  aace25b18cbd ("remoteproc: Use sychronized interface of the IOMMU-API")

I suspect that part of the commit is missing ...

I have use the rpmsg tree from next-20180424 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/6.KL=Q6=KT_sHpA9WmOruHH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrhSHYACgkQAVBC80lX
0GwCigf/U1mKADsObcKGlS1L6LbQkISKvwAKk608t4T9xcnBam+WzCxd+PJd7Th2
77OxfZaVPESWjPEvITCfYI6wbfGQJtlittKnkURzloHyTmL1tkLFujKa8UG4SKk5
Bbw2VyvnoN6AgYR3qZR4pZ9iiug6/1Xkquj5anRxFX3dO2HE+12rf1KEyX36ZqS1
gSPlBbJwCgUduK38+O/EoyqJcT2pFz7W4p3QPrBBa5ZesiHJ0p1psBwYbGlsomHe
iY0EUkh7nvTv+aq5R+NJugweiz424GBaRpv5uXDOOj7jw2IhstiXuHtSAyRxVVpz
0G4cwwGkZa+vz5IraBwaQDObKtjKbA==
=rrJO
-----END PGP SIGNATURE-----

--Sig_/6.KL=Q6=KT_sHpA9WmOruHH--
