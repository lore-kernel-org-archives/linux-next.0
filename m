From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cpufreq tree build failure
Date: Tue, 20 Jan 2009 13:50:59 +1100
Message-ID: <20090120135059.6841cdc8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__20_Jan_2009_13_50_59_+1100_lrhpa7_I91o681.."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38113 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753534AbZATCvH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2009 21:51:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__20_Jan_2009_13_50_59_+1100_lrhpa7_I91o681..
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/kernel/cpu/cpufreq/powernow-k8.c: In function 'powernow_k8_cpu_ini=
t_acpi':
arch/x86/kernel/cpu/cpufreq/powernow-k8.c:836: error: 'space_id' undeclared=
 (first use in this function)

Immediate cause is commit 77a33c31a78c6cd11395c8b554152be684110e94
("[CPUFREQ] checkpatch cleanups for powernow-k8") which clearly wasn't
build tested.

I have dropped the cpufreq tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__20_Jan_2009_13_50_59_+1100_lrhpa7_I91o681..
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl1PBMACgkQjjKRsyhoI8ygeQCgkrUCgJV6Yn0CkWHNKHXwn2jO
IQMAmgPJ48O+nBDpkzvq9gr9Ot6kicAt
=SiDt
-----END PGP SIGNATURE-----

--Signature=_Tue__20_Jan_2009_13_50_59_+1100_lrhpa7_I91o681..--
