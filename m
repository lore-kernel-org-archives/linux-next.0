From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Date: Wed, 8 Apr 2015 18:49:54 +1000
Message-ID: <20150408184954.1356280d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//0FGP1gOFU/SsyJ7fKI3Kk_"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54038 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751420AbbDHIuC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Apr 2015 04:50:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>

--Sig_//0FGP1gOFU/SsyJ7fKI3Kk_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in
arch/x86/kernel/cpu/common.c between commit 6b51311c9765
("x86/asm/entry/64: Use a define for an invalid segment selector") from
the tip tree and commit f28c11e4b695 ("arch/x86/kernel/cpu/common.c:
fix warning") from the akpm tree.

I fixed it up (I just used the tip tree version) and can carry the fix
as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_//0FGP1gOFU/SsyJ7fKI3Kk_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJOu4AAoJEMDTa8Ir7ZwV8tsP/3Mgq8N6qcHOfCjNSVaBVsxO
bCVVnmdfRXWJWnRWx50oW6AsGrsEvi9eHrJKRNeqeWi8Q/zwNK9TLvCUryBSkSiN
F5yrV5VadT+iZMb3GFljIMRaVBabpaZDPX02hYfFJ6a+Jdj5scu9rNUWUZ7rIQe8
g/hgDlnUIfCRxpmZx4GrybLvpdMCktsWeP1ZFgbeQyL6zBv3fVbehoIJPjd+a65a
A8PJfpTUUCbvlvPvTidFJBDA93tKLmLw7/R0o6ZxWITHV+eA33h1baYgDk2RGOvu
/zAlOgsZtqYvOwx0GfqAfHoqk+MQS8RkCbXnOMDksHBMnLhgsEQJHaaw7oc/tYQ7
hcSZ/1dYB1N3MTCNbdOsyMnJ9gOrOJhc8XB/r9NNLdI/3nuqAKZlMtCSTs6ysEkH
1lay0FDDbtNBIYE9q9U0b0JTyXT9gZ5wxte2LGcSXTLg4QdNI0e7TQ31IVePnmrn
ERKp847VNA4ubxr18m3uqnP6CckRaj6a4wJe+bseUg7ilnxTaDzjsp2b4dDSaEzr
XTEcmvhe/llG4kovruwWLuOXkrmAerzU9qyAYz/4mqu0sWH6a+AnRYlmltwvWr9e
w+GwbkrntYBs2M/7aAgkEIgMO3F4HekHzJm7MJT0zQzAjpLM+zx/2/G9o5p3ZiR6
o5CUATgQJuxHkbOuhcWY
=w6Kx
-----END PGP SIGNATURE-----

--Sig_//0FGP1gOFU/SsyJ7fKI3Kk_--
