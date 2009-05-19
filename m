From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cputime tree build warning
Date: Tue, 19 May 2009 17:32:51 +1000
Message-ID: <20090519173251.86d755c8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__19_May_2009_17_32_51_+1000_aJd4GEceD9IOzlcX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32974 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753647AbZESHc4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 May 2009 03:32:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Abbott <michael.abbott@diamond.ac.uk>

--Signature=_Tue__19_May_2009_17_32_51_+1000_aJd4GEceD9IOzlcX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

fs/proc/uptime.c: In function 'uptime_proc_show':
fs/proc/uptime.c:14: warning: unused variable 'len'

Introduced by commit ed7e789abfc433e46524419b7cc51d949552505e ("[PATCH]
Fix idle time field in /proc/uptime") from the cputime tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__19_May_2009_17_32_51_+1000_aJd4GEceD9IOzlcX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoSYKMACgkQjjKRsyhoI8z1TACfUmNv1zN1Q73F/RlPOnPwfFBM
3lcAnRcMXAnnIx1B43DUtQCTXjtGFCvt
=CUUK
-----END PGP SIGNATURE-----

--Signature=_Tue__19_May_2009_17_32_51_+1000_aJd4GEceD9IOzlcX--
