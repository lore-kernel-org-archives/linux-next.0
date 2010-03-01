From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: IBFT and SWIOTLB tree.
Date: Mon, 1 Mar 2010 17:25:54 +1100
Message-ID: <20100301172554.92574f5d.sfr@canb.auug.org.au>
References: <20100223160034.GC28966@phenom.dumpdata.com>
	<20100224193931.89bb7e87.sfr@canb.auug.org.au>
	<20100224150034.GB20890@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Mar_2010_17_25_54_+1100_k3oB1eXfUEXEc81z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39120 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751110Ab0CAG0C (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Mar 2010 01:26:02 -0500
In-Reply-To: <20100224150034.GB20890@phenom.dumpdata.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@ORACLE.COM>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__1_Mar_2010_17_25_54_+1100_k3oB1eXfUEXEc81z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Wed, 24 Feb 2010 10:00:34 -0500 Konrad Rzeszutek Wilk <konrad.wilk@ORACL=
E.COM> wrote:
>
> On Wed, Feb 24, 2010 at 07:39:31PM +1100, Stephen Rothwell wrote:
> >=20
> > I would need a bit a background for these trees since you are not listed
> > as a maintainer in the MAINTAINERS file.
>=20
> Hmm, weird. IBFT is the patch set for the drivers/firmware/iscsi_ibft.c
> which was developed by me.

And I see you have added a MAINTAINERS entry and Linus has merged the two
patches.  I will add this tree tomorrow.  Please don't add any 2.6.35
material until after 2.6.34-rc1 is released.  2.6.34 material and fixes
are OK.

> > > git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb-2.6.git
>=20
> That one is the re-work of the SWIOTLB IOMMU code. Not a maintainer, but
> I want to make sure that the patches don't stomp/break other code.

Is this intended for 3.6.34?  I can't add that tree yet, as it has a
series of patches in it that have no Signed-off-by lines.  This material
should also get fairly wide review and I would expect to see some
Acked-by lines before the patches were ready for inclusion.

> > The master branch of both these trees is empty relative to Linus' tree =
...
>=20
> Let me fix that. I had the HEAD point to the right branch, but didn't
> think of updating the refs/heads/master file.

Since you didn't tell me what branch to use, I assumed the master branch.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Mon__1_Mar_2010_17_25_54_+1100_k3oB1eXfUEXEc81z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuLXfIACgkQjjKRsyhoI8xE0ACffbG8+rNgjyFg8BbCyo0evx9t
eV4An2GeMHGCgqSoYMWO/OvZlyOHtTk9
=vf+k
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Mar_2010_17_25_54_+1100_k3oB1eXfUEXEc81z--
