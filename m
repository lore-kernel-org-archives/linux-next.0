From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: upstream tree build warning
Date: Tue, 28 Apr 2009 13:03:54 +1000
Message-ID: <20090428130354.cbb6ed7d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Apr_2009_13_03_54_+1000_wLzGaKuBpb1QB4eu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56936 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752191AbZD1DEH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Apr 2009 23:04:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__28_Apr_2009_13_03_54_+1000_wLzGaKuBpb1QB4eu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc ppc64_defconfig gcc4.4.0) produced this
warning (it has for a while):

drivers/scsi/st.c: In function 'st_int_ioctl':
drivers/scsi/st.c:2967: warning: suggest parentheses around operand of '!' =
or change '|' to '||' or '!' to '~'

The code in question:

	STp->use_pf =3D !STp->use_pf | PF_TESTED;

looks questionable at best.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Apr_2009_13_03_54_+1000_wLzGaKuBpb1QB4eu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn2choACgkQjjKRsyhoI8yoQACdEvZzlzeL+yJHEC5tTGIytlSh
77sAn04czjTAJ8pXBByzWYI/8wFxk/YZ
=m4e2
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Apr_2009_13_03_54_+1000_wLzGaKuBpb1QB4eu--
