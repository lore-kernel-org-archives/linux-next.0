From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Mon, 14 Jul 2008 16:52:07 +1000
Message-ID: <20080714165207.c85bc649.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__14_Jul_2008_16_52_07_+1000_eafMk._/.maY3AHj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45344 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753045AbYGNGwO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Jul 2008 02:52:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Steven Rostedt <srostedt@redhat.com>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>

--Signature=_Mon__14_Jul_2008_16_52_07_+1000_eafMk._/.maY3AHj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a trivial conflict in
kernel/sysctl.c between commit b0fc494fae96a7089f3651cb451f461c7291244c
("ftrace: add ftrace_enabled sysctl to disable mcount function") from the
ftrace tree and commit c1f560972a23262cfee0ffeacc3a435f61f0af09 ("remove
CONFIG_KMOD from core kernel code") from the rr tree.

Just a couple of contextual changes. Simple fixup.  I can carry it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__14_Jul_2008_16_52_07_+1000_eafMk._/.maY3AHj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh695cACgkQjjKRsyhoI8wzDgCeIYuKTd+E1ta9xLcbixSTOF8h
OqwAnicf62/0AoQfkRDZcj7Kqz5NwmKv
=SKIo
-----END PGP SIGNATURE-----

--Signature=_Mon__14_Jul_2008_16_52_07_+1000_eafMk._/.maY3AHj--
