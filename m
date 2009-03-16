From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: New linux-next tree suspend-2.6
Date: Mon, 16 Mar 2009 13:16:47 +1100
Message-ID: <20090316131647.48d632fb.sfr@canb.auug.org.au>
References: <200903151754.37147.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Mar_2009_13_16_47_+1100_bulNIm.CnqrxXOtV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49335 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751337AbZCPCQ4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Mar 2009 22:16:56 -0400
In-Reply-To: <200903151754.37147.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Jesse Barnes <jbarnes@virtuousgeek.org>

--Signature=_Mon__16_Mar_2009_13_16_47_+1100_bulNIm.CnqrxXOtV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

On Sun, 15 Mar 2009 17:54:36 +0100 "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
>
> Here's a new tree for linux-next:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/rafael/suspend-2.6.git linu=
x-next
>=20
> It is based on the Linus' current tree, but I can rebase it on top of any=
thing
> else if that helps.

Linus' tree is good as a base.

> Unfortunately, it has two merge conflict that I'm not sure how to resolve.

Thanks for the suggested resolutions.

> The first one is with the linux-next branch of pci-2.6 and it may be reso=
lved
> by applying the appended patch on top of pci-2.6/linux-next before
> merging suspend-2.6/linux-next.

I notice that your resolution is to revert a patch from the pci tree.  As
an alternative, you could apply the pci tree patch to your tree (which is
what I will effectively do today when I resolve the conflict).

OK, its a bit late in the cycle to be adding stuff for 2.6.30, but I will
add your tree from today and we will see how it goes.

What I tell everyone: all patches/commits in the tree/series must
have been:

	posted to a relevant mailing list
	reviewed
	unit tested
	destined for the next merge window (or the current release)

*before* they are included.  The linux-next tree is for integration
testing and to lower the impact of conflicts between subsystems in the
next merge window.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Mar_2009_13_16_47_+1100_bulNIm.CnqrxXOtV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm9to8ACgkQjjKRsyhoI8xNvACgtFrNgXe7X3wdOcSwqP/jSqWE
UFMAn31n+DwPHk4AEqcil2Rm0nwhC2kV
=pYE/
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Mar_2009_13_16_47_+1100_bulNIm.CnqrxXOtV--
