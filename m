From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: devicetree tree build failure
Date: Mon, 14 Dec 2009 16:38:43 +1100
Message-ID: <20091214163843.dc81174f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__14_Dec_2009_16_38_43_+1100_R8.2_4oDlb_LOm0B"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55110 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751254AbZLNFit (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Dec 2009 00:38:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

--Signature=_Mon__14_Dec_2009_16_38_43_+1100_R8.2_4oDlb_LOm0B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/of/fdt.c: In function 'early_init_devtree':
drivers/of/fdt.c:530: error: 'early_init_dt_scan_phyp_dump' undeclared (fir=
st use in this function)

Caused by commit 825b073d40b34e331d49e727b9e208744ad26259 ("of/flattree:
merge early_init_devtree() and early_init_move_devtree()").

I have reverted that commit (and all later commits) from the devicetree
tree for today.

Grant, are these commits really intended for v2.6.33?  If not, please just
remove them from your tree until after v2.6.33-rc1, thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__14_Dec_2009_16_38_43_+1100_R8.2_4oDlb_LOm0B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkslz2MACgkQjjKRsyhoI8zGzwCcCmy1Fmua+xjzSd4n4mbR+KfK
il0An1B6BPCcX+hPUkVd7tLcrovxXwc5
=n1Vh
-----END PGP SIGNATURE-----

--Signature=_Mon__14_Dec_2009_16_38_43_+1100_R8.2_4oDlb_LOm0B--
