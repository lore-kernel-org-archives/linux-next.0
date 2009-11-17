From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: edac-amd tree (Was: Re: linux-next: Tree for November 16)
Date: Tue, 17 Nov 2009 14:19:35 +1100
Message-ID: <20091117141935.18a8ed94.sfr@canb.auug.org.au>
References: <20091116181453.b42247cf.sfr@canb.auug.org.au>
	<20091116143213.GD30377@aftab>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Nov_2009_14_19_35_+1100_uNZTm4uJmPuuZQ.l"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57058 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754356AbZKQDTh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Nov 2009 22:19:37 -0500
In-Reply-To: <20091116143213.GD30377@aftab>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <borislav.petkov@amd.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Tue__17_Nov_2009_14_19_35_+1100_uNZTm4uJmPuuZQ.l
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Mon, 16 Nov 2009 15:32:13 +0100 Borislav Petkov <borislav.petkov@amd.com=
> wrote:
>
> can you please add the edac-amd tree back to the linux-next mix, right
> after the -tip tree wrt merge order? URL is
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git for-next

Added back from today.

Just in case I missed you last time:

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

--Signature=_Tue__17_Nov_2009_14_19_35_+1100_uNZTm4uJmPuuZQ.l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksCFkcACgkQjjKRsyhoI8yfJACfaywiPezyWJRVrSiT33FpkwJ4
fQwAniSsvRntmrj4E6Pm7XXwGFzdA+1E
=eX3e
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Nov_2009_14_19_35_+1100_uNZTm4uJmPuuZQ.l--
