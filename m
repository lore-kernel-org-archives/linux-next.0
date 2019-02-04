From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the drm tree
Date: Mon, 4 Feb 2019 16:50:39 +1100
Message-ID: <20190204165039.3380e8f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d3wA01fenthDcfpCMvDEd7F"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/d3wA01fenthDcfpCMvDEd7F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4b5105036afb ("drm/amd/display: Don't leak memory when updating streams")

Fixes tags

  Fixes: c00e0cc0fdc0 ("drm/amd/display: Call into DC once per multiplane f=
lip")
  Fixes: ea39594e0855 ("drm/amd/display: Perform plane updates only when ne=
eded")

have this problem:

  - Target SHA1s do not exist

--=20
Cheers,
Stephen Rothwell

--Sig_/d3wA01fenthDcfpCMvDEd7F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxX0q8ACgkQAVBC80lX
0Gy71wf8DfEsu2z9+RUk//kf8+ae4n3uiojF4hJMI2krZ4qXLzebOJM6W4kkRUZy
P46if8L7FdoY2wOEhpVBLmIiUXEgIsi3zZXKeLIri6oNMeWvWSD6bTwRSPQuxGBP
cE9NWRdPZ56fQ3PTGvjvAbieJOmEcHYXCqFgpLZrK7vkbHxHpH5TSeWg0EpiGc6X
7FZmYW/G8Kre2WfWIzrf1VFjfer3ZAxezw15XBd+4ZIluwM2lRBcwG9qRzFczwSi
IIfjTE1kl/g4zncysNjkcd0lKmVLTEh7xcFPpfDBy7IYh8LDhK8rtQ5j4gf/AYXD
rrccPoa2KFu91D0f94efW9w8uQFdbw==
=AQM5
-----END PGP SIGNATURE-----

--Sig_/d3wA01fenthDcfpCMvDEd7F--
