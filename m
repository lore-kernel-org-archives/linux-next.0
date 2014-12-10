From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Date: Wed, 10 Dec 2014 12:49:25 +1100
Message-ID: <20141210124925.2cba833c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1383417814=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--===============1383417814==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8hx1ORyya/chZUdXc0RdPdZ"; protocol="application/pgp-signature"

--Sig_/8hx1ORyya/chZUdXc0RdPdZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in
Documentation/DocBook/drm.tmpl between commit 6f134d7bb434 ("drm/tile:
expose the tile property to userspace (v3)") from the drm tree and
commit e2beb6cd5d0f ("drm/Documentation: Fix rowspan value in
drm-kms-properties") from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/DocBook/drm.tmpl
index 60c1063d4178,b344bc3b0d77..000000000000
--- a/Documentation/DocBook/drm.tmpl
+++ b/Documentation/DocBook/drm.tmpl
@@@ -2550,8 -2546,8 +2550,8 @@@ void intel_crt_init(struct drm_device *
  	<td valign=3D"top" >Description/Restrictions</td>
  	</tr>
  	<tr>
- 	<td rowspan=3D"23" valign=3D"top" >DRM</td>
+ 	<td rowspan=3D"24" valign=3D"top" >DRM</td>
 -	<td rowspan=3D"3" valign=3D"top" >Generic</td>
 +	<td rowspan=3D"4" valign=3D"top" >Generic</td>
  	<td valign=3D"top" >=E2=80=9CEDID=E2=80=9D</td>
  	<td valign=3D"top" >BLOB | IMMUTABLE</td>
  	<td valign=3D"top" >0</td>

--Sig_/8hx1ORyya/chZUdXc0RdPdZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUh6apAAoJEMDTa8Ir7ZwV8ccP/jCRpUsMCDki74P0aKeViJZu
AuWo5XhftMVgOL1rKAgvwDavwZEa7IERAH/aUm+eZOjUAoO9F+aDrHy+9oIP95QC
xxmMD7Z4eg1R3kIfQTcfnns23pMRjkrpUO6jpfgWtWpPFUelyoVstnZ7AamNQDgX
vDqq8ylppdQFW8fS4g7R+q3cZ+F4eyi/7C9elbRO9wTBWN7Zp7ZoAiCZzTaGzfBk
d4u9yYugTxK+ynNlxxq3s6MTosukZhPp/IwiedH43MIJBURiAGFL3COKPhiNAfo3
QBcVvy/eY8onfBvxte7bYdQASPYD31ReTMB+hqxUNk6Ejv7C37HZzvLZpSuQRaCi
RX0sFK9/OLmrrOqaZ5w+WC47hdex8AzOiez5yN5xDjo7vx/FwxRAlqft0SkuW4Lw
niRmnOSe8zOAFyZuw5wvl/drLwEvUYLjE4pYayWK3bfsatPRx/YVFZaebj/uhSjm
T9aRkYN18IobOHX6n3kk9ODIhnZX/nanjqhdeXfM6DIIegYfMIVAx3o5mynJ1vrf
R/ictK4RMcqh9rxtlzeXAH2cObTwSSPvEwY7TLT0mPL6eJHwn/BC4Kh7wa1N2J0Z
MAQTk2CZEWNE3njHjvb5nZPJf7BM1qqRNDlrtbCD0ObVi5bJejRoiVQAkPkXh74G
GMbo67I6l5z5o8KMUlPy
=g5+i
-----END PGP SIGNATURE-----

--Sig_/8hx1ORyya/chZUdXc0RdPdZ--

--===============1383417814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1383417814==--
