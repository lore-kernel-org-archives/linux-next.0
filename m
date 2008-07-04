From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the hdlc tree
Date: Fri, 4 Jul 2008 19:39:43 +1000
Message-ID: <20080704193943.125d526c.sfr@canb.auug.org.au>
References: <20080704185645.d96ef6dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Jul_2008_19_39_43_+1000_iEKvMRF2sJfQ+DZa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54524 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751684AbYGDJju (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Jul 2008 05:39:50 -0400
In-Reply-To: <20080704185645.d96ef6dd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: linux-next@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

--Signature=_Fri__4_Jul_2008_19_39_43_+1000_iEKvMRF2sJfQ+DZa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Jul 2008 18:56:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the hdlc tree got a conflict in
> drivers/net/wan/cosa.c between commit
> 0911810755fc9f15659cc3cb43912633b90027a0 ("cosa: cdev lock_kernel()
> pushdown") from the blk-removal tree and commit
                      ^^^
bkl

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_Jul_2008_19_39_43_+1000_iEKvMRF2sJfQ+DZa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkht798ACgkQjjKRsyhoI8zhXgCeOxe4eOb1iE8luFMf6sivhVMo
EQYAmgOVaJSt0XIl8O4mVJsGNfiSLrb0
=6yFu
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Jul_2008_19_39_43_+1000_iEKvMRF2sJfQ+DZa--
