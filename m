From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr quilt series import failure
Date: Tue, 17 Mar 2009 09:59:24 +1100
Message-ID: <20090317095924.656f7e05.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Mar_2009_09_59_24_+1100_WkvNVvttOw_Pf6wD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48748 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751918AbZCPW7b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 18:59:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__17_Mar_2009_09_59_24_+1100_WkvNVvttOw_Pf6wD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next import of the rr quilt series failed like this:

cpumask:smp_call_function-in-powerpc-sysfs.patch
error: patch failed: arch/powerpc/kernel/sysfs.c:135
error: arch/powerpc/kernel/sysfs.c: patch does not apply

I will use yesterday's tree (with its warnings :-().

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Mar_2009_09_59_24_+1100_WkvNVvttOw_Pf6wD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm+2cwACgkQjjKRsyhoI8xREACgqqoWM04Gn/FFL6567oZxirIQ
rLMAn0W2u7e/B4HL8xi3EWEaVsHgLUdk
=blBy
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Mar_2009_09_59_24_+1100_WkvNVvttOw_Pf6wD--
