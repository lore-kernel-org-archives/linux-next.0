From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: creds tree build failure
Date: Fri, 17 Oct 2008 21:55:44 +1100
Message-ID: <20081017215544.c6192cdb.sfr@canb.auug.org.au>
References: <20081017172546.ee699528.sfr@canb.auug.org.au>
	<26969.1224239822@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__17_Oct_2008_21_55_44_+1100_DLLxKU9NjilTzfLe"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55923 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751142AbYJQKzx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 06:55:53 -0400
In-Reply-To: <26969.1224239822@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Ian Kent <raven@themaw.net>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Fri__17_Oct_2008_21_55_44_+1100_DLLxKU9NjilTzfLe
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Oct 2008 11:37:02 +0100 David Howells <dhowells@redhat.com> wrot=
e:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > +	const struct cred *cred =3D current_cred();
> > ...
> > -		filp =3D dentry_open(nd.path.dentry, nd.path.mnt, O_RDONLY);
> > +		filp =3D dentry_open(nd.path.dentry, nd.path.mnt, O_RDONLY,
> > +			cred);
>=20
> ACK...  Or you could pull the fix from JamesM's tree.

I'll get that in Monday.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__17_Oct_2008_21_55_44_+1100_DLLxKU9NjilTzfLe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj4bzAACgkQjjKRsyhoI8yxbgCeJdMOYGn90iUHIl25Ie9aCBxW
1GUAoJy4ehsqZMMBuQ2JdIT7geQda+pX
=IwO6
-----END PGP SIGNATURE-----

--Signature=_Fri__17_Oct_2008_21_55_44_+1100_DLLxKU9NjilTzfLe--
