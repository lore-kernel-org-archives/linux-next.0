From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the wireless tree
Date: Wed, 28 Apr 2010 16:17:57 +1000
Message-ID: <20100428161757.38fabddd.sfr@canb.auug.org.au>
References: <20100427112842.3eec02a1.sfr@canb.auug.org.au>
	<20100427154043.GA25860@tuxdriver.com>
	<i2p446ae9281004271007h43f9949dw9848a7786a9c7be1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_Apr_2010_16_17_57_+1000_I3WrjxdUko2QzF0_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39227 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753067Ab0D1GSD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Apr 2010 02:18:03 -0400
In-Reply-To: <i2p446ae9281004271007h43f9949dw9848a7786a9c7be1@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Steve deRosier <steve@cozybit.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__28_Apr_2010_16_17_57_+1000_I3WrjxdUko2QzF0_
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

On Tue, 27 Apr 2010 10:07:12 -0700 Steve deRosier <steve@cozybit.com> wrote:
>
> On Tue, Apr 27, 2010 at 8:40 AM, John W. Linville
> <linville@tuxdriver.com> wrote:
> >
> > Right. =C2=A0So in wireless-testing I did the includes in the other ord=
er
> > (i.e. "deb_defs.h" first), but that is a bit ugly. =C2=A0Any suggestions
> > on alternatives?

I have done that as well for today in linux-next.

> > "#undef pr_fmt" just before the "#define pr_fmt(fmt)..." line in
> > db_defs.h seems to eliminate the warning even with the more normal
> > ordering of the #include lines. =C2=A0I'm not familiar with the usage of
> > pr_fmt -- will doing the above preserve the desired effect?
>
> I thought about that particular strategy (doing the #undef) instead of
> the non-traditional include mess.  But not being familiar enough with
> the pr_fmt stuff, I didn't want to do it.
>=20
> My goal was to get the '#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt'
> line in the deb_defs.h header so it was only in one place.  But to
> build, that define must be before kernel.h gets included anywhere.
> Hence the current mess.
>=20
> I'm OK with the #undef strategy and moving the deb_defs.h include to a
> better position if that's the correct way to do this.  Please let me
> know if I have any action items on this.

The only problem I could see with that is is there are some inline
functions in the headers files between where the first and second #define
pr_fmt s get done.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_Apr_2010_16_17_57_+1000_I3WrjxdUko2QzF0_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvX0xUACgkQjjKRsyhoI8whrgCgua0e2meW97K0lyPSe/y0g4Y8
vNgAoJadoI4QHMCujHDOt+i52xQT6G8J
=HULT
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Apr_2010_16_17_57_+1000_I3WrjxdUko2QzF0_--
