From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the security-testing tree with the
 arm tree
Date: Mon, 14 Sep 2009 18:55:00 +1000
Message-ID: <20090914185500.fc9cf713.sfr@canb.auug.org.au>
References: <20090903154700.2d4538cf.sfr@canb.auug.org.au>
	<20090914130355.ff26d669.sfr@canb.auug.org.au>
	<20090914081220.GA14204@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__14_Sep_2009_18_55_00_+1000_9WBe_oBUfVkAk1d4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44933 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755264AbZINIzI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Sep 2009 04:55:08 -0400
In-Reply-To: <20090914081220.GA14204@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk+lkml@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mikael Pettersson <mikpe@it.uu.se>, James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>

--Signature=_Mon__14_Sep_2009_18_55_00_+1000_9WBe_oBUfVkAk1d4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Sep 2009 09:12:21 +0100 Russell King <rmk+lkml@arm.linux.org.uk>=
 wrote:
>
> On Mon, Sep 14, 2009 at 01:03:55PM +1000, Stephen Rothwell wrote:
> > This is now a conflict between the arm tree and Linus' tree (as the
> > security-testing tree has been merged).
>=20
> That's going to be a problem then - I've sent Linus a pull request last
> Saturday, and so my tree is now frozen pending a response from Linus.

You could, of course, send an email to Linus saying something like
"linux-next has shown that you will get a conflict in
arch/arm/kernel/signal.c when you merge the arm tree.  You could fix it
like this: ... or I could merge your tree and fix it locally and let you
know when it is done."

Actually Linus is probably clever enough to fix the conflict himself -
after all, I did :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__14_Sep_2009_18_55_00_+1000_9WBe_oBUfVkAk1d4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkquBOQACgkQjjKRsyhoI8yqQwCfQMOTHDePoFMDj66w8PMvuLQO
c6UAniqTvQQwE+7re7LPP0NeCHjUvErz
=Xrzb
-----END PGP SIGNATURE-----

--Signature=_Mon__14_Sep_2009_18_55_00_+1000_9WBe_oBUfVkAk1d4--
