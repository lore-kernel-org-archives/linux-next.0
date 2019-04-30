From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the kvm-ppc tree
Date: Tue, 30 Apr 2019 20:59:40 +1000
Message-ID: <20190430205940.299f9a9f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=n2HWzeff/3hG+TOJTOh5Kp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Mackerras <paulus@ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>
List-Id: linux-next.vger.kernel.org

--Sig_/=n2HWzeff/3hG+TOJTOh5Kp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

In commit

  2001825efcea ("KVM: PPC: Book3S HV: Avoid lockdep debugging in TCE realmo=
de handlers")

Fixes tag

  Fixes: d3695aa4f452 ("KVM: PPC: Add support for multiple-TCE hcalls", 201=
6-02-15)

has these problem(s):

  - the date at the end of the fixes tag is unexpected

In commit

  3309bec85e60 ("KVM: PPC: Book3S HV: Fix lockdep warning when entering the=
 guest")

Fixes tag

  Fixes: 8b24e69fc47e ("KVM: PPC: Book3S HV: Close race with testing for si=
gnals on guest entry", 2017-06-26)

has these problem(s):

  - the date at the end of the fixes tag is unexpected

In commit

  345077c8e172 ("KVM: PPC: Book3S: Protect memslots while validating user a=
ddress")

Fixes tag

  Fixes: 42de7b9e2167 ("KVM: PPC: Validate TCEs against preregistered memor=
y page sizes", 2018-09-10)

has these problem(s):

  - the date at the end of the fixes tag is unexpected

Plese just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/=n2HWzeff/3hG+TOJTOh5Kp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzIKpwACgkQAVBC80lX
0Gwp9Af+Ni1gDcCHo8rt5XN0NMkxPuKZxJCRjAaU49Dxhd+pJfHdzgp+GbBUxnxM
GT4GJade7edtJQTZDHYU1qJJFIrJYs1aoE/msextT3T/S7lVBG6XwG1HybMFG1X9
0nfqPxI7XrsVga4gynVM7yVU+JlCUipfo8myIjO3e4CF29gRHjDtmhHlXF9DopAd
JGOcfPNZnqFRExw4dewrRkWXBaAED1EFwYXK50g/+lyuKaHQ+6NFQHs6uxXdQgle
K03YQ9pFZ0JHD3Z/ofT2da0XoGO4n22tUhGQDcy47pdmi/t/dvEA4W0lY2hrb76O
UfjtV7FRtiW/yv9zd8cukpjFK/bI2g==
=PvFq
-----END PGP SIGNATURE-----

--Sig_/=n2HWzeff/3hG+TOJTOh5Kp--
