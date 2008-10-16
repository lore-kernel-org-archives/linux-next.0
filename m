From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad import of rr tree
Date: Fri, 17 Oct 2008 09:26:16 +1100
Message-ID: <20081017092616.f207ff3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__17_Oct_2008_09_26_16_+1100_2fVGth8jbNVm4noY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38191 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753325AbYJPW0Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 18:26:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__17_Oct_2008_09_26_16_+1100_2fVGth8jbNVm4noY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next import of the rr tree failed like this:

lguest:physical_address_extension_support.patch
Context reduced to (1/1) to apply fragment at 851
error: patch failed: drivers/lguest/page_tables.c:645
error: drivers/lguest/page_tables.c: patch does not apply

So that and the following patch
(lguest:page_size_extension_support.patch) did not get applied.  I hope
that still makes sense.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__17_Oct_2008_09_26_16_+1100_2fVGth8jbNVm4noY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj3v4gACgkQjjKRsyhoI8wSJwCdHEPTjHXT2X17fseZdyQdjUWs
HpUAnR5Zx1imiVUYq6qPrPrpqNbdJ5qC
=rUUU
-----END PGP SIGNATURE-----

--Signature=_Fri__17_Oct_2008_09_26_16_+1100_2fVGth8jbNVm4noY--
