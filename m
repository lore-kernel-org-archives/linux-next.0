From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 30 Oct 2017 18:36:05 +0000
Message-ID: <20171030183605.tytps6fqxhsgqpg4@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5n43owz6lg2s7nc5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54654 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752902AbdJ3SgO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Oct 2017 14:36:14 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, David Airlie <airlied@gmail.com>, Imre Deak <imre.deak@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--5n43owz6lg2s7nc5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/intel_runtime_pm.c

between commit:

  2a8408e537250 ("drm/i915/cnl: Reprogram DMC firmware after S3/S4 resume")

=66rom Linus' tree and commit:

  57522c4c87de2 ("drm/i915/cnl: Reprogram DMC firmware after S3/S4 resume")

=66rom the drm tree.  This one has also been in Linus' tree since -rc6.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/intel_display.c
index 5c7828c52d12,7e91dc9a0fcf..000000000000
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
diff --cc drivers/gpu/drm/i915/intel_runtime_pm.c
index 49577eba8e7e,8af286c63d3b..000000000000
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c

--5n43owz6lg2s7nc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAln3cRQACgkQJNaLcl1U
h9BO2gf/fFiuPFZqNme4F8Lov7vGSo2kmnZBjOeueM83kB//eFm4BN6BxCKlEbbx
9smg+71MfjAEuhRXbR/+gb6Gws4zxmKWIe9Uli7yTIr8jXQ6ocTRjMBspMPA9mPr
WHubZ9qf5JPqtv70IdawSkOoQJSUxZDwhpFZ5idBnbPtCF/eEXaGAI7mWTNviN4F
qx8BMlO0Ws44cNfMJeomMGGcnQpcSEev8z8CNRGe4uEXiMQ7sj4BWQn3ujXyxzTN
ReRiBq081YMnr2EVvfub7ySecdgvSsZFEAMv5+RGYJep/nUHFkjx1QYU19BKyMdJ
YSjOrt95bFkmNL0PTHeuRhHAOqdrqA==
=JUAQ
-----END PGP SIGNATURE-----

--5n43owz6lg2s7nc5--
