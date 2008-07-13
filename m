From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Sun, 13 Jul 2008 11:20:31 +1000
Message-ID: <20080713112031.74155220.sfr@canb.auug.org.au>
References: <20080701213310.3fcdeb8c.sfr@canb.auug.org.au>
	<9a8748490807121159o1153e9f4r7003f3bbfa563d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__13_Jul_2008_11_20_31_+1000_c1vIYGx+S=lhw1PX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36741 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752279AbYGMBUl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 12 Jul 2008 21:20:41 -0400
In-Reply-To: <9a8748490807121159o1153e9f4r7003f3bbfa563d@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Juhl <jesper.juhl@gmail.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org, Nick Andrew <nick@nick-andrew.net>

--Signature=_Sun__13_Jul_2008_11_20_31_+1000_c1vIYGx+S=lhw1PX
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesper,

On Sat, 12 Jul 2008 20:59:58 +0200 "Jesper Juhl" <jesper.juhl@gmail.com> wr=
ote:
>
> 2008/7/1 Stephen Rothwell <sfr@canb.auug.org.au>:
> > Hi Alan,
> >
> > Today's linux-next merge of the ttydev tree got a conflict in
> > drivers/usb/serial/ftdi_sio.c between commit
> > 0bb08241ce68aaa70b7b804b4d6319d8bad3ae24 ("Tighten up the use of loose")
> > from the trivial tree and commit ce8194a09dee5b7e101467aba6b7cd5617b1cd=
0f
> > ("23-usb-serial-api-change") from the ttydev tree.
> >
> > The conflict is just in a comment.  I have applied the spelling
> > correction from the former to the version of the file from the ttydev
> > tree.
> >
> Ok, do you want me to make any changes to the contents of Trivial or
> can I just leave thins as-is?

It is fine as is.  Alan has fixed it up for now.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__13_Jul_2008_11_20_31_+1000_c1vIYGx+S=lhw1PX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh5WF8ACgkQjjKRsyhoI8x6hwCffNufdbdsubjWIsBG9uWiUxr9
bEcAoMA/ulGVGh6geFpd+ky1RKfyD7MM
=iFB+
-----END PGP SIGNATURE-----

--Signature=_Sun__13_Jul_2008_11_20_31_+1000_c1vIYGx+S=lhw1PX--
