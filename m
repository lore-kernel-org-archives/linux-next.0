From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sched tree
Date: Tue, 22 Jul 2008 11:54:57 +1000
Message-ID: <20080722115457.46aa2c98.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__22_Jul_2008_11_54_57_+1000_kt.vAuzfHhKornmx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54135 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751967AbYGVBzG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jul 2008 21:55:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Roland McGrath <roland@redhat.com>

--Signature=_Tue__22_Jul_2008_11_54_57_+1000_kt.vAuzfHhKornmx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched tree got a conflict in
include/asm-x86/thread_info.h between commit
64f097331928b01d704047c1dbc738bb6d2a9bf9 ("x86 ptrace: unify
TIF_SINGLESTEP") from the  tree and commit
31656519e132f6612584815f128c83976a9aaaef ("sched, x86: clean up hrtick
implementation") from the sched tree.

The former removes _TIF_SINGLESTEP from _TIF_DO_NOTIFY_MASK, the latter
removes _TIF_HRTICK_RESCHED.  I removed both.  Worth a look when the tree
gets published.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__22_Jul_2008_11_54_57_+1000_kt.vAuzfHhKornmx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiFPfEACgkQjjKRsyhoI8wzhwCdG7NDNv0FUKeLk3ZYk3Hk62ZN
9zIAnjavk9s7CASR5tdurAfXIjo7eDQ8
=7IKc
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Jul_2008_11_54_57_+1000_kt.vAuzfHhKornmx--
