From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sched tree build warning
Date: Thu, 7 May 2009 11:21:14 +1000
Message-ID: <20090507112114.d6612ebe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__7_May_2009_11_21_14_+1000_nWsHlXhN0lh+ptkS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54260 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752863AbZEGBVT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 May 2009 21:21:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, David Rientjes <rientjes@google.com>

--Signature=_Thu__7_May_2009_11_21_14_+1000_nWsHlXhN0lh+ptkS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

kernel/sched.c: In function 'sched_show_task':
kernel/sched.c:6677: warning: format '%08x' expects type 'unsigned int', bu=
t argument 5 has type 'long unsigned int'

Introduced by commit 12b5c43486202dd4ff3cfd59a190984a0dd7f6fd ("sched:
emit thread info flags with stack trace") from the sched tree.

thread_info::flags is "unsigned long" on all architectures except alpha
(where it is "unsigned int"), ia64 and x86 (where it is "__u32").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__7_May_2009_11_21_14_+1000_nWsHlXhN0lh+ptkS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoCN4oACgkQjjKRsyhoI8wvngCeM32yCItkml3rwDFyR+3rpc+q
hMEAnArmyQjlTxCeJh4scs/ccoVlKMpp
=IeXt
-----END PGP SIGNATURE-----

--Signature=_Thu__7_May_2009_11_21_14_+1000_nWsHlXhN0lh+ptkS--
