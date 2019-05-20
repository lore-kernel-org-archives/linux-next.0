From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the drm-intel tree
Date: Mon, 20 May 2019 22:15:38 +1000
Message-ID: <20190520221526.0e103916@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/93.yJMrxB2DtnwT3NNY0Pe4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>
List-Id: linux-next.vger.kernel.org

--Sig_/93.yJMrxB2DtnwT3NNY0Pe4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0d90ccb70211 ("drm/i915: Delay semaphore submission until the start of th=
e signaler")

Fixes tag

  Fixes: e88619646971 ("drm/i915: Use HW semaphores for inter-engine synchr=
oni

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please don't split Fixes tags across more than one line.



--=20
Cheers,
Stephen Rothwell

--Sig_/93.yJMrxB2DtnwT3NNY0Pe4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzimmoACgkQAVBC80lX
0GxWzwf+JJpeqte4AZNmzAlqyodr2d/yBI5DD7IxonPDxwoD/Ilm+eMpi0WIpLe7
ZES0519Y1Q9WOZXLZyjwLcRyxXMZjBdCjtFsEqBXN76kv75lycG+36jLMRETIf/I
oJ6cfDd1XPgvY08HvBvexcO9hfABtSWhOuOcN/h8AJBf8YG1nt2fTF4KERXQDLpw
nvqwKEmaM3y/s8LTUx0oJnQxCUFrfRE1yq4S2M0Ga99Bho84Qvh+wo7I3EMa1HnG
oOIo3vShLHmNoK4buX5kfqRJhgs/Cqn6P83KQvDcoUjJagEsuSnAqeUMO5y90jmZ
I1E7mYfhYZpsnDyYGm5Q/srqj9PDjw==
=vD+z
-----END PGP SIGNATURE-----

--Sig_/93.yJMrxB2DtnwT3NNY0Pe4--
