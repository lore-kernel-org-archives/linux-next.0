From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the firmware tree
Date: Tue, 24 Jun 2008 21:20:52 +1000
Message-ID: <20080624212052.ee4f3b9d.sfr@canb.auug.org.au>
References: <20080624165508.b9bcabbe.sfr@canb.auug.org.au>
	<20080624175706.21d5f02d.sfr@canb.auug.org.au>
	<1214294678.27974.58.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Jun_2008_21_20_52_+1000_5T5z2vdEMRlzGGhv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52809 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754045AbYFXLVG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 07:21:06 -0400
In-Reply-To: <1214294678.27974.58.camel@shinybook.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__24_Jun_2008_21_20_52_+1000_5T5z2vdEMRlzGGhv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 24 Jun 2008 09:04:37 +0100 David Woodhouse <dwmw2@infradead.org> wr=
ote:
>
> I've been doing nothing about many of these mails, on the assumption
> that that's the most useful thing to do.

This is the correct response. :-)

Unless the conflict is against Linus' current tree (which happens
sometimes) there is not much you can do as these are merge conflicts
between two trees I am carrying either of which may rebase at any time.
(You could, if it was particularly important, cherrypick particular
commits from other trees, but then you have to worry about updates.)

> I can't really merge the net tree into mine and I assume you already
> _have_ the fix and a way to make sure it remains applied if you re-pull?

Yeah, "git rerere" remembers past merge conflicts and how I fix them.
And when Linus merges you tree, I am sure he will have no more trouble
with the conflicts than I do (if they still exist).

Besides, nearly all these conflicts are very trivial.

> Do let me know if there's something else I could do to make it easier on
> your side.

Rest assured, I will do everything to make my life easier.  :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Jun_2008_21_20_52_+1000_5T5z2vdEMRlzGGhv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhg2JQACgkQTgG2atn1QN+WkACff/K2KCYO78XY2jymI8jvX0Yi
fQ8An25mA/4ZuItNV9ycOQ6JJEawbTkA
=xTM+
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Jun_2008_21_20_52_+1000_5T5z2vdEMRlzGGhv--
