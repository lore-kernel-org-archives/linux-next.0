From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm-misc tree with
 Linus' tree
Date: Fri, 24 May 2019 00:16:25 +1000
Message-ID: <20190524001625.0b6fecf9@canb.auug.org.au>
References: <20190521105151.51ffa942@canb.auug.org.au>
 <20190523115355.joyeqlmbjkufueyn@flea>
 <20190523230409.31da92b9@canb.auug.org.au>
 <CAKMK7uHvUFtRNn5j6TnmBrs5ndkSuNwJWzB026j2zczaV9O_Tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1448063731=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uHvUFtRNn5j6TnmBrs5ndkSuNwJWzB026j2zczaV9O_Tg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Marco Felsch <m.felsch@pengutronix.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>, DRI <dri-devel@lists.freedesktop.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

--===============1448063731==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Lto4Vqh.Sf2uq.agtHE_J7H"; protocol="application/pgp-signature"

--Sig_/Lto4Vqh.Sf2uq.agtHE_J7H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, 23 May 2019 15:11:15 +0200 Daniel Vetter <daniel.vetter@ffwll.ch> w=
rote:
>
> That commit is on top of drm-misc, and somehow the .txt version has
> been resurrect in drm-misc-next (so needs to be re-deleted too).

My mistake, the conflict went away (due to the back merge) so my
scripts assumed the file no longer needed deleting.  I didn't actually
check to see if it was still there.

--=20
Cheers,
Stephen Rothwell

--Sig_/Lto4Vqh.Sf2uq.agtHE_J7H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzmqzkACgkQAVBC80lX
0GzjnwgAmiMZYg6ACSWYMNWAUn6//4dvhxdK1F1onb3ap1eSKnfwXy8C27qChOif
cNQ0vUXxhpyL+oI7fa0lh1L194r0XosPDfjweNoi2YcKZB/C8Gc0ELbNzLyWAl4Q
gwUTl666k2vCwRHtpZPEFCSDV3rvNwOnXqn44n5I4g4w179enkkprQ+Ln/ZJZmVq
yk1/n4SnE6GsVBzlKwsI2bjqmLqCL+eWLzELzxH9zYfvvJdJPNuD0TKODL6G5biH
UoZHxBpiF5wHr48cqbNyrqwvp/Jlvq/+TNh0gbLxZdi/0Q8ZudMzNlgERqW26jmz
NmQSVUCd+zPcdPEveqiZ9436fJG/Gg==
=yq0b
-----END PGP SIGNATURE-----

--Sig_/Lto4Vqh.Sf2uq.agtHE_J7H--

--===============1448063731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============1448063731==--
