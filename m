From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning in the origin tree
Date: Tue, 30 Jun 2015 13:50:09 +1000
Message-ID: <20150630135009.75cb607a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OKTJX/JrGqM/E7qs7.m0BmI"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34216 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752773AbbF3DuP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jun 2015 23:50:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Lameter <cl@linux.com>

--Sig_/OKTJX/JrGqM/E7qs7.m0BmI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Building the origin tree, today's linux-next build (powerpc allyesconfig)
produced this warning:

WARNING: mm/built-in.o(.text.unlikely+0xc22): Section mismatch in reference=
 from the function .new_kmalloc_cache() to the variable .init.rodata:kmallo=
c_info
The function .new_kmalloc_cache() references
the variable __initconst kmalloc_info.
This is often because .new_kmalloc_cache lacks a __initconst=20
annotation or the annotation of kmalloc_info is wrong.

Caused by commit a9730fca9946 ("Fix kmalloc slab creation sequence").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/OKTJX/JrGqM/E7qs7.m0BmI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVkhH1AAoJEMDTa8Ir7ZwVHjAP/09+qkP1Dxmu8MOg1sfjTP9T
qOEVjWJq4BJxKTMd69wI1dUg5G59hay3MgGx8V7pc9SzhdQAA6U0pRyXax8AXsG0
vIifpufpWW6bwSCyLJhxwoaDFWlC0PTZ3bQs8l6xU0uRpq+stiHChzGXcnMCXnF0
zCxC7TKZNZJtksSHuJNVCDCNg6LumzGtHs69IjS9SPGufB1OWfQ5ph7bFo9lcLe0
zQoIlAsooryQMeJAEovVpGYM/9KjpuTPxExBxRku3+1ptfVTwu7Ug3j1sdO9lae9
/G79qDSPgT8fENslMiHIw9iH2b8IMTBKSQpA8s/wEOcSLDbG7Crw5iaRnzSYY4wc
NZtog1XJcBPPbL8y+2AoSgankMunM2H+V1M4tjrNyfgbiLrOh8YGqH0/5dh8mS2u
Hj43UADnrx0YIECI94vKlE4NZ8ZzQbbf67wCzTTetsUNpX9hiwVtkbYRGcVqhNrQ
OcEnqGTtlx+0yXLohBpOGyV0RHb2vSRTH/BgG4eorIC9y9ygVe6GuQW0KBLSWvFC
ufjBa3QyRSW7fPjnrNjZFOFvO4lPuGT7K/ABpO91jgHElfqaNsu0bBxLDwFa4rUY
GNz8eU19DdtuyjN5l9jKJbsVcp7GoojDln3l34Qdnp1Mx9NNzJiQ/7lGazuzw4Ie
gdJfzOjen+055iHd9RJj
=jY7v
-----END PGP SIGNATURE-----

--Sig_/OKTJX/JrGqM/E7qs7.m0BmI--
