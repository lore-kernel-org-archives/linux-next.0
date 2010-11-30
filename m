From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please include ux500 core into linux-next
Date: Wed, 1 Dec 2010 09:55:30 +1100
Message-ID: <20101201095530.af394617.sfr@canb.auug.org.au>
References: <AANLkTi=fXAucNc-m9dqb0cgA6mGJ5c4cXC-pTOz05vwY@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__1_Dec_2010_09_55_30_+1100__Dgyuj25Ciwmgd2N"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34844 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752425Ab0K3Wzk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Nov 2010 17:55:40 -0500
In-Reply-To: <AANLkTi=fXAucNc-m9dqb0cgA6mGJ5c4cXC-pTOz05vwY@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-dev <linaro-dev@lists.linaro.org>, Rabin VINCENT <rabin.vincent@stericsson.com>

--Signature=_Wed__1_Dec_2010_09_55_30_+1100__Dgyuj25Ciwmgd2N
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 30 Nov 2010 10:31:43 +0100 Linus Walleij <linus.walleij@linaro.org>=
 wrote:
>
> please consider to start merging our ux500-core branch into
> linux-next:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git
> Branch: ux500-core
>=20
> (NB: there is a "next" branch, which include patches to multiple
> subsystems, don't merge that, this is just the ux500 core.)

OK.

> I rebase this regularly to Torvalds' -rc tags, hope that's OK.

Yeah, that's OK.  Rebasing to tags is better than random points, but less
rebasing is even better.

> All code is being reviewed on the linux-arm-kernel list, and the
> patches here are intended for pull request to Russell King who
> in turn take them upstream. I hope this procedure is
> acceptable.

This is all fine.  Russell, I am assuming that this is all OK with you.

> We currently have some of these patches in Russells patch tracker
> as well, but they will be taken out in favor of the pull approach
> once this branch lands in -next.

I have added that branch from today with just you (Linus) as the
contact.  If you want additional contacts (people who will be notified of
merge and build problems), please let me know.

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

--Signature=_Wed__1_Dec_2010_09_55_30_+1100__Dgyuj25Ciwmgd2N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJM9YDiAAoJEDMEi1NhKgbsZB8H/RnR2yl4LuqSYQAf6ajlgU0T
j1CVhxc3chyjsWOj+Po/KyGvKE0HmufEdje/KhKwkVVe1z0thNCN+nCSMrnbHRkv
O5GRQbBXxqMahBxz2khTIasi8+qA7k3EqXUjlXdMD/z4a4CRzR5T/2GWvvJ9JicM
K07fV7/XMnOCCVn09evUIYJsoTWJpWw3UHmxOdJIU5yvaHtYT9PfnSlCSgP9MsY2
BztvIVX6fN0af7AhXtcmLlS4hLn945GDWnCSu4t1qiixU45XHe7yozsnZpONnr3y
HDjSs+yz6fxEHgnqNBP4R/TAcn/qCyNiPnTIKUaSN0TvYxSMPmtrrIoGv3lLXAE=
=MejR
-----END PGP SIGNATURE-----

--Signature=_Wed__1_Dec_2010_09_55_30_+1100__Dgyuj25Ciwmgd2N--
