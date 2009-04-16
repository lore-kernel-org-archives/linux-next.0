From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with Linus' tree
Date: Thu, 16 Apr 2009 12:19:32 +1000
Message-ID: <20090416121932.ed354c47.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__16_Apr_2009_12_19_32_+1000_7KcYTGSazXdPd+Up"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54378 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755412AbZDPCTj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Apr 2009 22:19:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>

--Signature=_Thu__16_Apr_2009_12_19_32_+1000_7KcYTGSazXdPd+Up
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c between various commits from
Linus' tree and commit cf2fb1659cb6d1269487f3c9870f045b95e5e3a2 ("use
smp_call_function_single() in
arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c") from the rr tree.

I used the version from Linus' tree.  The only doubt in my mind is that
the test of the return from smp_call_function_single in
get_measured_perf is inverted between the two trees. i.e.

	if (smp_...

vs

	if (!smp_...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__16_Apr_2009_12_19_32_+1000_7KcYTGSazXdPd+Up
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknmlbQACgkQjjKRsyhoI8yUXQCeNmoeqSBaRXWFOBkY21ew2sMg
KgEAn36uaC4k5c6RdQMsm9R32OaGZm1H
=NkyO
-----END PGP SIGNATURE-----

--Signature=_Thu__16_Apr_2009_12_19_32_+1000_7KcYTGSazXdPd+Up--
