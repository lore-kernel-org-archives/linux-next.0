From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Mon, 25 Jun 2018 14:22:07 +1000
Message-ID: <20180625142207.5feecdcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1051735639=="
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
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Stone <daniels@collabora.com>
List-Id: linux-next.vger.kernel.org

--===============1051735639==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Jlphf=sM222pYyKzfbW+7+G"; protocol="application/pgp-signature"

--Sig_/Jlphf=sM222pYyKzfbW+7+G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/gpu/drm/gma500/mdfld_intel_display.c: In function 'mdfld__intel_pip=
e_set_base':
drivers/gpu/drm/gma500/mdfld_intel_display.c:170:26: warning: unused variab=
le 'psbfb' [-Wunused-variable]
  struct psb_framebuffer *psbfb =3D to_psb_fb(fb);
                          ^~~~~

Introduced by commit

  c7cbed560ce2 ("drm/gma500: Fix Medfield for drm_framebuffer move")

--=20
Cheers,
Stephen Rothwell

--Sig_/Jlphf=sM222pYyKzfbW+7+G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlswbe8ACgkQAVBC80lX
0GxsiQgAnt9jTEnL2m++nJWHMI9uMyz1mxnpm26mfy90UQvnn1AXeHsu4O9SqzZZ
wk50mX1QqoEbzEg+JG7lQlEPzNOPCvN2tzRzKS9Ok4R2VTBQJl3yM32I0DqD7ubX
3LM1hEBWAZQWC4n7dX7wqhSuUlWvONUNiTqvA0anE0zdv1qnBFM5T90DaibIOoQh
bZNN+R6n3Vg8b8h917HRhgtdutefL7klMRuVkv/W8oPy4MCbnavgIXzxdQnXV0mp
CUT9VgrxASbg7747Eq8d+BtvWEReNhNE4o1/dIeyTB1atAlzrR9wnG94NaZPtiVX
1TeLBy4rU9U3WLToUoso4M+Ntj/WrA==
=nla+
-----END PGP SIGNATURE-----

--Sig_/Jlphf=sM222pYyKzfbW+7+G--

--===============1051735639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1051735639==--
