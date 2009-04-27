From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: comedi: Range_table and range_table_list
Date: Mon, 27 Apr 2009 19:56:20 +1000
Message-ID: <20090427195620.41376d41.sfr@canb.auug.org.au>
References: <87skjvf5o8.fsf@free.fr>
	<20090427023822.GA7060@kroah.com>
	<72cf3fb0904270137s4ac40211i8965ef0110fad7dd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__27_Apr_2009_19_56_20_+1000_jIGSQgv502IJXl=N"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56336 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756889AbZD0J42 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Apr 2009 05:56:28 -0400
In-Reply-To: <72cf3fb0904270137s4ac40211i8965ef0110fad7dd@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexis Berlemont <alexis.berlemont@gmail.com>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

--Signature=_Mon__27_Apr_2009_19_56_20_+1000_jIGSQgv502IJXl=N
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ALexis,

On Mon, 27 Apr 2009 10:37:43 +0200 Alexis Berlemont <alexis.berlemont@gmail=
.com> wrote:
>
> Ian Abott told me that the original Comedi CVS tree will not integrate
> such a code change. He suggested me to redirect my mail to linux-next
> as the staging area is supposed to host any "cleanup effort".

He is mistaken about linux-next: no development work goes on there, just
integration testing.  All staging tree work needs to be directed to Greg
(as this was).

Also, are we going to have problems if the original developers of things
in the staging tree are unwilling to take updates back into their trees?
Or is this just a procedural thing i.e. do they only want things fed back
after they have been in the staging tree?  Will this change if their work
ends up in the kernel proper?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__27_Apr_2009_19_56_20_+1000_jIGSQgv502IJXl=N
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn1gUQACgkQjjKRsyhoI8zUBQCfSeOHhiWSJRJ9iiGqc3+PaNjs
B7AAn36DQqC0grC9VxDcWiGDG8LquFP5
=HtjP
-----END PGP SIGNATURE-----

--Signature=_Mon__27_Apr_2009_19_56_20_+1000_jIGSQgv502IJXl=N--
