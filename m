From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Tue, 8 Jul 2008 10:56:58 +1000
Message-ID: <20080708105658.1a9deedc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_10_56_58_+1000_BwUctV6F.sqxTPd9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40044 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755108AbYGHA5H (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 20:57:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>, Steven Rostedt <srostedt@redhat.com>

--Signature=_Tue__8_Jul_2008_10_56_58_+1000_BwUctV6F.sqxTPd9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
include/asm-x86/irqflags.h between commit
81d68a96a39844853b37f20cc8282d9b65b78ef3 ("ftrace: trace irq disabled
critical timings") from the ftrace tree and commits
f56c208ae2a6705a40c0f7d43bfc4ede7eb20a83 ("x86, 64-bit: swapgs pvop with
a user-stack can never be called") and
6d2a6e57be1582b017a39f52385adf49d7cc4b0f ("x86_64: fix non-paravirt
compilation") from the x86 tree.

Just contextual remove/move of code.  I can carry the fixup.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_10_56_58_+1000_BwUctV6F.sqxTPd9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEARECAAYFAkhyu1oACgkQjjKRsyhoI8wZPwCfeOTeIQqtIYwaQmK1Nzdsgmh7
JbkAli7lM5C42UrnzmuRv4kZklt5QIw=
=v0NO
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_10_56_58_+1000_BwUctV6F.sqxTPd9--
