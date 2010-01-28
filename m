From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next:als tree build failure
Date: Thu, 28 Jan 2010 23:17:50 +1100
Message-ID: <20100128231750.1dd29044.sfr@canb.auug.org.au>
References: <20100128182334.7226bdf6.sfr@canb.auug.org.au>
	<20100128084107.682db589@hyperion.delvare>
	<4B617C29.6010300@cam.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__28_Jan_2010_23_17_50_+1100_9WOQkp9BruB7n=aa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33944 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752004Ab0A1M1w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Jan 2010 07:27:52 -0500
In-Reply-To: <4B617C29.6010300@cam.ac.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Cameron <jic23@cam.ac.uk>
Cc: Jean Delvare <khali@linux-fr.org>, Zhang Rui <rui.zhang@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__28_Jan_2010_23_17_50_+1100_9WOQkp9BruB7n=aa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonathan, Jean,

On Thu, 28 Jan 2010 11:59:37 +0000 Jonathan Cameron <jic23@cam.ac.uk> wrote:
>
> It does make sense to keep these two steps separate.  Ah well, I guess any
> work around would be a pretty terrible cludge.  I'll roll these two patch=
es
> back together and otherwise we will end up with something even less coher=
ent.

OK, thanks guys.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__28_Jan_2010_23_17_50_+1100_9WOQkp9BruB7n=aa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkthgG4ACgkQjjKRsyhoI8xndwCgj0KUSychnGvW8i5NJ/Pdr0pv
nbkAnAnsVAPZrnvdGjwTWY/BrgRr0GNU
=7dJI
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Jan_2010_23_17_50_+1100_9WOQkp9BruB7n=aa--
