From: Gregory Haskins <gregory.haskins@gmail.com>
Subject: Re: linux-next: Tree for October 30
Date: Fri, 30 Oct 2009 11:30:23 -0400
Message-ID: <4AEB068F.3020607@gmail.com>
References: <20091030200916.e9331f66.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigA3DD6397EDCD54BF79A446B7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.25]:36565 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932376AbZJ3Pac (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Oct 2009 11:30:32 -0400
In-Reply-To: <20091030200916.e9331f66.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigA3DD6397EDCD54BF79A446B7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Stephen

Stephen Rothwell wrote:
> Hi all,
>=20
> Changes since 20091029:
>=20

< snip >

> Merging alacrity/linux-next
> CONFLICT (content): Merge conflict in drivers/net/Kconfig
> CONFLICT (content): Merge conflict in lib/Kconfig

So I've noticed this error in your reports for a while now, but I wasn't
quite sure if there was an action-item for me to address it.

Considering no one is complaining that the tree is broken, I assume
these kinds of conflicts are automatically resolved, but I am wondering
if there are steps I should take to prevent the conflict in the future?

Kind Regards,
-Greg



--------------enigA3DD6397EDCD54BF79A446B7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.11 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkrrBo8ACgkQP5K2CMvXmqF2mgCaAyYKXqwliMbLSB14lm/H9nBo
b0wAn33uwQvcRM6QKTlhtsGA8dkOlp4J
=BKJP
-----END PGP SIGNATURE-----

--------------enigA3DD6397EDCD54BF79A446B7--
