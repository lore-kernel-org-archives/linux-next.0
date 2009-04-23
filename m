From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build warning
Date: Thu, 23 Apr 2009 16:17:24 +1000
Message-ID: <20090423161724.6e6aa769.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Apr_2009_16_17_24_+1000_Dwu+N0mb5fDnPOU5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54131 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753144AbZDWGRc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 02:17:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>

--Signature=_Thu__23_Apr_2009_16_17_24_+1000_Dwu+N0mb5fDnPOU5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc allyesconfig gcc4.4.0) produced this
warning:

kernel/trace/ring_buffer.c: In function 'trace_recursive_unlock':
kernel/trace/ring_buffer.c:1522: warning: suggest parentheses around operan=
d of '!' or change '&' to '&&' or '!' to '~'

Introduced by commit 261842b7c9099f56de2eb969c8ad65402d68e00e ("tracing:
add same level recursion detection") from the tracing tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__23_Apr_2009_16_17_24_+1000_Dwu+N0mb5fDnPOU5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknwB/QACgkQjjKRsyhoI8yckwCfeaGNBJuInwtxiE3cn26oAHEA
nycAnjkxao1MTC/S4AbeTrx0UX+t2lXl
=ezUo
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Apr_2009_16_17_24_+1000_Dwu+N0mb5fDnPOU5--
