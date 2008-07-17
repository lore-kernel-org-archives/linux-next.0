From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: x86 tree build failure
Date: Thu, 17 Jul 2008 12:07:54 +1000
Message-ID: <20080717120754.66b6c14c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Jul_2008_12_07_54_+1000_2MLGRco8IGs2BK9s"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40861 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751290AbYGQCIH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 22:08:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>

--Signature=_Thu__17_Jul_2008_12_07_54_+1000_2MLGRco8IGs2BK9s
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/kernel/syscall_64.c:27: error: array index in initializer exceeds =
array bounds
arch/x86/kernel/syscall_64.c:27: error: (near initialization for 'sys_call_=
table')
arch/x86/kernel/syscall_64.c:27: warning: excess elements in array initiali=
zer
arch/x86/kernel/syscall_64.c:27: warning: (near initialization for 'sys_cal=
l_table')

Reverting commit aa27f95867447916d97c7aa6e5422ff6518630dd ("x86:
consolidate header guards") makes it build ok.  I found that hard to
believe, so I undid the revert and it fails again.

gcc is x86_64-unknown-linux-gnu-gcc (GCC) 4.0.2 cross built on a powerpc ho=
st.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Jul_2008_12_07_54_+1000_2MLGRco8IGs2BK9s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh+qXoACgkQjjKRsyhoI8xJGwCgg47CtZixom5AvcIHAqK+GJ92
kmsAoKFQSSUBDde3/i3PJQ5Z5s7IRrqD
=FcJK
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Jul_2008_12_07_54_+1000_2MLGRco8IGs2BK9s--
