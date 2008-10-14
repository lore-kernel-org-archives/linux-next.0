From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the timers tree
Date: Tue, 14 Oct 2008 17:03:36 +1100
Message-ID: <20081014170336.ff176284.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_17_03_36_+1100_O8stlhvo/R.bC4Wf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46497 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755524AbYJNHFe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 03:05:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Jan Beulich <jbeulich@novell.com>, Yinghai Lu <yhlu.kernel@gmail.com>

--Signature=_Tue__14_Oct_2008_17_03_36_+1100_O8stlhvo/R.bC4Wf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the timers tree got a conflict in
include/asm-x86/fixmap_64.h between commit
c1a2f4b10852ce68e70f7e4c53600c36cc63ea45 ("x86: change early_ioremap to
use slots instead of nesting") from Linus' tree and commit
1b0ecef5e7803dff3e3e2c86036c53a67e4fe5d2 ("x86-64: reduce boot fixmap
space") from the timers tree.

Just context.  I fixed it up.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_17_03_36_+1100_O8stlhvo/R.bC4Wf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0NjgACgkQjjKRsyhoI8w3nwCfR3enrDrj212oTXhCLgByQQWR
SIwAmwSOsnFYJDZMBngaiIzj474aqIph
=PN5V
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_17_03_36_+1100_O8stlhvo/R.bC4Wf--
