From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ground rules
Date: Sat, 15 Aug 2009 01:16:17 +1000
Message-ID: <20090815011617.bed3494e.sfr@canb.auug.org.au>
References: <20090814180246.9ac3e78e.sfr@canb.auug.org.au>
	<1250258173.4021.3.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__15_Aug_2009_01_16_17_+1000_HIUhpIxmdDnP9JV6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59310 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932508AbZHNPQX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Aug 2009 11:16:23 -0400
In-Reply-To: <1250258173.4021.3.camel@mulgrave.site>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

--Signature=_Sat__15_Aug_2009_01_16_17_+1000_HIUhpIxmdDnP9JV6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

On Fri, 14 Aug 2009 08:56:13 -0500 James Bottomley <James.Bottomley@HansenP=
artnership.com> wrote:
>
> On Fri, 2009-08-14 at 18:02 +1000, Stephen Rothwell wrote:
> >=20
> >      * successfully unit tested, and=20
>=20
> The rest are fine, but this one isn't feasible for a driver tree ... I
> don't have all the hardware, and people will insist on fixing
> theoretical bugs in drivers we can't test on.
>=20
> A lot of time, bugs turn up in this code only after it has been on
> release for several months and the small pool of HW owners actually gets
> around to testing it.
>=20
> Additionally, I have to carry patches on trust for HW I'm never likely
> to see outside someones multi-million dollar lab.

OK, in the context of linux-next, "successfully unit tested" to me means
that it doesn't break on "reasonable" builds (i.e. x86(_64) allmodconfig
or something similar) and probably won't break if someone tries to use
it.  Clearly, you are correct, you can't test everything.  I guess I just
want to be able to be justifiably annoyed if my builds break for
something obvious (which does happen from time to time :-().

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__15_Aug_2009_01_16_17_+1000_HIUhpIxmdDnP9JV6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqFf8EACgkQjjKRsyhoI8y9twCfbQXqlp6MpCt3rRGIhyV4k4E0
V7UAoJell/QeJQIqYDnYpgRSo16cJzsJ
=i3zz
-----END PGP SIGNATURE-----

--Signature=_Sat__15_Aug_2009_01_16_17_+1000_HIUhpIxmdDnP9JV6--
