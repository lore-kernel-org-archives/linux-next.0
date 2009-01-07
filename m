From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Wed, 7 Jan 2009 14:04:37 +1100
Message-ID: <20090107140437.fd4dce14.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__7_Jan_2009_14_04_37_+1100_RVZqwI++SbzvC1UY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43405 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751121AbZAGDEq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 22:04:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__7_Jan_2009_14_04_37_+1100_RVZqwI++SbzvC1UY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/kernel/dumpstack_64.c: In function 'in_exception_stack':
arch/x86/kernel/dumpstack_64.c:43: error: 'orig_ist' undeclared (first use =
in this function)
arch/x86/kernel/dumpstack_64.c:43: warning: type defaults to 'int' in decla=
ration of 'type name'
arch/x86/kernel/dumpstack_64.c:43: warning: type defaults to 'int' in decla=
ration of 'type name'
arch/x86/kernel/dumpstack_64.c:43: warning: cast to pointer from integer of=
 different size
arch/x86/kernel/dumpstack_64.c:43: error: request for member 'ist' in somet=
hing not a structure or union

per_cpu() strikes again :-(

I have dropped the rr tree again.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__7_Jan_2009_14_04_37_+1100_RVZqwI++SbzvC1UY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklkG8UACgkQjjKRsyhoI8wwPgCgvXe6nzSsedRaaDYwlf82AFfO
OOYAnAsWSWG1q8bqSAeYvdHE3Ohq+pAi
=JCbd
-----END PGP SIGNATURE-----

--Signature=_Wed__7_Jan_2009_14_04_37_+1100_RVZqwI++SbzvC1UY--
