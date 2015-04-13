From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the xen-tip tree
Date: Mon, 13 Apr 2015 18:09:02 +1000
Message-ID: <20150413180902.59d8e9bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qu0LfPnCOeKDp8YVV=AX6ey"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51128 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752382AbbDMIJL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 04:09:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Liu <wei.liu2@citrix.com>, David Vrabel <david.vrabel@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Bob Liu <bob.liu@oracle.com>

--Sig_/qu0LfPnCOeKDp8YVV=AX6ey
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xen-tip tree, today's linux-next build (x86_64 allmodconf=
ig)
failed like this:

drivers/char/tpm/xen-tpmfront.c: In function 'setup_ring':
drivers/char/tpm/xen-tpmfront.c:203:7: warning: passing argument 2 of 'xenb=
us_grant_ring' makes pointer from integer without a cast
  rv =3D xenbus_grant_ring(dev, virt_to_mfn(priv->shr));
       ^
In file included from drivers/char/tpm/xen-tpmfront.c:17:0:
include/xen/xenbus.h:206:5: note: expected 'void *' but argument is of type=
 'long unsigned int'
 int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
     ^
drivers/char/tpm/xen-tpmfront.c:203:7: error: too few arguments to function=
 'xenbus_grant_ring'
  rv =3D xenbus_grant_ring(dev, virt_to_mfn(priv->shr));
       ^
In file included from drivers/char/tpm/xen-tpmfront.c:17:0:
include/xen/xenbus.h:206:5: note: declared here
 int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
     ^

Caused by commit 1b1586eeeb8c ("xenbus_client: Extend interface to
support multi-page ring").

I have used the xen-tip tree from next-20150410 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/qu0LfPnCOeKDp8YVV=AX6ey
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK3mjAAoJEMDTa8Ir7ZwV/gQP/06yqRqoFpAE/d7SCo/BkzjX
kUJEKtl1ewKozXrbP1LStw4knbfqKu70X/WQD8N8ZtBGNvgS/K6BMsgIIIvdVSO9
OukcjyB1FqndSfutRfaLkbq0dzmWl/MocdCMiYz0NdQB2Tic2y7XXAHnwna1zn6u
EQqHRKwu28q8WvvFe54O4iW4RNvfm/CJXXf50dd2XJaZ1+E+ie4Iae5yEMYTcOVI
9Uxl8VznqtzyzCsR1yHOMr0ecxJHjOyXSiTEO18D8yR1eG91eoTyA6z/PgClk63Y
UvICJEGG92Orkb7b+2ZaB7th8oz093LpZbXA5Kj0HDln0Zdb5owugz8zhf/dIuJv
lrrYvP23iCZ86aUdBwRtBgUCw2Uu0cQGEWMxlCENqOiNowNlbJLmHUceCXdyJMnD
Q4AZHksFAUoXRrhTnCLjVOIPLRuPLmRjMSlJYnKW37oosFMqSXwsw/jGAVzfqegX
dsr1wZwdlGxeceZ1sJ3O7CklBAljTDpUT0fkawReJ+ubv5nr8w/Bzssxjp7MKUOo
n3Jc4pNDIxHm254zuXLz3ugDLl2TZltjUOgZ/EXWXTEC/Tbh6NREXVqyniomFLMk
dvzMbObteYNBVmp+SlySmnFBakfFtZWtGB9Am4kmYlCnLdQ5D5/XcbduSlX+1Iu8
HI3OR+w1mmcuZOh1UJNF
=UQn3
-----END PGP SIGNATURE-----

--Sig_/qu0LfPnCOeKDp8YVV=AX6ey--
