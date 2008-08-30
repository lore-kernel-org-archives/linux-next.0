From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: rcu build warnings
Date: Sat, 30 Aug 2008 15:44:11 +1000
Message-ID: <20080830154411.62615e9b.sfr@canb.auug.org.au>
References: <20080829191948.95cde73f.sfr@canb.auug.org.au>
	<20080829144200.GB6725@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__30_Aug_2008_15_44_11_+1000_h_Yj/tVEaw67Lg8z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45393 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750876AbYH3FoW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 30 Aug 2008 01:44:22 -0400
In-Reply-To: <20080829144200.GB6725@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Sat__30_Aug_2008_15_44_11_+1000_h_Yj/tVEaw67Lg8z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, 29 Aug 2008 07:42:00 -0700 "Paul E. McKenney" <paulmck@linux.vnet.i=
bm.com> wrote:
>
> Commit 0cd418ddb1ee88df7d16d5df06cb2da68eceb9e4 from linux-2.6-tip in the
> tip/core/rcu section addresses this problem.  Please accept my apologies
> for the hassle!!!

Not a real hassle, I just point out warnings from my builds to people
when I get bored. :-)

I assume that patch will make it into linux-next at some point.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__30_Aug_2008_15_44_11_+1000_h_Yj/tVEaw67Lg8z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki43isACgkQjjKRsyhoI8xG6QCdHsj3MMvVO8TnU7ZV8xpjtZya
2mkAn19oBxjw43kS/5cwRVN/FD+WWf43
=iFS7
-----END PGP SIGNATURE-----

--Signature=_Sat__30_Aug_2008_15_44_11_+1000_h_Yj/tVEaw67Lg8z--
