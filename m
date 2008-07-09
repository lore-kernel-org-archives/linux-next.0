From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nfs tree
Date: Wed, 9 Jul 2008 12:56:11 +1000
Message-ID: <20080709125611.f25a9467.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__9_Jul_2008_12_56_11_+1000_jaTd67uNYYrxkLXX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36645 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750848AbYGIC4S (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 22:56:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__9_Jul_2008_12_56_11_+1000_jaTd67uNYYrxkLXX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

Today's linux-next merge of the nfs tree got a conflict in
net/sunrpc/rpcb_clnt.c between commit
0d3a34b48c87a374b37d7a21a60d257d076484f3 ("SUNRPC: Fix a double-free in
rpcbind") from Linus' tree (which is in nfs tree as well) and some commit
(s) from the nfs tree.

I just used the version from the nfs tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__9_Jul_2008_12_56_11_+1000_jaTd67uNYYrxkLXX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh0KMsACgkQjjKRsyhoI8wPOgCfb9Soo4rEWEyL8UTmYmuLXM9c
wPUAnjyB2/WMnxJSftCaGSQkzBz9dlAb
=KwNM
-----END PGP SIGNATURE-----

--Signature=_Wed__9_Jul_2008_12_56_11_+1000_jaTd67uNYYrxkLXX--
