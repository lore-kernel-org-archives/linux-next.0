From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Date: Fri, 7 Dec 2018 13:38:50 +1100
Message-ID: <20181207133850.4eb17ff9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1697798338=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roman Li <Roman.Li@amd.com>
List-Id: linux-next.vger.kernel.org

--===============1697798338==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/i7zUcvo/4Wa+SUB/TjYDXiC"; protocol="application/pgp-signature"

--Sig_/i7zUcvo/4Wa+SUB/TjYDXiC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c

between commit:

  c6888879fd55 ("drm/amd/display: Fix 6x4K displays light-up on Vega20 (v2)=
")

from the drm-fixes tree and commit:

  24f7dd7ea98d ("drm/amd/display: move pplib/smu notification to dccg block=
")

from the drm tree.

I fixed it up (I am not sure how to fix this up, so I just dropped the
drm-fixes change) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/i7zUcvo/4Wa+SUB/TjYDXiC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwJ3ToACgkQAVBC80lX
0GwNjQgAnwWb1OlQkcjjG/UeKM6qgrydyFJCPsuRyWPyJYZEvE9CHrnOQfIJzuEV
GwjJHhM93oiwUlPHvrkO7UTcJc0z09hkoXPUK0X/2L0oqkx7m0KGllJIh4yF2ynK
lR3eKbkHKXo5zQcX9Jr6hMM0ONWevAdC3bGpss/9DFAGemG36hBYESyxpaxu9ICP
OTUaE48yHahKpNnmZdUslnC/z7GHMb8PrmHAAoy2q97ZkA3Wke/PnQiyQs2GH5Jw
HJwCezabEEBRo/9u//iRtwV7Jwule4tFVfhdNu/QKRmd6W0cqBTlIqVvuoHVsYdQ
K3CrHjyw83TZZgC1BDgzvv02NZUcUg==
=EfWq
-----END PGP SIGNATURE-----

--Sig_/i7zUcvo/4Wa+SUB/TjYDXiC--

--===============1697798338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1697798338==--
