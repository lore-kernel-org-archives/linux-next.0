From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the v4l-dvb tree
Date: Fri, 8 Feb 2019 07:39:43 +1100
Message-ID: <20190208073943.0317d5ea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aTJTitUrGHEGzsnvTdXsFnI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>, "Lucas A. M. =?UTF-8?B?TWFnYWxow6Nlcw==?=" <lucmaga@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/aTJTitUrGHEGzsnvTdXsFnI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

In commit

  c2d88e7d66f9 ("media: vb2: Fix buf_out_validate documentation")

Fixes tag

  Fixes: 28d77c21cb ("media: vb2: add buf_out_validate callback")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

In commit

  adc589d2a208 ("media: vimc: Add vimc-streamer for stream control")

Fixes tag

  Fixes: f2fe89061d797 ("vimc: Virtual Media Controller core, capture

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes
  - Subject does not match target commit subject

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/aTJTitUrGHEGzsnvTdXsFnI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxcl48ACgkQAVBC80lX
0GysvAgAgu5WnSrelhXf2Jf0WHsXlx43cgzfSZDH1iYsR0setTzVpRU+5sbrBBF1
py3SaLAJv9ll8cwCWqhQ9gk1+pQ5fec4RXBNDYfjiropM1hjt6y83j6cEnZlrmNM
zpcR8jVZ8fGfdGnrdL3j30rP/dUPSXDC1DsWBW3vic1piS7GZlovO1SscPYVIWsm
aEXvUXAgHOVRRgUFzRHaqSvb2vdyiWOB8l47/eqQGQfha5qf3KXveiYZ3Y0BauoL
bhYozUSjRaxFnAIFmtjwEVDVaFUtV4QoO36M+CVWqeiaU3Bka5BqGeceV18VBkGS
IL50vZESus3c308x8PGALN61BbT9uQ==
=mNyq
-----END PGP SIGNATURE-----

--Sig_/aTJTitUrGHEGzsnvTdXsFnI--
