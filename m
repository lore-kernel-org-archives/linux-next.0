From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Upstream tree for OMFS?
Date: Tue, 13 Jul 2010 23:03:06 +1000
Message-ID: <20100713230306.b3270644.sfr@canb.auug.org.au>
References: <AANLkTilI-GLcmJjC5n2aT-0ywdOK0M5VGSUdEGYXa3VJ@mail.gmail.com>
	<20100712104435.2ca47c0a.akpm@linux-foundation.org>
	<20100712221307.GB8787@hash.localnet>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__13_Jul_2010_23_03_06_+1000_2x.rVqaC7nL6ckEl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40381 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752956Ab0GMNDQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Jul 2010 09:03:16 -0400
In-Reply-To: <20100712221307.GB8787@hash.localnet>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bob Copeland <me@bobcopeland.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, linux-next@vger.kernel.org

--Signature=_Tue__13_Jul_2010_23_03_06_+1000_2x.rVqaC7nL6ckEl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bob,

On Mon, 12 Jul 2010 18:13:07 -0400 Bob Copeland <me@bobcopeland.com> wrote:
>
> Ok - Stephen would you mind including this tree for omfs?
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/bcopeland/omfs.git#for-next

I added this tree today.

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

--Signature=_Tue__13_Jul_2010_23_03_06_+1000_2x.rVqaC7nL6ckEl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMPGQKAAoJEDMEi1NhKgbsb1sH/2z4kf1LghR9wHOgwrn9crwx
4DYKHENPIKx90ut7rTCR0U+bT0SMRQ9SHm9r/x85R1YSI70j48ibYfehsEhUbjDF
0gp7TV2nTDhmjPCsZiXWeeX8WQd5aF3zm4sdw3f9wa586L02dR8p9JYv6YcYL5K8
J7skwXVf+6qs3iPgVtAO+EG8VAgjnwJbtrE7Es1sfaWXkUa0fW0bzFlzcDJR8jrv
mONbpLcx2ERklQtiM7tS2tL2LDi/Bf/sZtdpJC6CESnlo38n2AT/9J6wUooQ/X1x
ZlbE8dW8IqhTGTGfM1Oyk009ICQShtgDVw6OkGOeLE0qeDSTvYIDqbThFrzdU7k=
=WDvY
-----END PGP SIGNATURE-----

--Signature=_Tue__13_Jul_2010_23_03_06_+1000_2x.rVqaC7nL6ckEl--
