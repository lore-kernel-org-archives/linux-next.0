From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tracing tree build failure
Date: Thu, 26 Mar 2009 12:14:59 +1100
Message-ID: <20090326121459.197d346a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Mar_2009_12_14_59_+1100_IETNJoh_FalgLtq/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60785 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752280AbZCZBPM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Mar 2009 21:15:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Masami Hiramatsu <mhiramat@redhat.com>

--Signature=_Thu__26_Mar_2009_12_14_59_+1100_IETNJoh_FalgLtq/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/kernel/kprobes.c: In function 'trampoline_handler':
arch/x86/kernel/kprobes.c:697: error: 'struct pt_regs' has no member named =
'gs'

Caused by commit b9dad0d2955db059cd92c81c37ddcbef0abc8bf8 ("x86:
kretprobe-booster interrupt emulation code fix").  64bit appears to not
have a gs in its pt_regs.

I have used the version of this tree that was in next-20090325 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Mar_2009_12_14_59_+1100_IETNJoh_FalgLtq/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknK1xMACgkQjjKRsyhoI8wnMQCfRO0cahJCFWeAsg74BwTdKARV
p3YAn2/L2AJePM5j+SIQnrTLaVXxNhP5
=BXLX
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Mar_2009_12_14_59_+1100_IETNJoh_FalgLtq/--
