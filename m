From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the drm-msm tree
Date: Fri, 27 Jul 2018 08:08:21 +1000
Message-ID: <20180727080821.3f277eb6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hLSTXTZjtA37Kq.INSGfP_0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/hLSTXTZjtA37Kq.INSGfP_0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Commits

  746e4fe9c852 ("drm/msm/gpu: Add the buffer objects from the submit to the=
 crash dump")
  f757c7aa9f52 ("drm/msm/adreno: Add a5xx specific registers for the GPU st=
ate")
  8ab75ab4f1a7 ("drm/msm/adreno: Add ringbuffer data to the GPU state")
  db71c98cb23c ("drm/msm/adreno: Convert the show/crash file format")
  abd069d0e0d8 ("drm/msm/gpu: Capture the GPU state on a GPU hang")
  2426bf25885c ("drm/msm/gpu: Rearrange the code that collects the task dur=
ing a hang")
  34ee9abb541d ("drm/msm/gpu: Convert the GPU show function to use the GPU =
state")
  e0283c3c191a ("drm/msm/gpu: Capture the state of the GPU")
  fb72cf6167a3 ("drm: Add puts callback for the coredump printer")
  e0624c7467b3 ("drm: Add a -puts() function for the seq_file printer")
  3f7719f78570 ("drm: Add drm_puts() to complement drm_printf()")
  c7cec5d9fa96 ("drm: drm_printer: Add printer for devcoredump")
  bdf6119e70d8 ("include: Move ascii85 functions from i915 to linux/ascii85=
.h")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/hLSTXTZjtA37Kq.INSGfP_0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltaRlUACgkQAVBC80lX
0GyIDgf8C8xINg8t0D1erYzli9CShyMdT/DA5aHiTrtkUXjRq9N5347iGbloTmUE
gLKzVAsJ45wYlugEXGE38JBrz5xFuhvK2qwzaTkjlllW9kn+JN11aEwIe2XsfRec
gIEn0tVKRa1RZWE6OYW6mw9jCuUL1XF4j7eZ/Yw584h5m2IZpIzwuN+c5wKdeml3
zYLhV607vP9/Z6sAEn1s01RXpyiIhlwPcjDSP6jE2abU51nNzGYimzn1VHb6kc2B
EXGPvc0MpzNle0C4E9HT4xwAkriK8/zrMoyI0d06fDtVjpWtRyto2tLXH1tp46m7
fIn+0jQEhIprNH6jSqmle5MM60LVCQ==
=xMGE
-----END PGP SIGNATURE-----

--Sig_/hLSTXTZjtA37Kq.INSGfP_0--
