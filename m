From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ftrace tree build failure
Date: Fri, 15 Aug 2008 12:27:43 +1000
Message-ID: <20080815122743.9715a5e1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_12_27_43_+1000_FomNS9ggHEqr3uSZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50984 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752403AbYHOC1w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 22:27:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

--Signature=_Fri__15_Aug_2008_12_27_43_+1000_FomNS9ggHEqr3uSZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

kernel/trace/ftrace.c: In function 'ftrace_record_ip':
kernel/trace/ftrace.c:345: error: implicit declaration of function 'in_nmi'

Caused by commit 431e94644bde07a327dea17ee9be297c3d44a876 ("ftrace: do
not trace NMI contexts").

in_nmi() is not defined as a function (or macro) anywhere in my kernel
tree, so I assume a patch was missed. More care, please.

I reverted the above commit.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_12_27_43_+1000_FomNS9ggHEqr3uSZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkik6Z8ACgkQjjKRsyhoI8x40gCePTjuiX/VT35J1ccys9ey5P8a
axEAn07MUr7RHOIFJ8dbVmzJQ3kRmedq
=qzbF
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_12_27_43_+1000_FomNS9ggHEqr3uSZ--
