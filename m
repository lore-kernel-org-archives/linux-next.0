From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  build warning
Date: Fri, 19 Sep 2008 07:17:58 +1000
Message-ID: <20080919071758.b4ddf90d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__19_Sep_2008_07_17_58_+1000_O6KIGyRZvE7bvbDQ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34595 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754195AbYIRVSO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Sep 2008 17:18:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>

--Signature=_Fri__19_Sep_2008_07_17_58_+1000_O6KIGyRZvE7bvbDQ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

In file included from kernel/trace/trace_stack.c:6:
include/linux/stacktrace.h:13: warning: 'struct task_struct' declared insid=
e parameter list
include/linux/stacktrace.h:13: warning: its scope is only this definition o=
r declaration, which is probably not what you want

I just noticed this in passing.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__19_Sep_2008_07_17_58_+1000_O6KIGyRZvE7bvbDQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjSxYYACgkQjjKRsyhoI8z2zQCfYHCObNVOHjuLO5hWrY4QJnxg
VB0AoJ+b4XrlyILCzKa3m7KMwAMsTJae
=vA18
-----END PGP SIGNATURE-----

--Signature=_Fri__19_Sep_2008_07_17_58_+1000_O6KIGyRZvE7bvbDQ--
