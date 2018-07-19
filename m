From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Thu, 19 Jul 2018 15:29:40 +1000
Message-ID: <20180719152940.0720e9c1@canb.auug.org.au>
References: <20180719120447.6e7ba23d@canb.auug.org.au>
        <cbc20089-6847-c0eb-5b5a-735245986be1@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e5+CAYMH.q6.iaa5Y3=EoUM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cbc20089-6847-c0eb-5b5a-735245986be1@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-next.vger.kernel.org

--Sig_/e5+CAYMH.q6.iaa5Y3=EoUM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Wed, 18 Jul 2018 20:52:56 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 07/18/2018 07:04 PM, Stephen Rothwell wrote:
> >=20
> > After merging the net-next tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >=20
> > *
> > * Restart config...
> > *
> > ....
> >=20
> > This is output by my "make allmodconfig" and only started after merging
> > the net-next tree today.  It has continued for further merges/builds.
> >=20
> > I suspect commit
> >=20
> >    1323061a018a ("net: phy: sfp: Add HWMON support for module sensors")
> >=20
> > which added an "imply" clause.
> >  =20
> I thought "imply" was better than "depends on HWMON || HWMON=3Dn", but ma=
ybe
> not. Is that a caveat when using "imply", and does it mean that "imply"
> should better not be used ?

I don't know, sorry.  It was just my best guess from what I could see
had changed.

I wonder if it makes a difference that I am doing my "make
allmodconfig" on top of a previous "make allmodconfig" and some symbols
are marked as "NEW" (though they are not symbols related to the changes
that happened during the net-next tree merge)?
--=20
Cheers,
Stephen Rothwell

--Sig_/e5+CAYMH.q6.iaa5Y3=EoUM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltQIcQACgkQAVBC80lX
0GzSKAf/SqgxH+7fFTpXpnEb2ktajazR10djW9e7DzRsXrIJdJfKzF1SDfaQdF25
nop/mi1x3+Jsh0canYsqgUJ53ZUSN4hE2FabIxBBCHOOXDn7cpP6so0RkZ883KTt
6jaWMiYV9kKCpkMpz9yTyk2AUKFXvMQmXs4DC5OrSEtt6XXVTP29aLVqyePC+i5x
Vi9krLj1JMd8cNDgdvkfu43uUJjdErcO385rKg8PtLSy28ufmVZJ7XxdN6dp+NpB
WYqWZrzTqdZ02ymq/UW/dzWGQ4JeNNLfrmaArNQm4M2YWu25jfiNCV426919SkYi
XsDKezYl435FqSQxrA/ErFqRGpG4HA==
=YjxC
-----END PGP SIGNATURE-----

--Sig_/e5+CAYMH.q6.iaa5Y3=EoUM--
