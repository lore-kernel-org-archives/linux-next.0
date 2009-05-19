From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: edac-amd tree build failure
Date: Tue, 19 May 2009 17:18:39 +1000
Message-ID: <20090519171839.19702b81.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__19_May_2009_17_18_39_+1000_jUzYDWIvNtqvfDfU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52631 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752538AbZESHSs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 May 2009 03:18:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <borislav.petkov@amd.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__19_May_2009_17_18_39_+1000_jUzYDWIvNtqvfDfU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Boris,

Today's linux-next build (x86_64 allmodconfig) failed like this:

usr/include/asm/msr.h:5: included file 'asm-x86/cpumask.h' is not exported

Caused by commit 32b946f3cb8b1c5563dc9525fda85049ea26d1ad ("x86: add
methods for writing of an MSR on several CPUs").

I have dropped the edac-amd tree for today since I have no previous
version to go back to.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__19_May_2009_17_18_39_+1000_jUzYDWIvNtqvfDfU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoSXU8ACgkQjjKRsyhoI8yuGgCfUwvpqm78JNqDBnuzk4ly3YTF
qGsAmwQ/byUYMbuao8c3+qwhhzS3ZxUB
=qtoY
-----END PGP SIGNATURE-----

--Signature=_Tue__19_May_2009_17_18_39_+1000_jUzYDWIvNtqvfDfU--
