From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Mon, 27 Jun 2011 14:22:53 +1000
Message-ID: <20110627142253.cc35bfbe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__27_Jun_2011_14_22_53_+1000_k0C6T8seJq+DJeIq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60025 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756059Ab1F0EXE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jun 2011 00:23:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__27_Jun_2011_14_22_53_+1000_k0C6T8seJq+DJeIq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

arch/x86/kernel/i8253.c: In function 'setup_pit_timer':
arch/x86/kernel/i8253.c:22:2: error: implicit declaration of function 'cloc=
kevent_i8253_init'
arch/x86/kernel/i8253.c:23:24: error: 'i8253_clockevent' undeclared (first =
use in this function)

Caused by commit 2739ce151665 ("x86: Use common i8253 clockevent").
clockevent_i8253_init() doesn't appear to be declared in any header file
even though it is introduced as a global function in commit 9f9119424bbc
("i8253: Create common clockevent implementation").  Similarly for
i8253_clockevent.

I have used the tip tree from next-20110624 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__27_Jun_2011_14_22_53_+1000_k0C6T8seJq+DJeIq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOCAWdAAoJEDMEi1NhKgbsHLMH/2nVKJVmFGKMwSd7G6GxkiS3
L0ghm7x5GcFi8Pvu/V5dWGWz+hug9wtLbLhox16LcqYB41jfvpjiWCCN/YR9lhbH
3USrIRb7V52ceo7RLXHGmguDYee3QU1ZxIrN/OCHUNoEA3eljkvnG+7m/RHUIMP7
s8pajz6MxWd4PSl56pZBaEbTulMMD540nfmj1pJac3blAMyxYyveD1YadBf7Q79q
Yg3kVzKOJN5xf8q+mqexnVMS1GaC2uzVnNrRJSyy7zp1JZn1Tj9wXt82bBy9vQO8
r2jfERhRO0kiFmQueLAZDZwbbgbx5/T+/qTO9a1BmbcEB1tcawCA8s4hgK7qlh8=
=sMkv
-----END PGP SIGNATURE-----

--Signature=_Mon__27_Jun_2011_14_22_53_+1000_k0C6T8seJq+DJeIq--
