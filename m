From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] m68knommu: ColdFire add support for kernel preemption
Date: Mon, 23 Jun 2008 17:53:26 +1000
Message-ID: <20080623175326.ddf5d2d4.sfr@canb.auug.org.au>
References: <200805010216.m412GT6t004096@goober>
	<20080501143336.552e39e1.akpm@linux-foundation.org>
	<481AC07A.6080707@snapgear.com>
	<20080502083755.GA13973@Chamillionaire.breakpoint.cc>
	<20080502052235.eb9c336a.akpm@linux-foundation.org>
	<485F3585.2080606@snapgear.com>
	<20080622225102.5117f22b.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Jun_2008_17_53_26_+1000_nq6hPHJxSFJHRiIz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57171 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752040AbYFWHxj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jun 2008 03:53:39 -0400
In-Reply-To: <20080622225102.5117f22b.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Ungerer <gerg@snapgear.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

--Signature=_Mon__23_Jun_2008_17_53_26_+1000_nq6hPHJxSFJHRiIz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Sun, 22 Jun 2008 22:51:02 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> On Mon, 23 Jun 2008 15:32:53 +1000 Greg Ungerer <gerg@snapgear.com> wrote:
>=20
> > Here is a git tree for the collection of patches for the m68knommu
> > architecture that I intend for the 2.6.27 merge window.
> >=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-li=
nus

Added today (slipped it in at the end).

> > I have created a general uclinux changes git tree as well,
> >=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/gerg/uclinux.git for-linus

This tree currently has no for-linus branch.  You should create one (even
if it just a subset of Linus' tree).  I've added it using its master
branch for now, please let me know when it is fixed.

Also, these branches would normally be called for-next.  Most people keep
for-linus for bug fixes for the current release.  If you decide to change
the branch name, just let me know.

Repeat of the rules for linux-next: anything included must have been
posted somewhere appropriate, reviewed and unit tested (i.e. your tree
should build for you).

> Great, thanks.  But can we get them into linux-next please?  I'll pick
> them up via that route.

Done.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Jun_2008_17_53_26_+1000_nq6hPHJxSFJHRiIz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhfVnYACgkQTgG2atn1QN8VVACeLXC/Y+f+nmtV8cX3fA8eNYG9
bqgAoIQcxgfT6Bv3l8pMfUxb86dFonHQ
=zw+G
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Jun_2008_17_53_26_+1000_nq6hPHJxSFJHRiIz--
