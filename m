From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the amdgpu tree
Date: Tue, 19 Mar 2019 11:04:39 +1100
Message-ID: <20190319110439.1747b4ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jzpdD3xrmVLn9CYObu4bn.s"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Francis <David.Francis@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/jzpdD3xrmVLn9CYObu4bn.s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:


ERROR: "get_vupdate_offset_from_vsync" [drivers/gpu/drm/amd/amdgpu/amdgpu.k=
o] undefined!

Caused by commit

  67b112ed997b ("drm/amd/display: On DCN1, Wait for vupdate on cursor updat=
es")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/jzpdD3xrmVLn9CYObu4bn.s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyQMhcACgkQAVBC80lX
0GwJPQf7Bj0CRZpT+PjIef/Lqz9zzS6kpCEtbzH6dr/E02AxvOSEQT3XRf4eRfvS
2Rzvsx80y7x01BHJoqa4euYOwl2JVJkUD3q10ecxJSaV540wowHX4vwIf9T4cLnw
yiMEPSGltoVIY3o1ygW2EHXXxA/tlCXo/GxMd0ZGuP/yqKShhHG6y7ZfIi6LP8xo
rGmpTa3XrXXQArmO/YI5uNSHc5j5MXSxmsts/tiXkYs/Ha0sJecTCJ5EVlzDepO8
YqoPCS2yIPRdHaDRgpynx/1O7yiS0+xnlr11yTHy7j4NYptfKLp/pGI+e6WBJZ7e
Ig+xhbW47mMrspLlVJ1bPaayLX4XVg==
=DSFP
-----END PGP SIGNATURE-----

--Sig_/jzpdD3xrmVLn9CYObu4bn.s--
