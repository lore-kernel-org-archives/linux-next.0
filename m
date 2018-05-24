From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 24 May 2018 15:35:47 +0100
Message-ID: <20180524143547.GX4828@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jn/MQTzma+jNUHFC"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Roopa Prabhu <roopa@cumulusnetworks.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--jn/MQTzma+jNUHFC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/ipv4/fib_frontend.c

between commit:

  2eabd764cb5512f1338 ("net: ipv4: add missing RTA_TABLE to rtm_ipv4_policy=
")

=66rom the net tree and commit:

  404eb77ea766260c45c ("ipv4: support sport, dport and ip_proto in RTM_GETR=
OUTE")

=66rom the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/ipv4/fib_frontend.c
index e66172aaf241,897ae92dff0f..000000000000
--- a/net/ipv4/fib_frontend.c
+++ b/net/ipv4/fib_frontend.c
@@@ -649,7 -649,9 +649,10 @@@ const struct nla_policy rtm_ipv4_policy
  	[RTA_ENCAP]		=3D { .type =3D NLA_NESTED },
  	[RTA_UID]		=3D { .type =3D NLA_U32 },
  	[RTA_MARK]		=3D { .type =3D NLA_U32 },
 +	[RTA_TABLE]		=3D { .type =3D NLA_U32 },
+ 	[RTA_IP_PROTO]		=3D { .type =3D NLA_U8 },
+ 	[RTA_SPORT]		=3D { .type =3D NLA_U16 },
+ 	[RTA_DPORT]		=3D { .type =3D NLA_U16 },
  };
 =20
  static int rtm_to_fib_config(struct net *net, struct sk_buff *skb,

--jn/MQTzma+jNUHFC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlsGzcMACgkQJNaLcl1U
h9BOOQf/dEd3dgnQoHZ1R7iNPxskfyOPRxIrn3NkV4ifMns+b9p+e5wr9AlQiCA5
ciHLDSEoAkwCbEolflaOtoNa10dJwLY9Tjpz/4FGSzQwSCvQJfk7shDvjLs7JNth
f0DWcYSQND16BmGkxgP97ONOqICgIP1lCzTVDSbWjDAvVFD11pCeM4DmpDO78kfv
3PXQVWZQqjaM6jABKlRfiOyp72EuDMhff1Ha+8F6acnHF4D1tOVv8Jfnv2Jr2DTb
yg+TEBXCtvVzlGgoIFXaFad8eMVslbOAoZoRAfnIAbRMTYqpRRdvuQXSEmgy37Ri
9thh2+0uI65Ib7MadEuqCCcDIV0zmQ==
=k5AT
-----END PGP SIGNATURE-----

--jn/MQTzma+jNUHFC--
