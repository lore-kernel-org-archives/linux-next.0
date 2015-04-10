From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the arm-current tree
Date: Fri, 10 Apr 2015 10:29:33 +1000
Message-ID: <20150410102933.0a79020d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/weonzGW+AEwk0Pc.MgaoKRI"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41823 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753043AbbDJA3n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Apr 2015 20:29:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>

--Sig_/weonzGW+AEwk0Pc.MgaoKRI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Russell,

After merging the arm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/mm/proc-v7.S: Assembler messages:
arch/arm/mm/proc-v7.S:535: Error: invalid operands (*ABS* and .text section=
s) for `|'
arch/arm/mm/proc-v7.S:535: Error: invalid operands (*ABS* and .text section=
s) for `|'

Caused by commit f2fd12256533 ("ARM: proc-v7: avoid errata 430973
workaround for non-Cortex A8 CPUs").

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/weonzGW+AEwk0Pc.MgaoKRI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJxl1AAoJEMDTa8Ir7ZwVclsP/R1h/vPVpbISVIZipvVyuf4N
8Dbw1EyjIECicXM2GxItJIGSFCTOcv1tjqdh91V1stAj35GXCV6yjtE+r5XyPXjF
h2yJTirfO1vciiPqU1Gcy77PFJbqTsrq39FIJEZm4QaXhdhesfRBGluVvzgvUBNx
GsCulH9nMiXKplZSYa7oHBtZNTU1+lmriiHEQMSpmJO94ZIxT4BcRr8FWCHgI662
xK7QiHttID6saYiykckkHbv+nSseHxh7mlb+37apDU0URrCMWH8xlnvtHOpkNBSZ
wBsz5muVqEqDZlbznOIcZfcsYXe32Udgj3c9ykiui+aiPXpNmCEC/+UtkxEyaqUU
myYdwjdXWEy6UKQCXQih/dAIB9YgE3iGz84ZQLqg9hKp6ahvEBYMrDRN2L4FV1eA
UfOPFJUhUXWtKvNVUyqhJYDE3E3pdvm4kgBQCMXXavGQomBHAgU/p/WAKOFY/LLh
XcL/HtQKXYSL0CqMVKRT5OGcO87WCRI1nyyTP6wt7HwvlXvr1fCRJx4zIMjqCM+k
G6kmJZUZUKV6lQ8oM5LmHTt6UmZgHYKUljnq3ij0RGhP3eB3rt6t7KCg0SRXa3MI
rqVsfJVmGdjpVoozm0zhSG2jKjNkovxR+xv45de3qyLEr/WPKT8e9pgGgZeCrGLc
6GwXqwuGinE+RaJWLslu
=5hw2
-----END PGP SIGNATURE-----

--Sig_/weonzGW+AEwk0Pc.MgaoKRI--
