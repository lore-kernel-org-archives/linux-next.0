From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dma-buf tree with the staging tree
Date: Tue, 20 May 2014 17:00:31 +1000
Message-ID: <20140520170031.1d27c26a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/v9T7=FX/rRLLTL6Uhj=V+p+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sumit Semwal <sumit.semwal@linaro.org>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@canonical.com>, Seunghun Lee <waydi1@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/v9T7=FX/rRLLTL6Uhj=V+p+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sumit,

Today's linux-next merge of the dma-buf tree got a conflict in
drivers/staging/android/sync.c between commit 10f62861b4a2 ("staging:
android: fix missing a blank line after declarations") from the staging
tree and commit 85958aff6184 ("android: convert sync to fence api, v5")
from the dma-buf tree.

I fixed it up (I just used the dma-buf tree version of conflicting
sections) and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/v9T7=FX/rRLLTL6Uhj=V+p+
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTev2VAAoJEMDTa8Ir7ZwVRuIP/16vOnsTZlb944E853kvVALA
yXSTG5hhVT3JMgsTJgLKHv1bXp2bgGR2mCY6ZQPBnjRSGgZJvvx8uxPV3bAjeN8N
YUBVJuhk5ZHr5HsRjU0lkPdqiPlCf67qh96bLXPATwQ0oG1u5ZeoWF+fO3FO86Vc
Xs5LuYUY8qrtmwYY+n4uBXGu6O4lYIJplBSlIZsG1+c0YVPl8dXsWZdYM6LHJaUU
5rUZjGV0Os2mkgvic52LliKG7sA4eWLbNWyQH66BA+se4XzFPhpoTj5JSEqE7kD7
j9qARraDTVwD7DpkTMt2n7SnB68XHvv9eMiAJ9Q4ZtXnPCM1GNuv74dq2yI+jxXq
hPoXmnCtKS7LzFD891iG2331JGUrwnaNVy43wlNlMI7oZW8msJo+VLhiwBO7CPtV
SNDy1+ysIBlnyuv0v+nIl0QZxDliS8T7TTG/X2RSnZlPD8KgJU9OHNbY3PrJpeBc
FG9Umyd4LAuNHT3gUuJlQkrxLthoJdI2coAeHsGcE7aUE/rpTjfVowtCCWl3O9rQ
uf52hC30eFY00MgsnK+WHfRHNAyXq+vZlph8MeBMjAPeJhUOY/dVygGngs4lQVWK
9MvgRXtEgawHTC4Z4yLbk8V1W8N7ML3gTUNBoObl/4091z/KO4Sn3jaNQLGNWqWn
La+jZCGcA7dxDaK9Icsv
=hIVy
-----END PGP SIGNATURE-----

--Sig_/v9T7=FX/rRLLTL6Uhj=V+p+--
