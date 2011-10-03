From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: movement of my usb / staging / tty / driver-core trees
Date: Tue, 4 Oct 2011 10:10:15 +1100
Message-ID: <20111004101015.6a6be8feba23e04756a3e8a2@canb.auug.org.au>
References: <20111003220219.GA9913@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__4_Oct_2011_10_10_15_+1100_cCjT20R=wOE2+Fi3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:49717 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733Ab1JCXKZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Oct 2011 19:10:25 -0400
In-Reply-To: <20111003220219.GA9913@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org

--Signature=_Tue__4_Oct_2011_10_10_15_+1100_cCjT20R=wOE2+Fi3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 3 Oct 2011 15:02:19 -0700 Greg KH <greg@kroah.com> wrote:
>
> Now that git.kernel.org is back up, I've moved my linux-next git trees
> to a different name, dropping the "2.6" suffix on them.
>=20
> So, they are now at:
>=20
>  USB:		git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>  staging:	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>  driver-core:	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver=
-core.git
>  TTY:		git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
>=20
> All of the branch names are the same as before, and they are now all up
> to date with the local copy of my trees that I kept while kernel.org was
> down.

OK, I have switched to these from today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__4_Oct_2011_10_10_15_+1100_cCjT20R=wOE2+Fi3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOikDXAAoJEDMEi1NhKgbsplAH/jubFYX+2r5KC/QDzQ6EBU5a
CdkkS/1n0dpcHS/mnBxbof61nrmnyIis0aGHk+d0MbaZDwyl69NWuV+NiYxbeiPi
W/mXY7dLhmZnIIU0J2ZM9z3NlxDkuqGvQdWX2b2bn/QR+X/Gb+pVQK3eF9sYkqB+
mWbsrwdOQqSOkgRwINWZaxhxWeqodtAtI03wNDjNMrYD10C8UH2nEy38xMBaylEz
vT51PRnAhKI8ugsPVGnxVYtL5cizR0FGKazvkOHogr96esMXyP0uGbgSYguMsF5L
GHfnX9QvwQCcv1R+fJWRSQq/1YBfxAxBna906g9a6y2ib4tOIRXvOKjhZUS2lFY=
=rqmT
-----END PGP SIGNATURE-----

--Signature=_Tue__4_Oct_2011_10_10_15_+1100_cCjT20R=wOE2+Fi3--
