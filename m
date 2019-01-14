From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mali-dp tree
Date: Mon, 14 Jan 2019 12:21:38 +1100
Message-ID: <20190114122138.724ba326@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Pl2mXa.vZIUYGfVekdw91c+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "James Qian Wang (Arm Technology China)" <james.qian.wang@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Pl2mXa.vZIUYGfVekdw91c+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mali-dp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/gpu/drm/arm/display/komeda/komeda_framebuffer=
.c:11:
drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h:13:25: error: field=
 'base' has incomplete type
  struct drm_framebuffer base;
                         ^~~~

Caused by commit

  31849148cb41 ("drm/komeda: Add komeda_framebuffer")

I have used the mali-dp tree from next-20190111 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pl2mXa.vZIUYGfVekdw91c+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw75CIACgkQAVBC80lX
0Gy7dwf/WLObYa5Tex18fs96k6sbY9Q8gfIaLwY5msyM00H9VpAGx1niLFFwIm4v
VysxZ5cbaMRe8Cz3SHI/pg5JmUfLLFm/QymdPtWNEyWX5HrnBQpx4SusE0E3BRYq
g0PW0HaBhiOQjd9/SWuSpP453CSkZHNvr9OPPe2trp5b1SKxTlrg2lUC73ugs2yw
5yYdHZ0qK/msi0iSirPKeJ0gtQTjRUI1IB4HuFkR0ZQpV4FW6VjMHrbGJvKJL4sg
Q5N9BWbduz1AGThf/kp+fp2sCaMPQGvEhCLD1A9g6SgQu+8KRvuMiDsKqop17Iif
78FCJD/rei+2EqpKRc3Yipq52J/rCw==
=PK2W
-----END PGP SIGNATURE-----

--Sig_/Pl2mXa.vZIUYGfVekdw91c+--
