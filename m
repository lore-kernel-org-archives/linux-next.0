From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Thu, 21 Feb 2019 13:13:56 +1100
Message-ID: <20190221131356.6a477727@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D.353ghiToqxg5gJzzMiy=o"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-next.vger.kernel.org

--Sig_/D.353ghiToqxg5gJzzMiy=o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

sound/soc/samsung/odroid.c: In function 'odroid_audio_probe':
sound/soc/samsung/odroid.c:298:22: warning: 'cpu_dai' may be used uninitial=
ized in this function [-Wmaybe-uninitialized]
  priv->clk_i2s_bus =3D of_clk_get_by_name(cpu_dai, "iis");
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  d832d2b246c5 ("ASoC: samsung: odroid: Fix of_node refcount unbalance")

--=20
Cheers,
Stephen Rothwell

--Sig_/D.353ghiToqxg5gJzzMiy=o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxuCWQACgkQAVBC80lX
0GzLKgf+I8LD/4hoM5MTxufQtLAdqo9N5W4ueLqdsa3QLgsBmn8zF3jXEtYVehTB
aatLJJl/ePg0hZwnkSUYqvW1JIhDVRZNJyNM2scBsIOZ0F5yswbWB2v+6V+mkIga
uoSb0z/UksnJspbwlNvh8hLr1ryVqWm+PsvYfyRuaGo+x29TKiJ9RFV5FCJj21Ib
XwXuhe5V7qa7iT9HoHz1k/1oAcQGtZW5HYQBUL4Qz+nGYaAhBZs9BRQelYF5M9fC
S+CZaN7OH2wakyksTDIhhKty6BNhF90T/Sn+OXcaykKz2W0GKOMB/nC1ZZpzrcWF
3l2QpujD5w4s+L2mTwZ53tR2oaa+TA==
=ANSR
-----END PGP SIGNATURE-----

--Sig_/D.353ghiToqxg5gJzzMiy=o--
