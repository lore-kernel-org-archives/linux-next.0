From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the printk tree
Date: Tue, 18 Dec 2018 07:08:07 +1100
Message-ID: <20181218070807.07cb795d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qnrle3UzuAP1tkKsAbJw/G+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/qnrle3UzuAP1tkKsAbJw/G+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Petr,

Commit

  503283fa006d ("printk: Add caller information to printk() output.")

is missing a Signed-off-by from its committer.

Moreover, that patch appears twice in the tree (the other time properly
signed-off),

--=20
Cheers,
Stephen Rothwell

--Sig_/qnrle3UzuAP1tkKsAbJw/G+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwYAicACgkQAVBC80lX
0GzvKwf/YNNcd4mgWnInFjdyuaD0pFiNYvkGwly6Pb3EXX/iHVBqqH703xJIU6lG
m3eUp69BEl9sMOPY8Gf+I+dwSTSQcSLuRyOiygIdvD5K+yZTMtB6OhXjegsU0x4i
aqigOeXkiyPLKCywHrgCuNjQZMiHtnBPKMmlcK4BjrNjIiZC+e9bU93IQ3Hud2ki
qG0lsMKAJtcDAoAmk6CRdHp98mk2khQtoR01XvQEz3KUraaMYG1cwdsrdqOpy7vF
Ac6UKTADOOd34QSxuaHAiEZIhviKy+cJXMsfZ0thA/MDAWasB6RL8WuX1ItUXyoW
gv97BmG7jY95Sn1aetXi618pYT2EXA==
=5e5x
-----END PGP SIGNATURE-----

--Sig_/qnrle3UzuAP1tkKsAbJw/G+--
