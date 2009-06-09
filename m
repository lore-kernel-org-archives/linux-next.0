From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Tue, 9 Jun 2009 20:12:05 +1000
Message-ID: <20090609201205.2894522c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Jun_2009_20_12_05_+1000_BfWafi1uQ._Kfwo+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47576 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751013AbZFIKMK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 06:12:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__9_Jun_2009_20_12_05_+1000_BfWafi1uQ._Kfwo+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc allnoconfig) failed like this:

lib/extable.c: In function 'trim_init_extable':
lib/extable.c:50: error: dereferencing pointer to incomplete type
lib/extable.c:50: error: implicit declaration of function 'within_module_in=
it'
lib/extable.c:50: error: dereferencing pointer to incomplete type
lib/extable.c:51: error: dereferencing pointer to incomplete type
lib/extable.c:52: error: dereferencing pointer to incomplete type
lib/extable.c:55: error: dereferencing pointer to incomplete type
lib/extable.c:56: error: dereferencing pointer to incomplete type
lib/extable.c:56: error: dereferencing pointer to incomplete type
lib/extable.c:57: error: dereferencing pointer to incomplete type

Caused by commit 07c674557e43c27d4e7243a35b9ea030b09e3c3d ("module: trim
exception table on init free") which I have reverted for today.

This is a build without CONFIG_MODULE.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Jun_2009_20_12_05_+1000_BfWafi1uQ._Kfwo+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkouNXUACgkQjjKRsyhoI8z7NQCgglO7U2BdtFkTsaUFkLLPVOCS
PdcAnR/3Cr8j2m5UOvCfpihBfrEZoJ4v
=wo+k
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Jun_2009_20_12_05_+1000_BfWafi1uQ._Kfwo+--
