From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: linux-next: manual merge of the pm tree with the i2c tree
Date: Tue, 19 Jul 2016 05:48:07 +0200
Message-ID: <20160719034806.GA1640@katana>
References: <20160715121723.0f21f148@canb.auug.org.au>
 <2196027.ndrBocBl2R@vostro.rjw.lan>
 <20160717181448.GC1814@katana>
 <2565257.LbcJLfl1sl@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:56212 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752379AbcGSDsV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 23:48:21 -0400
Content-Disposition: inline
In-Reply-To: <2565257.LbcJLfl1sl@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Well, not knowing much about ACPI, I just need the conflict resolution
> > for my latest i2c/for-next and your above branch. If you want to do it,
> > fine with me. But maybe Jarkko will be back to office on Monday, too.
>=20
> Unfortunately, I don't see how these branches can be merged in a sensible
> way without adding too much new code into the merge itself.
>=20
> Something needs to be dropped and then rebased and applied again.

Okay, I'll drop the I2C parts. Next to the core parts which I will drop,
there was also a driver patch making use of the core changes for which I
requested some updates. Since those did not happen yet (Jarkko on
holiday?), the core patches alone are not important anyhow.

Thanks for looking into it!

   Wolfram


--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXjaL2AAoJEBQN5MwUoCm27V4P/jWIMOOFuKO09O8UxEdab5RF
JfcU0oxX8Qfip+a+RzApEsbUyNsw06ny2/LZwVPgv/gWks0bltgdR61edxws5CZW
gTze4V9/oJd8tJ6o6rQLyx4gyXVyDAugIiD/UWTKzyZ/691M9VWScssrHKBJx5c4
OKKTb784IsKTN0lPW8f7y+MGYHGNJWUsqkIDxoDn5P3qf/xMCYcljF7q7uWk8nns
gtoPeoZINN3K8lwmopjo3aEPz7eXOMx/OdPEOKDZuCXs16pX2hLPzzNzZezxY10h
5i/MSAqxIFFEYefRYMwX9qlj8JZ8Sd6DDi1o4sDlDhVhVCrAtdw+Xgk8n/3Ebat/
y4QO0ZMrGcVMCogtMJdFAvhX+l18kw4/6D/t6Gmt9WI9G1jc8fE/bCXBvW+MIe20
WNFLV9H/KUh8rgVo6v5XAytpiLzWZBxY9qyeSfj6IXXrWa2KLAfhGJHFVfSiVh8I
mHjSfvnq/w8yYdcJAgouL/4E+Gm2/eZLVZcIgUviKC9l1N4wcF2Zn+ODiMsycfK1
KGRwq/EaP3yI1cQnGia+JoJwyPdCZ0mq4MP2jsz7ZXIEKN5XnT4OBI8x/t9i2TEv
4kPoS8AbAwvtLEt3tN15UXGOO2d7Sna9T8KNFe3jKS+f8lRh4mTRyOfN91XLtJTu
vDdRittf/RMpX77/PAr5
=GQJT
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
