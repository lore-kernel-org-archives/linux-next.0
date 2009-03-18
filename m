From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: acpi tree build failure
Date: Wed, 18 Mar 2009 11:57:13 +1100
Message-ID: <20090318115713.bafedc37.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__18_Mar_2009_11_57_13_+1100_vO7hP2zt9d6y4KSt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42023 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752479AbZCRA5i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Mar 2009 20:57:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Bob Moore <robert.moore@intel.com>, Lin Ming <ming.m.lin@intel.com>, linux-acpi@vger.kernel.org

--Signature=_Wed__18_Mar_2009_11_57_13_+1100_vO7hP2zt9d6y4KSt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's (and several previous day's) linux-next build (i386 allmodconfig)
failed like this:

arch/x86/kernel/cpu/cpufreq/longhaul.c: In function 'longhaul_setstate':
arch/x86/kernel/cpu/cpufreq/longhaul.c:308: error: implicit declaration of =
function 'acpi_set_register'

(http://kisskb.ellerman.id.au/kisskb/target/421/)

Caused by commit e2f34512879026beb26827c14b1d1e67c07f2858 ("ACPICA:
Rename ACPI bit register access functions").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__18_Mar_2009_11_57_13_+1100_vO7hP2zt9d6y4KSt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknARukACgkQjjKRsyhoI8z28gCfTi0EsT3DCFtpmxhN8p5ZeWJ/
aNgAoK9TRgWOE2bMjlQOyQUs45oupT1O
=BNZb
-----END PGP SIGNATURE-----

--Signature=_Wed__18_Mar_2009_11_57_13_+1100_vO7hP2zt9d6y4KSt--
