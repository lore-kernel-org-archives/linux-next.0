From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc build failure
Date: Mon, 12 May 2008 17:36:58 +1000
Message-ID: <20080512173658.01dc993f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__12_May_2008_17_36_58_+1000_grXpRk/SNTJKYP1R"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34129 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755553AbYELHhN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 May 2008 03:37:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__12_May_2008_17_36_58_+1000_grXpRk/SNTJKYP1R
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (sparc allmodconfig) fails like this:

In file included from include2/asm/sigcontext.h:6,
                 from include2/asm/signal.h:5,
                 from include/linux/signal.h:4,
                 from fs/ocfs2/dlm/userdlm.c:30:
include2/asm/ptrace.h:42: error: syntax error before "pt_regs_is_syscall"
include2/asm/ptrace.h:43: warning: return type defaults to `int'
include2/asm/ptrace.h:47: error: syntax error before "pt_regs_clear_syscall"
include2/asm/ptrace.h:48: warning: return type defaults to `int'

In file included from include2/asm/sigcontext.h:6,
                 from include2/asm/signal.h:5,
                 from include/linux/signal.h:4,
                 from drivers/net/usb/rtl8150.c:10:
include2/asm/ptrace.h:42: error: syntax error before "pt_regs_is_syscall"
include2/asm/ptrace.h:43: warning: return type defaults to `int'
include2/asm/ptrace.h:47: error: syntax error before "pt_regs_clear_syscall"
include2/asm/ptrace.h:48: warning: return type defaults to `int'

Seems to have been introduced by commit
28e6103665301ce60634e8a77f0b657c6cc099de ("sparc: Fix debugger syscall
restart interactions") which went into Linus' tree recently ("bool" seems
to be missing a definition).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__12_May_2008_17_36_58_+1000_grXpRk/SNTJKYP1R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIJ/OhTgG2atn1QN8RAi3SAJ9IG4sfSPRZsqPLu3fnAO9uXhABBwCfWVFo
Xk/t6c69CfFMjfm7DmDB3lQ=
=CpyO
-----END PGP SIGNATURE-----

--Signature=_Mon__12_May_2008_17_36_58_+1000_grXpRk/SNTJKYP1R--
