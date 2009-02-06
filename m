From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: security-testing tree build failure
Date: Fri, 6 Feb 2009 18:28:31 +1100
Message-ID: <20090206182831.c18a56a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Feb_2009_18_28_31_+1100_MMWVKgmHAZIkZL1U"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56846 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751622AbZBFH2h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Feb 2009 02:28:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, Mimi Zohar <zohar@linux.vnet.ibm.com>

--Signature=_Fri__6_Feb_2009_18_28_31_+1100_MMWVKgmHAZIkZL1U
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/namei.c: In function 'may_open':
fs/namei.c:1516: error: 'nd' undeclared (first use in this function)

Caused by commit 6146f0d5e47ca4047ffded0fb79b6c25359b386c ("integrity:
IMA hooks").

The "nd" parameter to may_open() was removed in commit
3fb64190aa3c23c10e6e9fd0124ac030115c99bf ("pass a struct path * to
may_open") before 2.6.29-rc1.

I have dropped the security-testing tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Feb_2009_18_28_31_+1100_MMWVKgmHAZIkZL1U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmL5p8ACgkQjjKRsyhoI8z0GwCgh1yofTsW+D0ESogljlWTbFI8
ZsIAoIP3/bLhLESnWXOkbuxUS8P+ryk2
=XZAc
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Feb_2009_18_28_31_+1100_MMWVKgmHAZIkZL1U--
