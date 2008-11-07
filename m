From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Sat, 8 Nov 2008 09:59:50 +1100
Message-ID: <20081108095950.259305aa.sfr@canb.auug.org.au>
References: <20081107143046.7b2b171a.sfr@canb.auug.org.au>
	<1226079837.11596.19.camel@brick>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__8_Nov_2008_09_59_50_+1100_Bng1Hz7.6E3FspNp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51185 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751065AbYKGXAA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 18:00:00 -0500
In-Reply-To: <1226079837.11596.19.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Greg KH <greg@kroah.com>, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Sat__8_Nov_2008_09_59_50_+1100_Bng1Hz7.6E3FspNp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Harvey,

On Fri, 07 Nov 2008 09:43:57 -0800 Harvey Harrison <harvey.harrison@gmail.c=
om> wrote:
>
> Is it really fair to drop the v4l tree when it was -staging that broke?  =
I'd humbly
> suggest that staging be weighted somewhat lower than the other trees.

There is no staging tree in linux-next, that driver is in Linus' tree.  I
agree that if there was a staging tree, it would be much lower priority.

Maybe we need some way to exclude the staging directory from
all{yes,mod}config builds ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__8_Nov_2008_09_59_50_+1100_Bng1Hz7.6E3FspNp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkUyGYACgkQjjKRsyhoI8wTlwCfS3Tl6CyplwCnY3dkyQS43eat
vfMAn3k1CuaITk3NRjm7JJqzuUX/zdDV
=hhF9
-----END PGP SIGNATURE-----

--Signature=_Sat__8_Nov_2008_09_59_50_+1100_Bng1Hz7.6E3FspNp--
