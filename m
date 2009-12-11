From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tip tree build warning
Date: Fri, 11 Dec 2009 15:38:28 +1100
Message-ID: <20091211153828.6ba80bc4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__11_Dec_2009_15_38_28_+1100_TlUkrjYEk7ISW749"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60179 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1762420AbZLKEi3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Dec 2009 23:38:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>

--Signature=_Fri__11_Dec_2009_15_38_28_+1100_TlUkrjYEk7ISW749
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc allyesconfig) produced this warning:

In file included from kernel/trace/trace.h:14,
                 from kernel/trace/trace_selftest_dynamic.c:1:
include/linux/hw_breakpoint.h: In function 'modify_user_hw_breakpoint':
include/linux/hw_breakpoint.h:96: warning: return makes integer from pointe=
r without a cast

Introduced by commit 44234adcdce38f83c56e05f808ce656175b4beeb
("hw-breakpoints: Modify breakpoints without unregistering them") from
the tip tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__11_Dec_2009_15_38_28_+1100_TlUkrjYEk7ISW749
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkshzMQACgkQjjKRsyhoI8x1mgCfTGeYMKU68amkpuNHEX0UwDTf
8PEAniU+geOGaJpfosTCietByRtdOnuQ
=865L
-----END PGP SIGNATURE-----

--Signature=_Fri__11_Dec_2009_15_38_28_+1100_TlUkrjYEk7ISW749--
