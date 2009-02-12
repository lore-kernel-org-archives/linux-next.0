From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless tree build failure
Date: Thu, 12 Feb 2009 19:35:17 +1100
Message-ID: <20090212193517.3f393726.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Feb_2009_19_35_17_+1100_PzH=tfjWPWNON.Ve"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58043 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751004AbZBLIfY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Feb 2009 03:35:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, David Kilroy <kilroyd@googlemail.com>

--Signature=_Thu__12_Feb_2009_19_35_17_+1100_PzH=tfjWPWNON.Ve
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next build (powerpc allyesconfig) failed like this:

net/built-in.o: In function `michael_mic':
(.opd+0x3ba78): multiple definition of `michael_mic'
drivers/built-in.o:(.opd+0x552a8): first defined here
net/built-in.o: In function `michael_mic':
net/mac80211/michael.c:58: multiple definition of `.michael_mic'
drivers/built-in.o:drivers/net/wireless/orinoco/mic.c:49: first defined here

Immediate cause is commit 84875201dd1150dc2c16780b944fe501d588ffba
("orinoco: Move MIC helpers into new file").

I have reverted that commit (and several following ones that conflicted
with the revert - see below) for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

Created commit b6349c2: Revert "orinoco: Storage class should be before con=
st qualifier"
Created commit ed58c78: Revert "orinoco: hermes doesn't need to be a separa=
te module"
Created commit c52856e: Revert "orinoco: hermes_dld does not need to be a m=
odule"
Created commit ee9a469: Revert "orinoco: Move WEXT handlers into a separate=
 file"
Created commit e668502: Revert "orinoco: Move hardware functions into separ=
ate file"
Created commit d8d7390: Revert "orinoco: Add hardware function to set multi=
cast mode"
Created commit 6a4d487: Revert "orinoco: Use accessor functions for bitrate=
 tables"
Created commit ecac0c1: Revert "orinoco: Move firmware handling into a sepa=
rate file"
Created commit d2cf8c5: Revert "orinoco: Move MIC helpers into new file"

--Signature=_Thu__12_Feb_2009_19_35_17_+1100_PzH=tfjWPWNON.Ve
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmT30UACgkQjjKRsyhoI8wGfQCggngpeUnb7v2W0N2tmrYgY16e
S5wAn1b4n1tx+7S3PZXYR0u5cXpmIIsC
=xj+g
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Feb_2009_19_35_17_+1100_PzH=tfjWPWNON.Ve--
