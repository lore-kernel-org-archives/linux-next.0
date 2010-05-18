From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (devicetree
 tree related)
Date: Tue, 18 May 2010 17:47:50 +1000
Message-ID: <20100518174750.cc965d84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__18_May_2010_17_47_50_+1000_djFlXtAFhPZ80++h"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46909 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755896Ab0ERHr6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 May 2010 03:47:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__18_May_2010_17_47_50_+1000_djFlXtAFhPZ80++h
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

After merging the final tree, yesterday's linux-next build (powerpc
mpc85xx_defconfig) failed like this:

http://kisskb.ellerman.id.au/kisskb/buildresult/2615202/

I suspect that is something to do with the devicetree tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__18_May_2010_17_47_50_+1000_djFlXtAFhPZ80++h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvyRiYACgkQjjKRsyhoI8xvkQCghi9gdTh+SDLARj1wIlMp/pHU
XSAAoIxsE0TH6yXm95ClVR2Nvg5iU/kf
=qxmX
-----END PGP SIGNATURE-----

--Signature=_Tue__18_May_2010_17_47_50_+1000_djFlXtAFhPZ80++h--
