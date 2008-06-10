From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sched/ftrace merge conflict
Date: Tue, 10 Jun 2008 13:40:23 +1000
Message-ID: <20080610134023.27264543.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Jun_2008_13_40_23_+1000_lv.jQ_WIC7Lkq3aH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35031 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754361AbYFJDkb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Jun 2008 23:40:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, Steven Rostedt <srostedt@redhat.com>, Gregory Haskins <ghaskins@novell.com>, linux-next@vger.kernel.org

--Signature=_Tue__10_Jun_2008_13_40_23_+1000_lv.jQ_WIC7Lkq3aH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched tree got a trivial conflict in
kernel/Makefile between commit 6e0534f278199f1e3dd1049b9bc19a7a5b87ada1
("sched: use a 2-d bitmap for searching lowest-pri CPU") from the sched
tree and commits bc0c38d139ec7fcd5c030aea16b008f3732e42ac ("ftrace:
latency tracer infrastructure") and
16444a8a40d4c7b4f6de34af0cae1f76a4f6c901 ("ftrace: add basic support for
gcc profiler instrumentation") from the ftrace tree.

Just a case of overlapping additions. I did the obvious fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Jun_2008_13_40_23_+1000_lv.jQ_WIC7Lkq3aH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhN96cACgkQTgG2atn1QN8SpgCbBQ2KL7jG/vhpiRx7rhQK76NH
Ff0Ani1YGXFOic6I+f1bnDXJyim3PpI7
=4YEU
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Jun_2008_13_40_23_+1000_lv.jQ_WIC7Lkq3aH--
