From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Fri, 7 Sep 2018 10:57:10 +1000
Message-ID: <20180907105710.7ac48267@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XTd5dFCzM44jrC1EFWZzrq8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>
List-Id: linux-next.vger.kernel.org

--Sig_/XTd5dFCzM44jrC1EFWZzrq8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

sound/soc/soc-dapm.c: In function 'snd_soc_dai_link_event':
sound/soc/soc-dapm.c:3771:9: warning: 'ret' may be used uninitialized in th=
is function [-Wmaybe-uninitialized]
  return ret;
         ^~~

This looks like a (subtle) false positive. You have to assume that all
the loops will be executed at least once.

Probably introduced by commit

  4a75aae17b2a ("ASoC: dapm: Add support for multi-CODEC CODEC to CODEC lin=
ks")

--=20
Cheers,
Stephen Rothwell

--Sig_/XTd5dFCzM44jrC1EFWZzrq8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluRzOYACgkQAVBC80lX
0GwMUQgAg39mQjGval79/rsMqYOB/RXO6ah/nwZDsBzOb83J0Lu8gOlUEI91Dt/v
9jsd1+Qw11QKa2+aF0hD6gsVuhoG6D8GNha19bh79+QG8xsir8zZamTExPtzhi7i
saQD5WHZBjtjQwagF42XewbGXmsd9lblHhw6LlF5CKKZJf57/VaAnvhjUq3fHTyk
vWQ6znLFSzD7SGtjOiSANGG9QDwQcpdg9NPU0bzxtRyyg9Hm2aFK3j+oVXEY6tuI
OMZh5Ox2Awq1e8qqSlxnh5GM34f/u7IsSbnDDy6ReRlNljpyKh+Dx/b6o7WADbvb
2l9C/ulImsQkmaBkEJVSS9l1ArosWg==
=kq7a
-----END PGP SIGNATURE-----

--Sig_/XTd5dFCzM44jrC1EFWZzrq8--
