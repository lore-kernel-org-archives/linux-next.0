From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: infiniband tree build failure
Date: Fri, 20 Nov 2009 11:03:42 +1100
Message-ID: <20091120110342.5128b8f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Nov_2009_11_03_42_+1100_78ZqVIz7ja4xNeJK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44618 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757642AbZKTADn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Nov 2009 19:03:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>, general@lists.openfabrics.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__20_Nov_2009_11_03_42_+1100_78ZqVIz7ja4xNeJK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

ERROR: ".__ipv6_addr_type" [drivers/infiniband/core/rdma_cm.ko] undefined!

I have used the version of the infiniband tree from next-20091119 for
today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Nov_2009_11_03_42_+1100_78ZqVIz7ja4xNeJK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksF3N4ACgkQjjKRsyhoI8wkDwCgt095Dt0ikHbRwEoRPGzGz+uV
QCAAn3xzbJf9q8Jc42d6fcqAlGF2Y/QK
=Jclc
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Nov_2009_11_03_42_+1100_78ZqVIz7ja4xNeJK--
