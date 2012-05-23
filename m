From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: signal.git
Date: Wed, 23 May 2012 15:30:53 +1000
Message-ID: <20120523153053.b5baf293cc3fa1da1699490a@canb.auug.org.au>
References: <20120523052234.GM11775@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__23_May_2012_15_30_53_+1000_bgFdEsrhL9W_kbAS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:43805 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559Ab2EWFa5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 May 2012 01:30:57 -0400
In-Reply-To: <20120523052234.GM11775@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__23_May_2012_15_30_53_+1000_bgFdEsrhL9W_kbAS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Wed, 23 May 2012 06:22:35 +0100 Al Viro <viro@ZenIV.linux.org.uk> wrote:
>
> 	Sorry for not having done that earlier; the tree is at
> git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal #for-next.
> No non-trivial conflicts with akpm-base - only arch/*/Kconfig ones
> coming from mainline.  A _lot_ of duplicates with akpm - 20 commits
> from Matt and Oleg are all cherry-picked from there.
>=20
> 	I've included the recent uml.git pull request in there -
> it's not in -next (and probably ought to be) and this time it
> has a lot to do with the stuff being dealt with here.
>=20
> 	I hope to get task_work_add() series through that tree,
> once all prereqs are there; I'll send heads-up before doing that,
> since those patches are currently in akpm's patchset (and unfortunately
> they do need a bunch of commits not in there to get them working on
> all architectures - some of those prereqs are in this branch, some
> will need to be moved to it from signal.git#master)

OK, since a lot of this has been in Andrew's patch series for a while, I
will add this tree today.

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

--Signature=_Wed__23_May_2012_15_30_53_+1000_bgFdEsrhL9W_kbAS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPvHYNAAoJEECxmPOUX5FEM7YQAJge1MnCosNTRdy6qVGVLAX+
H3pu/3C20dQ2vFwZc0OWed/367Ws6HBL4DgpDtJHyuGp1DZkKASyltDMQmOtfIgh
aheIWAKTq4KssP9RSErTzu94pZJsobOfHa3mWYVX3SAFqSDsIIjMF2/Z79OwPcMs
574do/0X06VSz0ffS906ghHOCgv97R6fvzPVTH3wfeyRwHWL8MiSdvvHMLHSVInl
RCm3BaaOuSaIIr7FlI9RRBZkRetraht8hG8O29KPwuQ+EyssjWCPAcq1fLNwQ7n3
UpDYv5X5pLVh0b6bx7mcruFZsLmiddYAbcSr4DgwrlNQ10t9WWX6P0X64YbEssG/
4eG1ygZ4XLwtRucE3XV4ah0hVIBz/fD+kwhSl40YTTml+l9wdfAsX2ucyKrX5sur
lMwNNHNTLiH5qMaMNhLO11RE5EJsaa6qg22Baesz0BcHewptZcT6IWfzs+7tRk5P
54d45Qx0Yya1WkBzD7hF9ANz+Rrq3k96rTgv2CAF8o1oKL8H37b/57HySTxQru07
hW6mphR4NhVv9vfyo3AjvJ4saazzkvVG82pFAOsNLAcvinZcJN8wERItKgLVVTdi
smmO/Ug3wWHCTESVLodhxHC9XcdodVERqTna92YOulZlaDIXlulLXZFmNPwgqnNG
qYc9wPsHwbWS3viD0P/x
=bLoK
-----END PGP SIGNATURE-----

--Signature=_Wed__23_May_2012_15_30_53_+1000_bgFdEsrhL9W_kbAS--
