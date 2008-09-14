From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: x86 tree build failure
Date: Mon, 15 Sep 2008 05:52:31 +1000
Message-ID: <20080915055231.3356303b.sfr@canb.auug.org.au>
References: <20080912095618.728658a5.sfr@canb.auug.org.au>
	<20080912060527.GA22003@amd.com>
	<20080912173141.5b268bed.sfr@canb.auug.org.au>
	<20080912083023.GA1082@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Sep_2008_05_52_31_+1000_FSClHeM7GzLhyTGt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57547 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753625AbYINTwm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 15:52:42 -0400
In-Reply-To: <20080912083023.GA1082@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Joerg Roedel <joerg.roedel@amd.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Mon__15_Sep_2008_05_52_31_+1000_FSClHeM7GzLhyTGt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Fri, 12 Sep 2008 10:30:23 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> hm, but linux-next should have the timers tree merged too. So how come=20
> you triggered this build error?

Because (as I say in every daily announcement) I build the tree between
each merge.  This is because each (sub)tree that is merged into
linux-next is meant to be fairly independent (or have dependencies I know
about) and be ready (except for interactions with other trees) to be
merged by Linus when he opens the next merge window.  Also, I hope that
the linux-next tree each day is mostly bisectable (between stable and
master) so people can find bugs in it if necessary.

I assumed that the various TIP trees are fairly independent because you
do internal merges.

You can see the merge order by looking in the merge.log file in the Next
directory of the linux-next tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Sep_2008_05_52_31_+1000_FSClHeM7GzLhyTGt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjNa38ACgkQjjKRsyhoI8wy4QCfT/7CHy73GILf6c6OD/LpkvUd
DTgAoLK2ORqY9OvqielMluJT5d57I2R6
=bGPh
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Sep_2008_05_52_31_+1000_FSClHeM7GzLhyTGt--
