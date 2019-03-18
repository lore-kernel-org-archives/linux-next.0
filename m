From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the amdgpu tree
Date: Mon, 18 Mar 2019 15:59:14 +1100
Message-ID: <20190318155914.74b67033@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0ntJg.sTk1g4uTNh.zAX+0X"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mario Kleiner <mario.kleiner.de@gmail.com>, kbuild test robot <fengguang.wu@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Dave Airlie <airlied@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/0ntJg.sTk1g4uTNh.zAX+0X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

In commit

  4dc982bbdaad ("drm/amd/powerplay: fix memdup.cocci warnings")

Fixes tag

  Fixes: 76760fe3c00d ("drm/amd/powerplay: add function to store overdrive =
information for smu11")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

  ec95996ed982 ("drm/amd/powerplay: add function to store overdrive informa=
tion for smu11")

In commit

  7b19bba58f77 ("drm/amd/display: Use vrr friendly pageflip throttling in D=
C.")

Fixes tag

  Fixes: bb47de736661 ("drm/amdgpu: Set FreeSync state using drm VRR

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not wrap Fixes tags onto more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/0ntJg.sTk1g4uTNh.zAX+0X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyPJaIACgkQAVBC80lX
0GzuuQf+IKALn5aomqFo50WQB1fWMbKXf0mf8/+7ARYOjrMyNCsuhJajOoTeSdfL
CjWwDyu1i/zhdClYA5Vq3Ys5Gx5leQMHVH/G8rqhZfX3zDXruhp0YE/aklRGicco
l/QwnaSkTFvwHIDqqz6cbWXKkIehl2pT55lVpsdzkjcou0gvjPKTkaqPVGXnpnaC
OsEN6yfC2fL5/ASd3KUzlnQzC2gtGUasb5IG4ck1GVNGc/N1hgGfViyZY0v42hOX
YN92hMJHn4hkCQuGwwLz/UuHdxsJcQfrFBXSizQ2yVzkXqflp7wasIOwg/IA2KU5
Ja7d7nyiUq+W94ZiomolwgRszNnCIw==
=nfZ6
-----END PGP SIGNATURE-----

--Sig_/0ntJg.sTk1g4uTNh.zAX+0X--
