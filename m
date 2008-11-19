From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: spinlock lockup with next-20081118 on powerpc
Date: Thu, 20 Nov 2008 01:35:52 +1100
Message-ID: <20081120013552.587f8928.sfr@canb.auug.org.au>
References: <20081119093023.48895b84.sfr@canb.auug.org.au>
	<20081119091628.GT26308@kernel.dk>
	<20081119203922.0412c041.sfr@canb.auug.org.au>
	<20081119094300.GW26308@kernel.dk>
	<20081119213304.d2d21042.sfr@canb.auug.org.au>
	<20081119105833.GZ26308@kernel.dk>
	<20081120003224.8d0f481c.sfr@canb.auug.org.au>
	<20081119133408.GE26308@kernel.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__20_Nov_2008_01_35_52_+1100_6Dxg1y1M91uVj7+5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42307 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751918AbYKSOgF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 09:36:05 -0500
In-Reply-To: <20081119133408.GE26308@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: ppc-dev <linuxppc-dev@ozlabs.org>, linux-next@vger.kernel.org

--Signature=_Thu__20_Nov_2008_01_35_52_+1100_6Dxg1y1M91uVj7+5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Wed, 19 Nov 2008 14:34:09 +0100 Jens Axboe <jens.axboe@oracle.com> wrote:
>
> Are you removing devices or modules? We have a bug there it seems, does
> this help?

This is early in boot (we are waiting for the root device while running
on the initramfs) so there could well be modules being unloaded.

That patch makes the problem go away.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__20_Nov_2008_01_35_52_+1100_6Dxg1y1M91uVj7+5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkkJEgACgkQjjKRsyhoI8yVZQCfZddD/M02ZsImbbXcmjPM6LOj
KXgAoLrbdQhUX1trmziISZdyr99+IKdo
=8tMT
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Nov_2008_01_35_52_+1100_6Dxg1y1M91uVj7+5--
