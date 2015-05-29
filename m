From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the ipsec tree
Date: Fri, 29 May 2015 14:21:40 +1000
Message-ID: <20150529142140.1d052f26@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/g3yaHj7qsZs=5z1IOzvOT+c"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58640 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750919AbbE2EVm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 May 2015 00:21:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Steffen Klassert <steffen.klassert@secunet.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/g3yaHj7qsZs=5z1IOzvOT+c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in
net/ipv6/esp6.c between commit 6d7258ca9370 ("esp6: Use high-order
sequence number bits for IV generation") from the ipsec tree and commit
000ae7b2690e ("esp6: Switch to new AEAD interface") from the crypto
tree.

I fixed it up (the latter seems to have incorporated the change from
the former) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/g3yaHj7qsZs=5z1IOzvOT+c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZ+lUAAoJEMDTa8Ir7ZwVN1wP+wcJU7iOz6IIyN2qKIVMO3SE
xHKPnLKTPSRgCI+sjY7GLBizv6pZKx01cX6ipor7MmA9ZhwQavRARJtxwPR6CY2F
2bNlRFabsDHtQEme5PBHLko1L+2OA8FD5QSrCDhLhMXbtTJ4hTjHyjOHWEHCetm8
1bt2n1YyNKk9FFyS2wMZhwPXZFPMcKFVlr84KjRAP+qhVi3BRqItLLQoIJAp4qNI
HNJgGx5A7682Xn3eK3hYPwAIeABFInWHBpX7WG+Fp0AwW6yxJ8+8V8/1pEclyxWP
KDFOQ+hCn7T0p0zBZAoIDUNfW804dWuMziWqurmxYr1y0nJiAqd6tYQpxtqVu0FP
yoB4GT8dgCNNN6HxwxTfeblnLPqOQRpJsRRseP0YdnT6pDiV+ZpVPy57XsP0MtWO
J4C121onCbR6xUfpWYpWJFsQ7kMhHt26Pi+9CLsKcIPlKoMN5XOn/OOSY20eVKwj
RpOgfp4A+4F3YnBpN09c9QjbbFY3s0hg9ZUO8VS283DCVHOcGRL26RIjkObKFSGs
CeHXyQFu8AaDAtX5Uof4sM7l4X/k2FdX0ihvGhWIEfZRYHZ/JT5eVuYHJaZCOp4v
qMUq2Gwwp4hANNiGqyobKpoMaWdEPqb7Ad6XIjBLwFk1VdODh6yRlu595q2evAQe
u2PVv6nEqxVBcztw5f/2
=SGaZ
-----END PGP SIGNATURE-----

--Sig_/g3yaHj7qsZs=5z1IOzvOT+c--
