From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure in Linus' tree
Date: Fri, 18 Mar 2011 10:29:50 +1100
Message-ID: <20110318102950.aee6f0bb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Mar_2011_10_29_50_+1100_Cp1WyAFqpy2zoYUy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33936 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754590Ab1CQXaI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Mar 2011 19:30:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Luck <tony.luck@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>

--Signature=_Fri__18_Mar_2011_10_29_50_+1100_Cp1WyAFqpy2zoYUy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the Linus' tree, today's linux-next build (x86_64 allmodconfi=
g)
failed like this:

fs/pstore/inode.c:253: error: unknown field 'get_sb' specified in initializ=
er
fs/pstore/inode.c:253: warning: initialization makes integer from pointer w=
ithout a cast

Caused by commit ca01d6dd2d7a ("pstore: new filesystem interface to
platform persistent storage") interacting with commit 1a102ff92579 ("vfs:
bury ->get_sb()"). (I guess it would have been helpful if that latter
commit had hit linux-next ...)

I have reverted the merge commit afe997a183ec ("Pull pstorev4 into
release branch") for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Mar_2011_10_29_50_+1100_Cp1WyAFqpy2zoYUy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNgpluAAoJEDMEi1NhKgbsalIIAIIskOJn2yrXkmdqJhcNsvZN
SRJgp+PbGpMy4eIoBou8Lmuml5HLpv09z0KdCn6hD8nYaJSMxhEajkVefHIJqxsP
1qMnYBwo8c2EAFyh5hmwtly2cgYXbWAb5UOQU2kwv273PrJI4dhUbQraN/F6e1dc
dr+sXIviRrJvJLXtscFIT6uMiX6m2K9gyp3alkr8fhe0R1oWPoRejx9tghHk7/8W
yommUqlzVGn4GQLdU0PCCEhrgw+EAFytsYAq2ApwI0Zj0OQJ5egClfthw+C0ExAl
zmF7cjLmdVFQXJShj6jkvNDRaZf6yyy70TlKO9ty9bFNyiQXQ+LH5Qw+mXvUvQE=
=+ibH
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Mar_2011_10_29_50_+1100_Cp1WyAFqpy2zoYUy--
