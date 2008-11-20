From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the s390 tree
Date: Thu, 20 Nov 2008 22:57:26 +1100
Message-ID: <20081120225726.a344891d.sfr@canb.auug.org.au>
References: <20081120101309.0553d091.sfr@canb.auug.org.au>
	<1227179414.23671.1.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__20_Nov_2008_22_57_26_+1100_DepcZzTVPWDaX4J_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37419 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751310AbYKTL5n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 06:57:43 -0500
In-Reply-To: <1227179414.23671.1.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: schwidefsky@de.ibm.com
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, Paul Mackerras <paulus@samba.org>, Hendrik Brueckner <brueckner@linux.vnet.ibm.com>

--Signature=_Thu__20_Nov_2008_22_57_26_+1100_DepcZzTVPWDaX4J_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Thu, 20 Nov 2008 12:10:14 +0100 Martin Schwidefsky <schwidefsky@de.ibm.c=
om> wrote:
>
> On Thu, 2008-11-20 at 10:13 +1100, Stephen Rothwell wrote:
> > Just overlapping additions. I fixed it up (see below) and can carry the
> > fix.  The conflict could be eliminated by one of the two sets of changes
> > moving slightly in the files (I am hinting about the s390 ones here as
> > Paul does not like rebasing his tree ...).
>=20
> Ok, done. I moved the HCV_ICUV option before HVC_BEAT.

Thanks - just makes my life a little easier :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__20_Nov_2008_22_57_26_+1100_DepcZzTVPWDaX4J_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkklUKYACgkQjjKRsyhoI8wNOgCghfP1YBlTOl8whkj/YwxL5Lq0
p+sAoJf/jqgWPkcxZEHTxpLK3P+S39DM
=7hWE
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Nov_2008_22_57_26_+1100_DepcZzTVPWDaX4J_--
