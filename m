From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: tty tree change for linux-next
Date: Sat, 1 Aug 2009 17:22:45 +1000
Message-ID: <20090801172245.1d3e8b31.sfr@canb.auug.org.au>
References: <20090801043905.GA12779@kroah.com>
	<20090801164104.5e9b2f17.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__1_Aug_2009_17_22_45_+1000_8iKzR1uO4x.B9_er"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32957 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751548AbZHAHWt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 1 Aug 2009 03:22:49 -0400
In-Reply-To: <20090801164104.5e9b2f17.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Sat__1_Aug_2009_17_22_45_+1000_8iKzR1uO4x.B9_er
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Sat, 1 Aug 2009 16:41:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Fri, 31 Jul 2009 21:39:05 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > If there are any problems with the trees, please let me know.
>=20
> Will do.

Just a small (but important) thing.  All the tty series patches look like t=
his:

<summary>

From: <author>

<message>
.
.


When I import these, they will all look like they are authored by you and
use the file name as the one line summary :-( .  "Git quilt-import"
expects more mail-like patches like:

From: <author>
Subject: <summary>

..

So if there is some easy transform you could do on these, it would be
good.  (There is only one patch that has "Subject:" at the start of the
<summary>.)  (Subject: followed by From: is ok as well, so 'prepend
"Subject: " to first line and remove following blank line' would probably
get you very close.)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__1_Aug_2009_17_22_45_+1000_8iKzR1uO4x.B9_er
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpz7UUACgkQjjKRsyhoI8w/YwCgk+ihjCrXW+oCP/XwqkqUa+hV
6J8AoLqsRWfLivjB/cu8gLkPuLQCD/+u
=Nn1w
-----END PGP SIGNATURE-----

--Signature=_Sat__1_Aug_2009_17_22_45_+1000_8iKzR1uO4x.B9_er--
