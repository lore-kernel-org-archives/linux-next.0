From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: failed to fetch proc tree
Date: Fri, 3 Apr 2009 10:16:36 +1100
Message-ID: <20090403101636.9898fe36.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__3_Apr_2009_10_16_36_+1100_L=x0Jmr2fpUlQ.A_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52834 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757192AbZDBXQr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Apr 2009 19:16:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__3_Apr_2009_10_16_36_+1100_L=x0Jmr2fpUlQ.A_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexey,

Today I got this error while fetching the proc tree:

$ git fetch proc
fatal: Couldn't find remote ref refs/heads/proc

I will use what I fetched yesterday.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__3_Apr_2009_10_16_36_+1100_L=x0Jmr2fpUlQ.A_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknVR1QACgkQjjKRsyhoI8yPHgCglYCmYL4hyn0sr3lxRwVDa1UR
JSEAoIaIokV4ZjC86RZPa87bvkTvIKAz
=9y04
-----END PGP SIGNATURE-----

--Signature=_Fri__3_Apr_2009_10_16_36_+1100_L=x0Jmr2fpUlQ.A_--
