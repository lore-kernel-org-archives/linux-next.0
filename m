From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Fwd: linux-next tree update for SELinux
Date: Thu, 19 Sep 2013 13:38:35 +1000
Message-ID: <20130919133835.6340379fcdb77565597a42b4@canb.auug.org.au>
References: <2463483.ZIt3k7nxoC@sifl>
	<20130919093533.0c8137f62938ebadd987a4f3@canb.auug.org.au>
	<CAHC9VhSY27sWmy=k-1-M5vSTBxAAuj=SL81Qu8uDzfb_3ThsWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__19_Sep_2013_13_38_35_+1000_17m7ZczIPjUqb9Mr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:58431 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752717Ab3ISDis (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Sep 2013 23:38:48 -0400
In-Reply-To: <CAHC9VhSY27sWmy=k-1-M5vSTBxAAuj=SL81Qu8uDzfb_3ThsWg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Eric Paris <eparis@redhat.com>, linux-next@vger.kernel.org, SE Linux <selinux@tycho.nsa.gov>

--Signature=_Thu__19_Sep_2013_13_38_35_+1000_17m7ZczIPjUqb9Mr
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, 18 Sep 2013 23:29:24 -0400 Paul Moore <paul@paul-moore.com> wrote:
>
> On Wed, Sep 18, 2013 at 7:35 PM, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> >
> > On Wed, 18 Sep 2013 18:53:34 -0400 Paul Moore <paul@paul-moore.com> wro=
te:
> >>
> >> The SELinux repository has changed, please replace Eric's repository (=
Eric is
> >> CC'd) with the one below:
> >>
> >>  * git://git.infradead.org/users/pcmoore/selinux
> >
> > I assume I should fetch the master branch?
>=20
> My apologies, I should have been more specific - yes, please pull from
> the master branch.

OK.

> > And who should now be the contact(s) for this tree?  Eric is the only
> > current contact.
>=20
> As Eric already said, you should probably list both of us as contacts.
>  The safest contact email for me is likely this address
> (paul@paul-moore.com).

Changed from today.

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

--Signature=_Thu__19_Sep_2013_13_38_35_+1000_17m7ZczIPjUqb9Mr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBCAAGBQJSOnG/AAoJEECxmPOUX5FE8CsP/3cWR+EJM0WNuLRjzEWbwBho
OUt3qTWucalysD2heX0kGv6tkhfWW77nHqc0SdtMfzsB2pAeWOB5EDE/hM2GoyoP
Ebdg+z0LBehSvO8AplcRNMci5dJ6fL18AD+47LbnaFSE81fojuQUEOyapIZmvEvJ
Ny71kTEjo+nX/h3B4X9GwzBQqu2nC0o772GxBmhu18kp0gBfxHj5RfGKKylCaXdJ
WkoTIyEOIPy9k43GOPPuqvhaTkI21fyjVUDx6RbAJkyv12VpebHyLJsdQ5Ai2yxn
FPHrNea605/RLgOTe/wKW9zaJokNJ0Ty1X7ezihEPU+Gldm2FL7qiFr+UNgtn5sx
7qTkS4NdcFmfbogco5cJDeBYePx7c4VfUqfN3QlnIb7RN3Ue9R3X0ZVwciE2I48I
cgLG4VGqhoCShJe7CcNrLIrKoXiyK4absEqyu2lQ285N/oDqVyPZpIclM1yMgrRH
DEvhtuE7AXU7S1X8sGDsr9fJlROBHB/JiwgH+XSRXj4jY7CF07pvUx+jmUfTawxG
pJaVs/uNtf2FMdBf/nELd/ivSRedfTtJEvrJghKy5d37r/0yp/+N2yZxjou773Lk
cYeqdssawdtNEeGlQViolUObj0Uy34i3wBYSJS1D5Rr7WqFwAyPMk20IaQ86f2JG
IkNU+hRcRMTZxIVeDLG5
=NG7Z
-----END PGP SIGNATURE-----

--Signature=_Thu__19_Sep_2013_13_38_35_+1000_17m7ZczIPjUqb9Mr--
