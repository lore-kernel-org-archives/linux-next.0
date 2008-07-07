From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the arm tree
Date: Mon, 7 Jul 2008 20:39:28 +1000
Message-ID: <20080707203928.a701e493.sfr@canb.auug.org.au>
References: <20080704165712.3d941be3.sfr@canb.auug.org.au>
	<20080707091243.GA1842@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_20_39_28_+1000_lmH3ggQyO5JPrGGf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55043 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752249AbYGGKjh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 06:39:37 -0400
In-Reply-To: <20080707091243.GA1842@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Greg KH <greg@kroah.com>

--Signature=_Mon__7_Jul_2008_20_39_28_+1000_lmH3ggQyO5JPrGGf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Mon, 7 Jul 2008 10:12:43 +0100 Russell King <rmk@arm.linux.org.uk> wrote:
>
> On Fri, Jul 04, 2008 at 04:57:12PM +1000, Stephen Rothwell wrote:
> > Today's linux-next merge of the arm tree got a conflict in
> > arch/arm/kernel/time.c between commit
> > 5b01a6a61c48d8e6ab4679d6e6208f5962d07b85 ("sysdev: Pass the attribute to
> > the low level sysdev show/store function") from the driver-core tree and
> > commit 205bee6ad804d7034773b5978c74dde495df2301 ("[ARM] dyntick: Remove
> > obsolete and unused ARM dyntick support") from the arm tree.
> >=20
> > The arm commit just removed some code that the driver-core commit
> > modified.  So I removed it and can carry the fixup.
>=20
> I think that's a merge issue which Linus is also going to have to deal
> with when it happens, since there's no real solution to committing
> "fixes" to our trees without the fix causing the tree in isolation to
> break.

That's what I mean by "I .. can carry the fixup".  I assume Linus is
smarter than I am and is able to do any merge fixup I am capable of.  Or
you (or Greg) will merge/rebase on some version of Linus' tree and do the
fixup before sending your tree to him.

These messages about inter tree conflicts are mostly "heads up".
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_20_39_28_+1000_lmH3ggQyO5JPrGGf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhx8mAACgkQjjKRsyhoI8zAHQCgvWyF6DWKb6EtGbYNQv7tbv78
AwwAmgN+zGP0Fmx6IjPAm6V7OwRKJ3ws
=pJEY
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_20_39_28_+1000_lmH3ggQyO5JPrGGf--
