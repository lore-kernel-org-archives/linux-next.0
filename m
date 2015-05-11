From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus'  tree
Date: Mon, 11 May 2015 13:07:06 +1000
Message-ID: <20150511130706.5d62d3fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/W/NUUApSLNRJBc8DNkTuhWk"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51713 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751694AbbEKDHM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 May 2015 23:07:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mario Kleiner <mario.kleiner.de@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

--Sig_/W/NUUApSLNRJBc8DNkTuhWk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in drivers/gpu/drm/=
drm_irq.c between commit fdb68e09bbb1 ("drm: Zero out invalid vblank timest=
amp in drm_update_vblank_count") from Linus' tree and commit d66a1e38280c (=
"drm: Zero out invalid vblank timestamp in drm_update_vblank_count. (v2)") =
from the drm tree.

I fixed it up (a rebased version of a patch that is already in Linus'
tree :-( - I used the version from the drm tree) and can carry the fix
as necessary (no action is required).



--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Sig_/W/NUUApSLNRJBc8DNkTuhWk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUBzeAAoJEMDTa8Ir7ZwVWQQP/Rc33W4Dkjvwbrs5cXC6UOPV
hKDOSDPvcoXFSHsuj/rmndT9nobRNfcVjQFjp6/2vKYmBJdFmTupZrLee+yTpSQZ
JRrS8t/5kCm6OtWS3xF5phJjYsUXykNi6uDiVvG7wYzp+08hXll7baIREPSg7DQQ
UAtWeOgwl0z/rLF0vIEhevCZgKNnnjqUsxEn6EhQQnUYw+1dOGB1ESSin5pvJDi7
FyyRtWyGNAWz30z9G5gG6MFU5m0VqcxPMqVhdjALA9QBxKeckD6bYEuTVgf2Wm/V
X2Dh2LOT2AuF++yq8b6hS4ydXo9xWeRy7tK1hGGnRm5xnK5dUxYV/vMoq/+7ELAt
uOfiDjaJU34WMC9rP5AAzATcucmlxt65IWQ+WAp2T0Sd5rpIXvsDpTc+xz9FCEUZ
+XP50Kj7aWfSR3OdbnYrGxChVkcSAeIYCumeXK7gFWNCSqhPk1x1Up5EnjuU6tRd
lu24Y/KdQOLApXkcjVy1BzZQvUDjCkVvIt/DZnWo47XBu5bBApIqqA3paSSW4rgK
7E/lLRkDbiCIZn6a0+pmnnyc4DjO9SOJ21Uh4E1wVRSZoJxY1C4Ei2dqW/usY6OS
8XwfoUjJTzajE7EiJwLhcXgCyFVHaBl0r6FO2TfFVPVcEsU6y3fNKeLIY63Rc2WI
ExTzksSYXSgnCUVffhUN
=T1qx
-----END PGP SIGNATURE-----

--Sig_/W/NUUApSLNRJBc8DNkTuhWk--
