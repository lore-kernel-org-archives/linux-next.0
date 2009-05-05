From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: driver-core tree build failure
Date: Tue, 5 May 2009 14:18:19 +1000
Message-ID: <20090505141819.45ede65c.sfr@canb.auug.org.au>
References: <20090504162542.41b1cb57.sfr@canb.auug.org.au>
	<ac3eb2510905040600k6fca3d88tb7f282e1f94df085@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__5_May_2009_14_18_19_+1000_3coTDIHVERfyb32l"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54102 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750891AbZEEESX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 May 2009 00:18:23 -0400
In-Reply-To: <ac3eb2510905040600k6fca3d88tb7f282e1f94df085@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kay Sievers <kay.sievers@vrfy.org>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

--Signature=_Tue__5_May_2009_14_18_19_+1000_3coTDIHVERfyb32l
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kay, Greg,

On Mon, 4 May 2009 15:00:51 +0200 Kay Sievers <kay.sievers@vrfy.org> wrote:
>
> On Mon, May 4, 2009 at 08:25, Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> >
> > drivers/hid/usbhid/hiddev.c:965: error: unknown field 'nodename' specif=
ied in initializer
> > drivers/hid/usbhid/hiddev.c:965: warning: initialization from incompati=
ble pointer type
>=20
> Sorry, that was my fault. I merged a fix wrongly with the original
> patch. I sent an updated patch to Greg.

Since that update didn't make it into Greg's tree today, I just dropped
the patch from the series for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__5_May_2009_14_18_19_+1000_3coTDIHVERfyb32l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn/vgsACgkQjjKRsyhoI8zdqwCfaemIZCcwtr7pT2TcMxEuxH8k
lU8An0SKW9pAOc++LrVm/PKxoY7CB0tv
=HTjd
-----END PGP SIGNATURE-----

--Signature=_Tue__5_May_2009_14_18_19_+1000_3coTDIHVERfyb32l--
