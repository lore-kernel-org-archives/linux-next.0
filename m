From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Date: Fri, 7 Sep 2018 07:26:04 +1000
Message-ID: <20180907072604.3b0019d1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qTMNdongZYF.DCqUSwKVhHJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/qTMNdongZYF.DCqUSwKVhHJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  760902b24960 ("clocksource: Revert "Remove kthread"")

is missing a Signed-off-by from its committer.  Reverts are commits, too.

--=20
Cheers,
Stephen Rothwell

--Sig_/qTMNdongZYF.DCqUSwKVhHJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluRm2wACgkQAVBC80lX
0Gz0MAf/cQPb35R+sF2u+KkT5GFbTNgNHEo/OQr70kwr5FjTbYbJB+4Y2wBf2jEW
LshIzNbq4WkNi/Va6wK6IJgwHpy5UDzC4O5wJxb7xqnT2mklsJNUTMeKHoQLUjmy
5Bs2wKDveZ4HbwWcTw+OdUloIWtcsolsNm1ufNBorBdu3YgC2p8Jprbx7lX/+/1O
eBsCJyIyQCZfwizvgEqbDrU66yQaA2pRxFObQaTeq8dFVIWsX67QcP75hEqr8ktK
pKGANFKI4FoysTUwQkAurLnhAR0Auj64crpze5RmT1S3/dr8xRfAjf2z+AM7kQ+q
+WAWyQX26j1xpS+K5U4RfVYZ3UHCFQ==
=nd1h
-----END PGP SIGNATURE-----

--Sig_/qTMNdongZYF.DCqUSwKVhHJ--
