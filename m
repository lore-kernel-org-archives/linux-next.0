From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with the
 xen-tip tree
Date: Fri, 10 Apr 2015 18:48:54 +1000
Message-ID: <20150410184854.0b262379@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ELbUrqswHna0ofDImaK1fz5"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46896 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754304AbbDJItB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Apr 2015 04:49:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Tao Chen <boby.chen@huawei.com>, David Vrabel <david.vrabel@citrix.com>

--Sig_/ELbUrqswHna0ofDImaK1fz5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in
drivers/xen/xen-scsiback.c between commit 785748788baf ("xen-scsiback:
define a pr_fmt macro with xen-pvscsi") from the xen-tip tree and
commit b4dd93cb4409 ("target: simplify the target template registration
API") from the target-updates tree.

I fixed it up (the latter removed some of the code modified by the
former) and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/ELbUrqswHna0ofDImaK1fz5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJ457AAoJEMDTa8Ir7ZwVUT4P/2C0kFc8iYKgV3EIREIfvOeV
hV3XtToX6xDDTBCIUdTOnvJ3kLluE5vERSEK99EJgKMbNr3/QFteIKsIeWXWRyLE
0qz2jn6euMarY1MEOKZywk2EKecgv7Bc+Y0sPFyyhcjb1Ekzsd31GoREK0w0DZEz
c7ihcnC7Fyff45XHRTL0J7HSSdCRC4HETRzl0O1U77Uv0HGExOdLNDqzs4W2E1Bd
xOx0PtdsDerPYbDP4kFJKmX6boGOlJ27ZiATFaKNog0tG9+IGkkFDnVgYmcGQrmk
bBpswB5909qOLT76xZrAm9ghGXwGheYAOMxrs4xSs4Zoju/XT+mfSRaLhwHoSFaU
AQVlBzvti3r4A3IDznliuwKGDltn6c7aqci9ETi3tVrzE7BzhjWufxB0s0lu5/Uv
mSIYdP917Q02zy5rt4fVYiYLA0GPfVqfQab01qBfcJeQ3n8bQ07/WQo0I5VrkCIq
6ptB1d2Ob/ZC+HXdEDaWAN/MJmItlYr1RuxY+jLeYLKAYtmZIb3jWeez5XprkUal
wCH/9fRsPr5RavqaUUOtxec1CbAvJermJSAg9aAbaGeIyGLeZBWOHgD/ZwFNCiHW
fwyqC5SFfDCrS3Gk+VcxDFzPoR8qvjpxa/eZP+4OMJcsAA2+sEn9Oi0VJasBPMOO
6wEBJghwb9jKFrpOrUJs
=7hcv
-----END PGP SIGNATURE-----

--Sig_/ELbUrqswHna0ofDImaK1fz5--
