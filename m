From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the idle tree with the pm tree
Date: Tue, 14 Apr 2015 12:47:09 +1000
Message-ID: <20150414124709.5f981d3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/R75yz7NvQ/VA+OLEs7ruwVh"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36893 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751717AbbDNCrQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 22:47:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrey Semin <andrey.semin@intel.com>

--Sig_/R75yz7NvQ/VA+OLEs7ruwVh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the idle tree got a conflict in
tools/power/x86/turbostat/turbostat.c between commits from the pm tree
and similar commits from the idle tree.

There seem to be two differnet version of these patches, so I just
dropped the idle tree for today, please sort this out.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/R75yz7NvQ/VA+OLEs7ruwVh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLH+yAAoJEMDTa8Ir7ZwVRMkP/jcE3n18CX0LjD7UZL9Ie9SG
pPz62y8F7vLTNdmH0+m3+7qOxLBbZ6BWmcEqkSZxz1DH/+GrIRVRskWWWV/YLBGG
DvFDGPEtmQWSozRv7363AUvO7wxQCkOdeYR9OOrHL6wVHulhXWGFWLuCrLYo/0Z1
rt4BIQl1MKm4ko6fXsLU0Xgph/PfXx78DK10MscJlDDbfAsCA7H6YUagP7MvPZqy
LCZL7yIRR8959HW7SQFDsCsYpZ9cx2dTQYbVe8g+/PbSgZ1vSz5cjGmSAt++p1bZ
ktocyiDZHKtwyBczUEfGHQ43ysMLbT37MKYnva7pkcynPwlISswWpAjriQFAbYZ1
P2GZsFpT7Nm/F6wEFhI824s2upcbZJefWKVW4h2I0kcMzduHGi2Q+At50KMfveSj
AniClqiW+qrbNggFSnbR8YkpHfn6SOzvaodxfqnGB+wza0yJQhJ/4WBl+4FttQ2H
HJekSw9UEyiftx3BdkcC9R5xM0ueynWE1O5o8dL2joBSrj62U5j6tWTW8+RtR8Do
pkKBWpjggxc40LxdgqKmozXMe18W+hbHLIKncbYhtazDw7uzIMdAofieRpmEeeAq
DuR9hQal+bUXO0nQ8hGiDWTXIcN4vif8a5MIPD02pBOgZtHfwYl50CEWm7tw+mV9
W7wWDw4qoteYgYIJZe+m
=XiqU
-----END PGP SIGNATURE-----

--Sig_/R75yz7NvQ/VA+OLEs7ruwVh--
