From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the final tree
 (staging tree related)
Date: Thu, 28 Jul 2011 13:35:23 +1000
Message-ID: <20110728133523.9a080472cad87be3fff982ac@canb.auug.org.au>
References: <20110718193646.33fb3f41db9d84974913657d@canb.auug.org.au>
	<20110719010104.GA12591@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__28_Jul_2011_13_35_23_+1000_QPltY8/isTLnWA=B"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40151 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753517Ab1G1Dfe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jul 2011 23:35:34 -0400
In-Reply-To: <20110719010104.GA12591@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ondrej Zary <linux@rainbow-software.org>

--Signature=_Thu__28_Jul_2011_13_35_23_+1000_QPltY8/isTLnWA=B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Jul 2011 18:01:04 -0700 Greg KH <greg@kroah.com> wrote:
>
> On Mon, Jul 18, 2011 at 07:36:46PM +1000, Stephen Rothwell wrote:
> >=20
> > After merging the final tree, today's linux-next build (powerpc
> > allysconfig) failed like this:
> >=20
> > In file included from drivers/staging/ft1000/ft1000-pcmcia/ft1000_proc.=
c:26:0:
> > drivers/staging/ft1000/ft1000-pcmcia/ft1000.h: In function 'ft1000_read=
_reg':
> > drivers/staging/ft1000/ft1000-pcmcia/ft1000.h:80:2: error: implicit dec=
laration of function 'inw'
> > drivers/staging/ft1000/ft1000-pcmcia/ft1000.h: In function 'ft1000_writ=
e_reg':
> > drivers/staging/ft1000/ft1000-pcmcia/ft1000.h:86:2: error: implicit dec=
laration of function 'outw'
>=20
> PowerPC supports PCMCIA?  Anyway, Ondrej, care to provide a fix for this
> please?

Ping ... this is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__28_Jul_2011_13_35_23_+1000_QPltY8/isTLnWA=B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOMNj7AAoJEDMEi1NhKgbs4DcH/0hzZA9+WuWbLbT3ysIVxRpx
u4Id6vXSGztRsW6OVeY0RjJCxgEn2QdRdVeS/Uvt5i9+7j3t92Qqj/6XCX86zRcr
3BHB5w7XzpSsWrBA5VKQqjAsBFL/9e/rJGs9Oj3m42m9d8rCDqBWm1aDQkb5SSAG
7Y09XN8hgFs/yb8Kg3fm4yzzFNHXX4UPB/3Xh5XThZKS/hFRn5C7gHfHzQ9NkeVZ
/efdUPzSeHmGGELfTtehGnGwDE40iMxIyDfdvUOpmLl7yyfADAUHQMXz96LIeTqE
ic0gGfqzxW2sKZf89Aocx3esaXcBLH4IFDfVMJeuN6VJ7HAHEWbfed56vJ5fg+E=
=dGP3
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Jul_2011_13_35_23_+1000_QPltY8/isTLnWA=B--
