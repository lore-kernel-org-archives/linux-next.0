From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net-next tree
Date: Fri, 22 Mar 2019 05:54:07 +1100
Message-ID: <20190322055407.1f19a621@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zC_joeOPsbuoP_RYdR3cxWF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hoang Le <hoang.h.le@dektech.com.au>
List-Id: linux-next.vger.kernel.org

--Sig_/zC_joeOPsbuoP_RYdR3cxWF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commits

  08e046c8966a ("tipc: fix a null pointer deref")
  77d5ad4048fb ("tipc: fix use-after-free in tipc_sk_filter_rcv")

Fixes tag

  Fixes: c55c8eda ("tipc: smooth change between replicast and broadcast")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/zC_joeOPsbuoP_RYdR3cxWF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyT3c8ACgkQAVBC80lX
0GwdCQf+KFxg6xgWhc2imo1nOevF01EoQEkHxnU27Ki1RqByHaSpK4wlhOSNSGoo
u0NGH7CZF0eHx7VvfcvH3cRy1kXSJmzJLUYNDIf0bYDNbqYQglfm0uVlZqFQQszO
uieKnh8ReEtrgf3e7L43GKndNc+pHyF7XzTQinTFAQJ6bnTtRbwmrcINhIF8lvkt
xU5so3u631S0OQNw/EcFf8sKI0JuLgHnZvsr2h3WSrdZnYk1xwLnMrB0QefM0w6H
QUgeTY1v/ncL9yp0+DVDwyeDWpqC7/ulrm6ICpWru2Fia+1+bjMEA+NACd1EWX4R
GMIWUs2BzDanSFxzPIZNui9BqAfygg==
=x++1
-----END PGP SIGNATURE-----

--Sig_/zC_joeOPsbuoP_RYdR3cxWF--
