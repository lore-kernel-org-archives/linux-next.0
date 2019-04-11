From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Thu, 11 Apr 2019 16:58:59 +1000
Message-ID: <20190411165859.63be9174@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.IH.SVej_fxoiepeJgiNmVp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Wang <jasowang@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/.IH.SVej_fxoiepeJgiNmVp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  813dbeb656d6 ("vhost: reject zero size iova range")

Fixes tag

  Fixes: 6b1e6cc7 ("vhost: new device IOTLB API")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/.IH.SVej_fxoiepeJgiNmVp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyu5bMACgkQAVBC80lX
0GwtCgf/X6zMJIcm/MjdqicE0RlHVvV5M4u4k1E2k13HBcR7hBAuoAL69xwAxwsH
XMHgqKBqIeeggXgjhMWdy+LhERpTrr9rOqH6IBkrW4reAI9qTtKVWobcsWv0uVrx
6CmlFgzQC5eIRum3i1YAModefcIiST5YW9Le89GsrwSkrZfRnA1a+Of1DkAXBDDf
B5itVeOyick7p/15QJAzD1J6J8UF8btVBUYCwn0q8SjdhFh5GJ/hy/Xj+e1qaTi9
gq+Q9LZUUMR7YIDFfNCo9pgRdrUJzZaWoN+FjhFXkQfo2SqYIFnNaRsrewrPv4IU
X2gMvL47P5W/fFbPEqrotedAaLwh2w==
=L2yi
-----END PGP SIGNATURE-----

--Sig_/.IH.SVej_fxoiepeJgiNmVp--
