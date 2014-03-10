From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 10 Mar 2014 15:39:50 +0000
Message-ID: <20140310153950.5567aa7b37066c1d083c20c3@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__10_Mar_2014_15_39_50_+0000_D6aFgsgAqK3j7Xdh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>, Roman Pen <r.peniaev@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__10_Mar_2014_15_39_50_+0000_D6aFgsgAqK3j7Xdh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in block/blk-mq.c=
 between commit d6a25b31315327 (blk-mq: support partial I/O completions) fr=
om Linus' tree and commit af5040da01ef (blktrace: fix accounting of partial=
ly completed requests) from the block tree.

I fixed it up by dropping the hunk from af5040da01ef in a way git doesn't s=
eem easily persuaded to show as a resolution and can carry the fix as neces=
sary (no action is required).

--Signature=_Mon__10_Mar_2014_15_39_50_+0000_D6aFgsgAqK3j7Xdh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTHdzGAAoJELSic+t+oim9h6MP/jaz+CW05sdS3vGL9XQ300FY
tKK41CNTkyjBpKkIhfCtkNVm/p8T0TjxEa2AG9B51+nykkWtxHa2Gsyxxv/gVZqN
hhxjVDHCfd1errPEuOYtQrPy7ZvmYI1JxWWQVjgYz9ohpT4hQA4nnWxJijMA9/r8
0FFP1T4WxfkafPCJ+Trqs9yne/uyjlggtTekDv5aOm7N8vm8xg+6vpG0LYCCP54a
9cTCcLa5zd1Ml7qIV2gAZ/7140kS+XkJOFh3rlaPpVXGDH8DI2SOrn1dIj/WdID5
X4Jxfy8ziiyvBE/qYlblu3SUWcg1n57ZHOJR4Ztk94xJVmhmSpD9FGYAFIyPByNO
a0O2BB09INkgnVRuNdfDNEfQtq4eUWy3BKhbG7//XQ2dHIMRW5H4KU5p865CnlOw
ndjRY9iMjVT5pThqcHTsQ8RSVVBjD34XBsZdt/dAlhfl+F8xjjjvKeCBz1NodOSS
n+T88OdXv5z2Sb3WlwAU9HymDp8ExYEbtiMNc0j6Q96vPxmQXubg+SsNKat8byTl
4z+bRnU2sT7zLfzRGeLHMbiARtb1cshbhfXQ8lYMkrmRgDbiATt/7In1g4Z2o57o
0A5DYIFnyNjk5x/WFWXqdfyPnLcOqi6KKcawWbObXJVCRtbCs1wDSvUEfXj5ZXZg
PpkTvIOced1H+c/U0fkW
=D4TR
-----END PGP SIGNATURE-----

--Signature=_Mon__10_Mar_2014_15_39_50_+0000_D6aFgsgAqK3j7Xdh--
