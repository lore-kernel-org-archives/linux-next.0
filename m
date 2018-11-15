From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net tree
Date: Thu, 15 Nov 2018 17:02:15 +1100
Message-ID: <20181115170215.1eed765d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/th5Use4NHEf+iAk=LU7yZgX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Kalderon <michal.kalderon@cavium.com>
List-Id: linux-next.vger.kernel.org

--Sig_/th5Use4NHEf+iAk=LU7yZgX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net tree, today's linux-next build (arm allmodconfig
(from KernelCI)) failed like this:

drivers/net/ethernet/qlogic/qed/qed_rdma.h:186:79: error: expected ';' befo=
re '}' token

Caused by commit

  291d57f67d24 ("qed: Fix rdma_info structure allocation")

--=20
Cheers,
Stephen Rothwell

--Sig_/th5Use4NHEf+iAk=LU7yZgX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvtC+cACgkQAVBC80lX
0Gz20gf/R566cv4Iww/MAb/coem2Bty0D1r5/zDKbiN6/QOlT8AUzDlO39VOqNSR
f0PY7G7hVeK1KEV+mojlTU32llCUx9mD5N80qsFOtotphvcrdXanKozL/qmKpWWp
qyp7dyHqdY3Tv9PsEQwrOWLttEiNym9e5Kjlo7MMz9/hxaGOJyJUwdlJMqz8WKKI
gRUN8Uxgj/YgxC+fHT3zV0dNXQdgdtCmB8a5SsWA9JWFzTPfPEwUwLPnY1r3VPyA
4Rtb4hgVE+qdYbVzvf9QZBu4IG7cA48GDEhxJ+3odnQAU3aeoPeBJPAjK5i+ykq3
kf7FBzxrMPS6CbvricuCh+Z+3ofRpw==
=0PCd
-----END PGP SIGNATURE-----

--Sig_/th5Use4NHEf+iAk=LU7yZgX--
