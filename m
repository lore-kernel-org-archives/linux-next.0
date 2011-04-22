From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: at91 next tree
Date: Sat, 23 Apr 2011 09:55:58 +1000
Message-ID: <20110423095558.99ee7136.sfr@canb.auug.org.au>
References: <20110422155122.GB23775@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__23_Apr_2011_09_55_58_+1000_KzSm4GTpFC=S=ioR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56484 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753847Ab1DVX4F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Apr 2011 19:56:05 -0400
In-Reply-To: <20110422155122.GB23775@game.jcrosoft.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: linux-next@vger.kernel.org, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Sat__23_Apr_2011_09_55_58_+1000_KzSm4GTpFC=S=ioR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 22 Apr 2011 17:51:22 +0200 Jean-Christophe PLAGNIOL-VILLARD <plagni=
oj@jcrosoft.com> wrote:
>
> 	I'd like to known how we could get the at91 at91-next branch pull
> 	in the next tree automaticaly?

You request it :-)

> 	git://github.com/at91linux/linux-2.6-at91.git at91-next

I have added that tree to linux-next.  It will be included in the next
release (probably April 27) unless someone objects.  I have cc'd the
other listed maintainers and Russell just in case.

I notice that there is currently nothing in that tree (relative to Linus'
tree).  This is not a problem for me, I mention it only in case something
is wrong at your end.

Currently I have listed only you (Jean-Christophe) as a contact in case I
have problems with the tree - if there are others that should be listed
as well, please let me know.

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

--Signature=_Sat__23_Apr_2011_09_55_58_+1000_KzSm4GTpFC=S=ioR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNshWOAAoJEDMEi1NhKgbsfuQH+wbCJgBAZtqE1jkCK5XfpRhr
nmDAv9n17bQz4PKTPJZd8Q2e9gwOf0bPXMRcrut9M3IXihIuZO/E92vk1moF6cPV
WOgP8xcgmZPQdlwbGiJqCih8yu7hnzUFHfwl5E9pXMneiNxI6TULS/XCTaOZ5M/u
A18S8OjrXiXvdKzJHDYm4XMNLJju/FLhrrkRjzfcExFj6+RMec6EElxEuxJ5mywF
za06aU4J3ELY3N94TA50Abtg2MR3zm2XguptukSdIKL0Dg5cQRAqB89HLWrJp6oU
4QAYcURCQl/pXCP45MbcXWQeS4CsRooKJYi25C78MA607RLJfP6GVLzkMLvrZI0=
=YA0+
-----END PGP SIGNATURE-----

--Signature=_Sat__23_Apr_2011_09_55_58_+1000_KzSm4GTpFC=S=ioR--
