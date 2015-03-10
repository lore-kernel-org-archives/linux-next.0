From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 10 Mar 2015 13:01:20 +1100
Message-ID: <20150310130120.38bb6c55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/61a1XP7=NJFZE8qcTKM4gL7"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50802 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751501AbbCJCB1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Mar 2015 22:01:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bard Liao <bardliao@realtek.com>

--Sig_/61a1XP7=NJFZE8qcTKM4gL7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/codecs/rt5670.c: In function 'is_sys_clk_from_pll':
sound/soc/codecs/rt5670.c:519:38: error: 'struct snd_soc_dapm_widget' has n=
o member named 'codec'
  struct snd_soc_codec *codec =3D source->codec;
                                      ^

Caused by commit 485372dc24ca ("ASoC: rt5670: Check sysclk source by
private data")?

sound/soc/codecs/rt5670.c: In function 'rt5670_set_dai_sysclk':
sound/soc/codecs/rt5670.c:2272:1: error: expected expression before '<<' to=
ken
 <<<<<<< HEAD
 ^
sound/soc/codecs/rt5670.c:2284:1: error: expected expression before '>>' to=
ken
 >>>>>>> v4.0-rc3
 ^

Oops :-(

I have used the cound-asoc tree from next-20150306 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/61a1XP7=NJFZE8qcTKM4gL7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/lB0AAoJEMDTa8Ir7ZwVYWQP/2FoH/t2cePwNTMOYdYEk8nW
RqltL8u4Nvn845dEwW5pn/zQdSDF2VjlZXxUW/jWnzlD5O9doEm/E0/sil3xFyLz
biz+4OL+JTza7DflnfXiaxcM/xL8XhDX9KZFHwWp6161dCVKibAusjw7rAm6nqlG
4wQYvE3yg9PO4A3TNBF4FB/Q86L083j4/FdNbbbhpSQpK+FcnruGTyFU5RgxaB/K
QHbVp7b1tOQ2qOfeLKNF/+AytJuURrhabiNnPWDDy4StgbwYmMFVI4CQ0JdRnBkQ
8gzR8Fzz68y0sQYi0vCW1fv+JNrEOfxTTGhMkcdpUa82Jk0wYJlh4pfdhuZnsyEr
fWubPN2J/7ouNz2utKVoL77vB+0QLb+gAd2TFFARX9MUenyUIKEUkv3RHNZoInwx
bwXa0CMtFnl56Hrv4Ngg5UMhYVCkwKfPyUR6KaCE4vxgoOhZY0ZQy9JDgpeOf294
H8qDN5q5aCDxl0RmbYtb1YyPFRshxaoxcTODCvewei4+PrhDjyDlLnzkLvgfhOIG
ScHCU5dEihzTizR4TzjxNbtqY1lGIcdAFFr1jNNTyZVZNT5KpE4QRTwQ4CUXEtw0
SkQNFnu2dBIvrkLvqWDeQngJuZfBfsJ1AKEcZdGZAbheYbMUTbb2eASCieKlSUPb
FqAI9eoEAL5yBf2mic2d
=rhd7
-----END PGP SIGNATURE-----

--Sig_/61a1XP7=NJFZE8qcTKM4gL7--
