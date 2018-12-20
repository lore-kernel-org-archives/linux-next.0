From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the net-next
 tree
Date: Thu, 20 Dec 2018 17:02:53 +1100
Message-ID: <20181220170253.011d0b10@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FcrPckkByQ0wbOg4CieH_NY"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/FcrPckkByQ0wbOg4CieH_NY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/ptp/ptp_clock.c

between commit:

  aea0a897af9e ("ptp: Fix pass zero to ERR_PTR() in ptp_clock_register")

from the net-next tree and commit:

  b9d93594c767 ("ptp: fix an IS_ERR() vs NULL check")

from the char-misc tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/FcrPckkByQ0wbOg4CieH_NY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwbMI0ACgkQAVBC80lX
0Gxpqwf/e9suOmkMqEGZ7UCtsbut65nq5+m9DPpuEnEH9tilwJOpoxHaTiRNPNE3
jnJIGHlrya2sg6fb2XSia68o+XeotUJBeIO9HD80jd0lNwf39SqKuLyRu0/siJTI
zBv5vNliAHFV4d3aji7j6aqYunYRjFMyXSdTQrraiYigMQBzelfRkHAzqZ+rery3
WTieFyn5sG+0VOFSgoXZLO5b3EZj/4wDvuM2kthYtuNOCfEfMSwBb4yYjLmLX0qB
Kor6w6OkPMEFYymFCO0tI7CRcg/80Q2t7nP/vVVJ5CGGYcuau4ImeHijggP8CWsV
8/PTrGqPSQAmTw0RQyEMsQeQkX7fAw==
=OTdg
-----END PGP SIGNATURE-----

--Sig_/FcrPckkByQ0wbOg4CieH_NY--
