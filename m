From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with Linus' tree
Date: Fri, 8 Apr 2011 15:47:56 +1000
Message-ID: <20110408154756.538a59f2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__8_Apr_2011_15_47_56_+1000_KGDfvdzRyPpFTWOh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49313 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751910Ab1DHFsG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Apr 2011 01:48:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Roland Vossen <rvossen@broadcom.com>

--Signature=_Fri__8_Apr_2011_15_47_56_+1000_KGDfvdzRyPpFTWOh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/brcm80211/README between commit 25985edcedea ("Fix common
misspellings") from Linus' tree and commit 4a266c4fc99d ("staging:
brcm80211: moved several README items to website") from the staging tree.

The latter removed the text that the former fixed up, so I did that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__8_Apr_2011_15_47_56_+1000_KGDfvdzRyPpFTWOh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNnqGMAAoJEDMEi1NhKgbsR+wH/2tV+bDYHtv3ImyZ1yh/rFwV
ZEkvBfyNe6f2xuWts5rs5xAcY7okEN7fKHyfcwIwk5A4ok7DWXAnMc5jJWoc6VB0
EmHfz6Q/lOvFTzZd/A8HD+Z7fBpk6ADeotWACnSnjpgvjnNblzaiLM77CW/m0VFe
MD+auSVRcpOOVSuC4lB9Cdr/AMf4n4UIWCBRbbwSxS4z1UjvDgDdkROBRyRrQJg7
UAF1EXl5Blu9beai4IXHQ2xrqi2b/6sQNpXwkMLH5z5oMOLy6+bdX2AGmBbrCtpD
SMC5TdLsG7hop9sbrVA7aZRNw4/ca6b+LcKU13LewSCv7ybn7b6M4grEaPz6gtE=
=uLLd
-----END PGP SIGNATURE-----

--Signature=_Fri__8_Apr_2011_15_47_56_+1000_KGDfvdzRyPpFTWOh--
