From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: infiniband tree build failure
Date: Fri, 8 May 2009 11:53:56 +1000
Message-ID: <20090508115356.b97b8981.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__8_May_2009_11_53_56_+1000_qC5IDm=T5OmYVB1i"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58580 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752175AbZEHByK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 May 2009 21:54:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>, general@lists.openfabrics.org
Cc: linux-next@vger.kernel.org, Jack Morgenstein <jackm@dev.mellanox.co.il>

--Signature=_Fri__8_May_2009_11_53_56_+1000_qC5IDm=T5OmYVB1i
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roland,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/infiniband/hw/mlx4/mr.c: In function 'mlx4_ib_alloc_fast_reg_page_l=
ist':
drivers/infiniband/hw/mlx4/mr.c:242: error: label 'err_free_mfrpl' used but=
 not defined

Caused by commit 88029ff3c862812b81745ae3d6557ede96e2d051 ("IB/mlx4:
Don't overwrite fast registration page list when posting work request").
Clearly not build tested :-(

I have used the version of the tree from next-20090507.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__8_May_2009_11_53_56_+1000_qC5IDm=T5OmYVB1i
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoDkLQACgkQjjKRsyhoI8xG4wCggB1cA1znmnGYVyBMdyf3B8HZ
RM8AoKQnwaZURd0y6uDF7nGIcvVzmU0J
=QEJp
-----END PGP SIGNATURE-----

--Signature=_Fri__8_May_2009_11_53_56_+1000_qC5IDm=T5OmYVB1i--
