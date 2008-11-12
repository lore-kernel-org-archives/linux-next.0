From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the creds tree
Date: Thu, 13 Nov 2008 09:32:53 +1100
Message-ID: <20081113093253.ba7c6cbc.sfr@canb.auug.org.au>
References: <20081112163006.d526f0eb.sfr@canb.auug.org.au>
	<2867.1226514216@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__13_Nov_2008_09_32_53_+1100_.XaFyxxPk7MPlm4o"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56050 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751206AbYKLWdH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 17:33:07 -0500
In-Reply-To: <2867.1226514216@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org

--Signature=_Thu__13_Nov_2008_09_32_53_+1100_.XaFyxxPk7MPlm4o
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, 12 Nov 2008 18:23:36 +0000 David Howells <dhowells@redhat.com> wrot=
e:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Today's linux-next merge of the creds tree got a conflicts in
> > security/keys/internal.h and security/keys/process_keys.c between commit
> > 1f8f5cf6e4f038552a3e47b66085452c08556d71 ("KEYS: Make request key
> > instantiate the per-user keyrings") from Linus' tree and
> > f71e534c1149637f4eb186b351e6afeb8584551c ("KEYS: Alter use of key
> > instantiation link-to-keyring argument") from the creds tree.
> >=20
> > It needs local knowledge to fix up, so I will drop the creds tree for
> > today.
>=20
> I've pushed a merge of that.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__13_Nov_2008_09_32_53_+1100_.XaFyxxPk7MPlm4o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkbWZUACgkQjjKRsyhoI8wvoACfZdkEW9rKCrj4D0xrOwqcvaTN
vHkAnRYdhvtWJP8/+STmCw0JCM8xD4xL
=5dUW
-----END PGP SIGNATURE-----

--Signature=_Thu__13_Nov_2008_09_32_53_+1100_.XaFyxxPk7MPlm4o--
