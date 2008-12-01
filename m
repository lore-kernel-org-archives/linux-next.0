From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree
Date: Mon, 1 Dec 2008 11:37:42 +1100
Message-ID: <20081201113742.da2d3923.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Dec_2008_11_37_42_+1100_8DJx1DE0PXb//Vpx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49703 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756236AbYLAAiE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 30 Nov 2008 19:38:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Lai Jiangshan <laijs@cn.fujitsu.com>, Steven Rostedt <rostedt@goodmis.org>

--Signature=_Mon__1_Dec_2008_11_37_42_+1100_8DJx1DE0PXb//Vpx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in
kernel/trace/ring_buffer.c between commit
4f5a7f40ddbae98569acbb99118a98570315579c ("ftrace: prevent recursion")
from Linus' tree and commit 182e9f5f704ed6b9175142fe8da33c9ce0c52b52
("ftrace: insert in the ftrace_preempt_disable()/enable() functions")
from the ftrace tree.

I am pretty sure that the latter supercedes the former, so I used that
version.  Please fix this conflict up in the ftrace tree soon.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Dec_2008_11_37_42_+1100_8DJx1DE0PXb//Vpx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkzMdYACgkQjjKRsyhoI8xrDgCeL0FgVhlFem5JeC8G5E23FDVp
+y0AoJCKMjLedl8y6jv4QavMOn8iAA7B
=g9EY
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Dec_2008_11_37_42_+1100_8DJx1DE0PXb//Vpx--
