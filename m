From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: x86 merge conflicts
Date: Wed, 11 Jun 2008 12:59:25 +1000
Message-ID: <20080611125925.a27948c9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_Jun_2008_12_59_25_+1000_a7OeLXjRvxhiCvyD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52826 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752572AbYFKC7p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Jun 2008 22:59:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__11_Jun_2008_12_59_25_+1000_a7OeLXjRvxhiCvyD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today;s linux-next merge of the x86 tree got conflicts in
arch/x86/kernel/process_32.c and arch/x86/kernel/process_64.c between
commits 6cd8a4bb2f97527a9ceb30bc77ea4e959c6a95e3 ("ftrace: trace preempt
off critical timings") and 81d68a96a39844853b37f20cc8282d9b65b78ef3
("ftrace: trace irq disabled critical timings") from the ftrace tree and
commit 6ddd2a27948f0bd02a2ad001e8a6816898eba0dc ("x86: simplify idle
selection") from the x86 tree.

I did the obvious (to me) fixup of replacing "idle()" with "pm_idle()" in
the ftrace versions.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__11_Jun_2008_12_59_25_+1000_a7OeLXjRvxhiCvyD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhPP40ACgkQTgG2atn1QN8tQwCfcWNR6TAcmjAYLSL4uFcjMGkf
lIoAn2yLWeXrrJ5QKNiEd9/tmF+GURXA
=H7gY
-----END PGP SIGNATURE-----

--Signature=_Wed__11_Jun_2008_12_59_25_+1000_a7OeLXjRvxhiCvyD--
