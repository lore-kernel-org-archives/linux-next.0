From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb tree
Date: Tue, 23 Apr 2019 07:22:35 +1000
Message-ID: <20190423072235.254434f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xutuPEP+=kfBtEDtddQ.6lV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Potapenko <glider@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
List-Id: linux-next.vger.kernel.org

--Sig_/xutuPEP+=kfBtEDtddQ.6lV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

In commit

  dad7e270ba71 ("media: vivid: use vfree() instead of kfree() for dev->bitm=
ap_cap")

Fixes tag

  Fixes: ef834f7836ec0 ("[media] vivid: add the video capture and output

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags across more than one line.  Also, keep
all the tags on one group.

--=20
Cheers,
Stephen Rothwell

--Sig_/xutuPEP+=kfBtEDtddQ.6lV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+MJsACgkQAVBC80lX
0Gz3sggAokEEQEbskUc6XRjgfq5/rr0Q7mQK0/3Q+OlKjLMjPApQretWRU7QJSku
zMHTck02nK0zwxIyByZEjhfRZFZBZODg7EKuj1CjtZwoc8gWBEchZma/zHFfLRmM
3I4/Ei8ioGu5y7nSwSEg/AQjhB+IItjy4F34C4os7KtWcm13+uC/GGrGxKslXhjC
FncPe+zICgLUfWxunon0DAm5lzHoNF8xHL4zyO305MPdPUclCpDGQYX3QsaWtO3Q
ulagWHC9lJtGK2du4C3vE+dNpow/stEM3XTCkFwnJy2SAszznA5KjF5VLo56zIOO
tM5vaTzihyAOyuJf9qwws1pqFNJB/w==
=Qd0J
-----END PGP SIGNATURE-----

--Sig_/xutuPEP+=kfBtEDtddQ.6lV--
