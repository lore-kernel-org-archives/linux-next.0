From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the v4l-dvb tree
Date: Fri, 27 Jul 2018 14:36:40 +1000
Message-ID: <20180727143640.4dc3fa54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0551750961=="
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
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Steve Longerbeam <steve_longerbeam@mentor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============0551750961==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tJtDrI3UakkURF+g5o+Re61"; protocol="application/pgp-signature"

--Sig_/tJtDrI3UakkURF+g5o+Re61
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/ipu-v3/ipu-cpmem.c

between commit:

  343b23a7c6b6 ("media: gpu: ipu-v3: Allow negative offsets for interlaced =
scanning")

from the v4l-dvb tree and commit:

  4e3c5d7e05be ("gpu: ipu-v3: Allow negative offsets for interlaced scannin=
g")

from the drm tree.

I fixed it up (I just used the drm tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/tJtDrI3UakkURF+g5o+Re61
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltaoVgACgkQAVBC80lX
0Gw6PAf/WB4sfm81A8xuj62y9T8Kw1mNJDO7++f3WjYdlepP5s/EchZeun1kr9od
qdlRuSeUFrUvk99jLYCUrbNowkULSMypUJF/vCnCvhuc6ozrc9yUjJSchnPmRiZp
RVVWoHMw49pbzVlxvnd7BQkyXZhNuqyL8jpPdq/46TAXsMK+uyYmgpHebaTVBLYj
tNVIc3De2BejcKrZJj0cn0AU3aRNTEGUNQ6ZFxyTal8+JarXl9ynJIiWH0ooLJTw
qMlXcKRvpotzZsItP/N65RW6PJAD0AQMcImqu1bzSTCsrwKkN4zorSL8ihLG5WG9
rdGsp6MmZxtQllOHeyWkOvgRRU3WnA==
=vROx
-----END PGP SIGNATURE-----

--Sig_/tJtDrI3UakkURF+g5o+Re61--

--===============0551750961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0551750961==--
