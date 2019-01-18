From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the drm-fixes tree
Date: Fri, 18 Jan 2019 15:42:59 +1100
Message-ID: <20190118154259.16a7761c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0357270764=="
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
List-Id: linux-next.vger.kernel.org

--===============0357270764==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/C7iIOJ8361rdN+P8fID7TB/"; protocol="application/pgp-signature"

--Sig_/C7iIOJ8361rdN+P8fID7TB/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  dddce8b49005 ("drm/amd/display: Only get the connector state for VRR when=
 toggled")

Fixes tag

  Fixes: 3cc22f281318 ("drm/amdgpu: Set FreeSync state using drm VRR proper=
ties")

has these problem(s):

  - Target SHA1 does not exist

--=20
Cheers,
Stephen Rothwell

--Sig_/C7iIOJ8361rdN+P8fID7TB/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxBWVMACgkQAVBC80lX
0GwXAgf+OfFNrTFt7rrvVi61EvmhO0VxYVPrWdNNxAjAo7YbZ8ZI4KoLUhWdcIL4
pGMCmW8Po61nxzyhQmfGD19pMAyqPSxoLYAEEsUogid2zTcDmEHj47YxnA/mOISv
lffPtN5DrtXmsSIlyYobYfGhWCa7UczIAFG0cZ6TwW1OVocmsrW2L39WiRe65nXW
1Kp/7N6m5bhi/QUUgWPTSy70FPVJlXC1dguAu+kE07HVeRA5m3aysA/6P42Bg5Qi
vHrcY5h6Pe4NmF2MZuZg3kCBta8xgzs7vHN3hqzepIB9KrQyyiyeqAQGBlMEjU3R
OKp/f9y/MGAKwIU4G5y28ybJEUosRg==
=nMR1
-----END PGP SIGNATURE-----

--Sig_/C7iIOJ8361rdN+P8fID7TB/--

--===============0357270764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0357270764==--
