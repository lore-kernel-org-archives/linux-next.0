From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the drm-msm tree with Linus' tree
Date: Mon, 16 Oct 2017 13:02:00 +0100
Message-ID: <20171016120200.r4thc6zsfqemgyp4@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="huubx6vkg6dy74wo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>, Jordan Crouse <jcrouse@codeaurora.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--huubx6vkg6dy74wo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/msm_gem_submit.c

between commit:

  06451a3d1d7771 ("drm/msm: fix _NO_IMPLICIT fencing case")

=66rom Linus' tree and commit:

  642e5ef8c6c496 ("drm/msm: fix _NO_IMPLICIT fencing case")

=66rom the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(null diff)

--huubx6vkg6dy74wo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnkn7gACgkQJNaLcl1U
h9CBWQf+Jby5pQ6aWG77W45m5R73+yYRpPCWWUEue9KNA2KD8HOWeai0N2CpDodS
dgBsCP3qDxtXN9CtLGYP3LzWnaJxUwFL/JI70PcYNHMsLvUnVBXnf7v2qGMr/5Hb
OfesgU1DRTS9FJspjGi9DzYugSXB2tvO3jRdTYknkz/HfHMod7lUDMIwo0bnqKg8
wdLi0pjtpo2dpSrFjjUsc7e1JZG7I0yr7ZYNDMxhL2YyfcRlRMbsllrlGuIvxWqQ
y0txtYDcNRjg9XDxuWIYpyLseucYPxJUBZGsmBgknCCn4GDt4Rz1cz5YTlym4HdB
WQT717lhYA1CHVtsIdmNxdDIpVDR2g==
=CMfo
-----END PGP SIGNATURE-----

--huubx6vkg6dy74wo--
