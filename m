From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Tue, 27 Sep 2016 13:15:42 -0400
Message-ID: <57EAA93E.10106@redhat.com>
References: <20160927112334.3615159e@canb.auug.org.au>
 <20160927050415.GA2024@lst.de> <20160927154820.11d17334@canb.auug.org.au>
 <20160927133949.GA21231@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="jwvQivGvojhPFGdNvimsKJEknXAb3HO8C"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43556 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750899AbcI0RPp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Sep 2016 13:15:45 -0400
In-Reply-To: <20160927133949.GA21231@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jwvQivGvojhPFGdNvimsKJEknXAb3HO8C
Content-Type: multipart/mixed; boundary="gfbD3BXMnGnXTAxBbKK0WcUTrgH9Qsx5g"
From: Doug Ledford <dledford@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <57EAA93E.10106@redhat.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
References: <20160927112334.3615159e@canb.auug.org.au>
 <20160927050415.GA2024@lst.de> <20160927154820.11d17334@canb.auug.org.au>
 <20160927133949.GA21231@lst.de>
In-Reply-To: <20160927133949.GA21231@lst.de>

--gfbD3BXMnGnXTAxBbKK0WcUTrgH9Qsx5g
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 9/27/16 9:39 AM, Christoph Hellwig wrote:
> On Tue, Sep 27, 2016 at 03:48:20PM +1000, Stephen Rothwell wrote:
>> Yeah, sorry.  Note, however, that you bothered to fix up this same
>> staging file in another of your patches ...
>=20
> It's generally not that I don't fix them up because I hate them, it's
> just because they are doing something so incredibly stupid that it woul=
d
> take forever to fix up (and something that would have been could if it
> ever had been through review).   For this particular case I think every=
one
> would be served much better if this module was simply dropped from the
> tree, as there will be lots of future patches that will break it.
>=20

I don't know that I would drop them, but certainly turn them off.  They
can keep their driver up to date.

--=20
Doug Ledford <dledford@redhat.com>    GPG Key ID: 0E572FDD
  Red Hat, Inc.
  100 E. Davie St
  Raleigh, NC 27601 USA


--gfbD3BXMnGnXTAxBbKK0WcUTrgH9Qsx5g--

--jwvQivGvojhPFGdNvimsKJEknXAb3HO8C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCgAGBQJX6qk+AAoJELgmozMOVy/db3AP/iRVvfm4odXvTEvUonVZwqZn
MwdpNL7cHG30+Inizm1tblTgX9oqqZXV0FL31BQy6zPj7Xsks1YapHpTslNOGqfM
TREb7+L0Z08zDq6frEgnV/RnzBBrYpaSZe1v8BIf6Tpqov7NWjEfoh6dLHDmtLBF
szygcalC9e/iuUnOaisHEuk3ap1Jd3O5w6Hsr+L8Q21YghAi1j96hKdmPwc4/JnL
akNvH77R2y8A1pq2lrbU7P/hwKJbcmZ024+3gdompG4R54mtHkaskf5PQDhTBX8R
PWKHY48CenC2h8hIkN90qf29K5cAGn46xcdWS65sWrLxCVtjd+j14Xe/uEeeuBzL
dSyRfElYbSn3yKXnFZ+IM51aPbq2uhEjNzf6MuRnUDp8TQ97MtuI5VDkVx5ouIeL
ljY+jQncp0qDa/k+UAxCHtdzOXlr9LMo2Qirifhs6A+9Th7E2j05SbQ8lflVLrV5
+uNzKj50uEopNYQze36Nd3MaFO7Ne4C2Se7GjeSUxaTVIUtVjSWfY3uDV9zastip
lhh3x4XhpKtGCbMYo/ran04IOvQjbQMRWrvP/n6IAZ9eKGTmK2HY0o+xMYtjyXd4
Dn2+y6DjAoi0xAQUSma/Bk/KhskhqvD9LYOljHLbc7RWfTjil50ygHcWtsg//NTE
OTIfxVxIWzW/912hmrh+
=Xsho
-----END PGP SIGNATURE-----

--jwvQivGvojhPFGdNvimsKJEknXAb3HO8C--
