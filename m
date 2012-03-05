From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad merge in the moduleh tree
Date: Tue, 6 Mar 2012 10:57:49 +1100
Message-ID: <20120306105749.4eb0fcccacfe9352e8042f06@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__6_Mar_2012_10_57_49_+1100_ptMBkFAm6h1TuYkE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:57867 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757953Ab2CEX6B (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Mar 2012 18:58:01 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__6_Mar_2012_10_57_49_+1100_ptMBkFAm6h1TuYkE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

I noticed this merge in the moduleh tree:

dc69707e944e "Merge branch 'module-3.4' into for-sfr"

This merge result in multplie includes of kernel.h in lib/average.c and
lib/list_debug.c.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__6_Mar_2012_10_57_49_+1100_ptMBkFAm6h1TuYkE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPVVL9AAoJEECxmPOUX5FEHmoP/iBAjhwXXM42IQTIAoWTWnkJ
P7s0j/6E+wyLkesf9kQGUGwFDFCrm0nErn+8B30wYw30CpCwMg9hx++vCrWaPAra
D4yhtsAAhO/PCAGIwwz1zXIbXBU+lMFoHjF/bzgwbw64GTW8HjFZT1loRI9KZY9g
S7OOMD8bV6EDHprz/yrp4idQHSFSgZFfGKpEQVEoThzbYJgE2fTLhM5oRWfiLzlK
J9YYB5mBJMokEVnsH9ilgbTWPW+WU2g3vL93nVaEhXrroe/Rw5yFNcL7M1LV46Wg
iqmPmDis6O5jnN4Ik2WpcImblFppOs6gQTfWnEo/B0CQyisswzOJnvt7cpLSrVSv
TJZkPOosEE7j9/nUT3fipPlS5eGl1r2IxgvRxZFmSgfM9mVsY847OywGXuKXw665
S/CqyTi1ReoksDqk3uZiF1uUi1UJblcaDVNeo1/xfB0ccsTiJbZblauQinNyeHg2
/lB6UWpKW+23suqsUZTxZiSqTOrFQoAS6njodmG9CsQ+oMD6oFK6zeOxq56S49HO
sHXqVuzcuV/1mJihYcCaSWxspbQuGhSw7szzONE3BnaI9Z08RAp/6kZGKxAcNzej
6SMRo1PKeqFsBqDgH9CzgFvActIU5kkM6MxSNwizLlkzGyNZTHkvleUrKIouLfMC
GLfj70Sj17Ne+9xq/zwE
=xOfv
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Mar_2012_10_57_49_+1100_ptMBkFAm6h1TuYkE--
