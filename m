From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: add Docs git tree to linux-next
Date: Thu, 28 Apr 2011 16:25:41 +1000
Message-ID: <20110428162541.9812f16c.sfr@canb.auug.org.au>
References: <20110427200424.c1f0858f.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__28_Apr_2011_16_25_41_+1000_oCE_HjilOFAijw+S"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60138 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751758Ab1D1GZt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Apr 2011 02:25:49 -0400
In-Reply-To: <20110427200424.c1f0858f.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__28_Apr_2011_16_25_41_+1000_oCE_HjilOFAijw+S
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Wed, 27 Apr 2011 20:04:24 -0700 Randy Dunlap <rdunlap@xenotime.net> wrot=
e:
>
> Please add this git tree to linux-next:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/rdunlap/linux-docs/
> branch "docs-move"

Done.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Thu__28_Apr_2011_16_25_41_+1000_oCE_HjilOFAijw+S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNuQhlAAoJEDMEi1NhKgbsdOUH/0K6JYmKBjSyC+I+C/1+HDtg
+FrfNH7zqnur9vBnXME/p2HJEGYAQ+X/VwgBLN+jlDZ0BluuCyfA3OSUw1bLCG73
fIwYcdzt11acJH0j9COX6xO9WI90RLdO4dv3LauBJiVrsOzNd8e9vsqJvjPTtaxj
UvjbxM/dnJPLwNJ6EvA9TNOImqM8tpjHa2y95z9BZoAb9mo1WiCC/Nv9nsU4qLJb
IAxtvJPAVynd7pF5+O7afWWdrxd/+iu1JKW1NsnGEPGKrjxV9IGo5/WCIBPAKKpl
xNFARND42jQkueSMvtfGJ1y3+kueQQ6t6yLHSOsd4M+K0cDq23bVYuYkLWp9XG4=
=19kW
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Apr_2011_16_25_41_+1000_oCE_HjilOFAijw+S--
