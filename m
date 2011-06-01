From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next phase of tmem into linux-next
Date: Wed, 1 Jun 2011 14:25:44 +1000
Message-ID: <20110601142544.62494a52.sfr@canb.auug.org.au>
References: <80f7ab04-7ae6-48cb-b254-e99343147bf0@default>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__1_Jun_2011_14_25_44_+1000_wkVqLCoiRw.hbKz+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55908 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750746Ab1FAEZw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Jun 2011 00:25:52 -0400
In-Reply-To: <80f7ab04-7ae6-48cb-b254-e99343147bf0@default>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Magenheimer <dan.magenheimer@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Wilk <konrad.wilk@oracle.com>

--Signature=_Wed__1_Jun_2011_14_25_44_+1000_wkVqLCoiRw.hbKz+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Tue, 31 May 2011 17:49:21 -0700 (PDT) Dan Magenheimer <dan.magenheimer@o=
racle.com> wrote:
>
> Please re-include the following tree into linux-next.  The
> commit series is for frontswap, the complement of cleancache
> handling swap pages, which is the next phase in tmem.  It also
> includes the shim code to Xen tmem for frontswap.  It applies
> cleanly on linux-3.0-rc1, but if there are any problems or
> you have any questions, please let me know!
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/djm/tmem.git#linux-next

I don't remove trees from linux-next unless excplictly asked to, so this
tree is still included.  As long as you stick to the rules (posted,
reviewed, ready for Linus), anything you add to that tree will be
included.

The tree is still called "cleancache" in linux-next.  Should I change
that to something more generic?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__1_Jun_2011_14_25_44_+1000_wkVqLCoiRw.hbKz+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN5b9IAAoJEDMEi1NhKgbskEQH/0soyOi6YHl+Q4r7VhgAGY/L
4/Ry4n3ZIGRA/SsU7JZglKCki3hd5BRZyxdhjvnI7yGIFYcY/X3ODBIIGvv/k9ui
bA/K93rXOUO+V7wmIz9P6ewbMlg8efAaXHaRyUe0O/2tcD3VGUrTMyceScFM28jf
uSPq5Rd0v6F7mcGavkNhehAHX+sZZX/HBFHFp7vRo2j9+6q9QSzsBxvQ/PWpK0EB
6hBIaIiS0Y52GvJSzjUgfz54pEJSXqBAAFkM2BRarTf4REQJG2l9We4a5mUPwzVl
4VCnqDderXb/JdRjSenPfsoI2Qgtz1BgKgKnDgA0S2tY7s9cEjIZAGUzNLzTuY8=
=c32z
-----END PGP SIGNATURE-----

--Signature=_Wed__1_Jun_2011_14_25_44_+1000_wkVqLCoiRw.hbKz+--
