From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 3 Apr 2019 11:11:08 +1100
Message-ID: <20190403111108.2ff4a309@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6t9BxO+vh_Iinn.Ler=0s8I"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Yintang Ren <yintang.ren@unisoc.com>
List-Id: linux-next.vger.kernel.org

--Sig_/6t9BxO+vh_Iinn.Ler=0s8I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "sprd_platform_compr_ops" [sound/soc/sprd/sprd-pcm-dma.ko] undefined!

Caused by commit

  cce1396936ef ("ASoC: sprd: Add Spreadtrum audio compress offload support")

I have used the sound-asoc tree from next-20190402 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/6t9BxO+vh_Iinn.Ler=0s8I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyj+hwACgkQAVBC80lX
0GyCYQf7BZL46LGn/rTF50AUMMp64FHZ0xYx9y/OxC7qQWWiyQp2eB9HfNpL2C1t
awMnUzhyOznGLoejS5mahDyAPCJTfX3EXVgzShLQk30bnS57euTA4Z5wFpPIliq/
CXcJ7kbhBBw+1ZmwJIJeG8cJHxtdElei43M8+PIIhqZLgBADIEzakEn9ZsKDyRt7
WacWAlgjq9kfVzMaIeEVv7y/Mbq+c0gu/GW9xLgRli1kbpPr+hP+qnihfl5HLxdG
NkCQSnVg1eDZVioDGH+xafoypgV0mC7UpElCdf26puSK5PRDs/NGmGqcFbFN5E66
m7PVVuQD3UZv46Kls40vH9XZu1zh5w==
=LM/B
-----END PGP SIGNATURE-----

--Sig_/6t9BxO+vh_Iinn.Ler=0s8I--
