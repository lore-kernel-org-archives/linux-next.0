From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: tree addition request
Date: Tue, 24 Nov 2009 10:51:14 +1100
Message-ID: <20091124105114.2149e4a0.sfr@canb.auug.org.au>
References: <20091123223044.GM23772@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Nov_2009_10_51_14_+1100_Re__CJkEhtTInrZw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48085 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753226AbZKWXvQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Nov 2009 18:51:16 -0500
In-Reply-To: <20091123223044.GM23772@trinity.fluff.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-next@vger.kernel.org, Jean Delvare <khali@linux-fr.org>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Tue__24_Nov_2009_10_51_14_+1100_Re__CJkEhtTInrZw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ben,

On Mon, 23 Nov 2009 22:30:44 +0000 Ben Dooks <ben-linux@fluff.org> wrote:
>
> Is this the right place to request adding one/two trees to linux-next?

Yep.

> git://git.fluff.org/bjdooks/linux.git next-i2c

I already have an i2c quilt series from Jean Delvare
<khali@linux-fr.org>, how does this relate to that?

> git://git.fluff.org/bjdooks/linux.git next-samsung

This is a set of arm platforms, right?

I have added both these trees from today, assuming there are no
objections.  I have called them bjdooks-i2c and sumsung respectively.

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

--Signature=_Tue__24_Nov_2009_10_51_14_+1100_Re__CJkEhtTInrZw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksLH/IACgkQjjKRsyhoI8xRKACfZXTyUnv3pkmkGvY/rauOizm1
RUoAoK2N8wAZFvE3KhQdkZltv8Uo57V3
=mgrY
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Nov_2009_10_51_14_+1100_Re__CJkEhtTInrZw--
