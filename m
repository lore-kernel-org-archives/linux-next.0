From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 17:57:08 +1100
Message-ID: <20081125175708.d28d08cd.sfr@canb.auug.org.au>
References: <20081125142105.2b6d464a.sfr@canb.auug.org.au>
	<1227584931.7622.11.camel@localhost.localdomain>
	<20081125151345.3f0ed493.sfr@canb.auug.org.au>
	<1227587493.7622.14.camel@localhost.localdomain>
	<20081125160935.2bd3dcb2.sfr@canb.auug.org.au>
	<1227591856.7622.26.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_17_57_08_+1100_8nqi+mKrx_wL2/Cw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34073 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751533AbYKYG5b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 01:57:31 -0500
In-Reply-To: <1227591856.7622.26.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <srostedt@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Tue__25_Nov_2008_17_57_08_+1100_8nqi+mKrx_wL2/Cw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Tue, 25 Nov 2008 00:44:16 -0500 Steven Rostedt <srostedt@redhat.com> wro=
te:
>
> Yep, it was the wrong constraint used in the asm. Googling around, I
> found a similar bug listed in gcc, which was not a bug.

Amazing what we trip over :-(

> Patch has been sent to fix this.

Can you put that patch in your tree as well, or will it reach linux-next
quickly enough anyway?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_17_57_08_+1100_8nqi+mKrx_wL2/Cw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrocQACgkQjjKRsyhoI8whvgCeM6NiWfstgKe10jb8uzxlIEg1
zz4AoKhC/G0ovr+pIdVHnsGRS7R3Px0H
=gJVe
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_17_57_08_+1100_8nqi+mKrx_wL2/Cw--
