From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Fri, 5 Apr 2019 15:55:50 +1100
Message-ID: <20190405155550.5648e84e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cLp97bMfCJzh/a1bl_E5SiI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Stanley <joel@jms.id.au>
List-Id: linux-next.vger.kernel.org

--Sig_/cLp97bMfCJzh/a1bl_E5SiI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

kernel/dma/contiguous.c:19:10: fatal error: asm/dma-contiguous.h: No such f=
ile or directory
 #include <asm/dma-contiguous.h>
          ^~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  4f2a8f5898ec ("drm: Add ASPEED GFX driver")

I have disabled that driver for today (by making it depend on BROKEN).



--=20
Cheers,
Stephen Rothwell

--Sig_/cLp97bMfCJzh/a1bl_E5SiI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlym39YACgkQAVBC80lX
0Gz92Qf8DLTL+IPx0dSo3+SLZ/6T0WfhrUE9hS6pgqWXcSA2xILzcf6IgizaMZhp
V5WnSi03VxImCC5iupTmc9nbjqQ11NKxAm+Vk3H/njahENtZKPO0+Fb7UZxhl75p
md1g3f12Ia5YTN0KXYAIGaLCzux1AVuB3LgtVHw/lKIpmSnOyF3VbnMfqmVTrbC5
rrcVNiDgGtinYDDJP2u04wxqi/fQjVTlgw6FZG6IL0II/Gv5uXooib8nvQgMBpNV
2jdvDwbtHXe3X6tH6mia7Bm8tW8z5YkN6E36Tbgm0QyEhhcl7/DKaH7fmNcjNhxM
+yLohG7+9WAPZypqgFzB+mXBRoQsDw==
=Slc4
-----END PGP SIGNATURE-----

--Sig_/cLp97bMfCJzh/a1bl_E5SiI--
