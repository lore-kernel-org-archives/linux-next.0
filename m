From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: driver-core tree build failure
Date: Sat, 9 May 2009 21:16:11 +1000
Message-ID: <20090509211611.35504c97.sfr@canb.auug.org.au>
References: <20090504162542.41b1cb57.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__9_May_2009_21_16_11_+1000_e5i=dULyYvILB1t2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54386 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751670AbZEILQT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 9 May 2009 07:16:19 -0400
In-Reply-To: <20090504162542.41b1cb57.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Sat__9_May_2009_21_16_11_+1000_e5i=dULyYvILB1t2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 4 May 2009 16:25:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>=20
> drivers/hid/usbhid/hiddev.c:965: error: unknown field 'nodename' specifie=
d in initializer
> drivers/hid/usbhid/hiddev.c:965: warning: initialization from incompatibl=
e pointer type
>=20
> Caused by commit 5b1e3a40a98ad5a822cb527439cd57dc60a41db9 ("Driver Core:
> devtmpfs - driver core maintained /dev tmpfs").  As far as I can see the
> version of this patch in your quilt series currently has never been
> posted anywhere public ... The diff summaries for the previous and
> current version of this patch are:
>=20
> - 18 files changed, 484 insertions(+), 5 deletions(-)
> + 38 files changed, 599 insertions(+), 11 deletions(-)
>=20
> Which is a pretty big change for something in linux-next.  So, can we
> please remove this patch until it has proper review, been tested and has
> settled down a bit.

OK, so now I have another new version of this patch (split up as many
patches) in the driver-core tree (destined for linux-next) which has also
not been posted to LKML (which is where I assumed it would be posted).  I
think people would like the opportunity to review this stuff.

What do I do?  I keep telling everyone that stuff should only be in
linux-next *after* it has been reviewed and stabilised ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__9_May_2009_21_16_11_+1000_e5i=dULyYvILB1t2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoFZfsACgkQjjKRsyhoI8xiwACdEv3U3d0Tpl4a3LZRbotD4O+d
dW0An2aoSOS8BnnwspUha+ciaa+ZuBs1
=Muzv
-----END PGP SIGNATURE-----

--Signature=_Sat__9_May_2009_21_16_11_+1000_e5i=dULyYvILB1t2--
