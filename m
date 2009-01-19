From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the stackprotector tree
Date: Mon, 19 Jan 2009 11:51:59 +1100
Message-ID: <20090119115159.4437cd09.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_Jan_2009_11_51_59_+1100_=58oAq3o0wZX8Fcu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34169 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755366AbZASAwJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 18 Jan 2009 19:52:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__19_Jan_2009_11_51_59_+1100_=58oAq3o0wZX8Fcu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the stackprotector tree got conflicts in
arch/x86/include/asm/pda.h and arch/x86/include/asm/system.h against the
tip-core tree.

It looks like extensive changes have been made that have not been
propagated to the stackprotector tree yet, so I will drop it for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_Jan_2009_11_51_59_+1100_=58oAq3o0wZX8Fcu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklzzq8ACgkQjjKRsyhoI8xc0gCgsYsvJXnj3bw6Zjrn+HN/QCBn
fxYAmwXhBbFj3RAT8Hezwh4oJWRasDgY
=7FLe
-----END PGP SIGNATURE-----

--Signature=_Mon__19_Jan_2009_11_51_59_+1100_=58oAq3o0wZX8Fcu--
