From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: powerpc tree build warning
Date: Fri, 22 May 2009 11:28:11 +1000
Message-ID: <20090522112811.433432e2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__22_May_2009_11_28_11_+1000_rfyL2T_Onf7BBDwS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53129 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751920AbZEVB2P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 May 2009 21:28:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vinay Sridhar <vinay@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, Michael Ellerman <michael@ellerman.id.au>

--Signature=_Fri__22_May_2009_11_28_11_+1000_rfyL2T_Onf7BBDwS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ben,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

arch/powerpc/xmon/xmon.c: In function 'dump_log_buf':
arch/powerpc/xmon/xmon.c:2133: warning: unused variable 'i'

Introduced by commit f312deb4cd0c88196edf6dab192b7d42514398d6
("powerpc/xmon: Add dl command to dump contents of __log_buf").

[As an aside, that commit contains this:
	Signed-off-by: Michael Ellerman <michael at ellerman.id.au>
but we use real email addresses normally]

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__22_May_2009_11_28_11_+1000_rfyL2T_Onf7BBDwS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoV/6sACgkQjjKRsyhoI8z8AgCfWP+uELrtefAYzlaAQkJlLibO
RbAAoKbYp02h/fCYq0zDdXcJdSQNch3O
=Y/5/
-----END PGP SIGNATURE-----

--Signature=_Fri__22_May_2009_11_28_11_+1000_rfyL2T_Onf7BBDwS--
