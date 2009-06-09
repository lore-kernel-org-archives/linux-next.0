From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net/wireless tree build failure
Date: Wed, 10 Jun 2009 00:02:06 +1000
Message-ID: <20090610000206.999e2865.sfr@canb.auug.org.au>
References: <20090609233357.5d3801a0.sfr@canb.auug.org.au>
	<1244555682.4672.7.camel@johannes.local>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__10_Jun_2009_00_02_06_+1000_QFkjpG_knd4Ilfn0"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1761674AbZFIOCW@vger.kernel.org>
In-Reply-To: <1244555682.4672.7.camel@johannes.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__10_Jun_2009_00_02_06_+1000_QFkjpG_knd4Ilfn0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

On Tue, 09 Jun 2009 15:54:42 +0200 Johannes Berg <johannes@sipsolutions.net=
> wrote:
>
> On Tue, 2009-06-09 at 23:33 +1000, Stephen Rothwell wrote:
>=20
> > Probably caused by commit 19d337dff95cbf76edd3ad95c0cee2732c3e1ec5
> > ("rfkill: rewrite") which added uses of ERR_PTR to inlines in rfkill.h
> > but did not include linux/err.h.
>=20
> Indeed. Something must be including linux/err.h for me, I'll send a fix.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__10_Jun_2009_00_02_06_+1000_QFkjpG_knd4Ilfn0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoua14ACgkQjjKRsyhoI8wXHwCfYMsCXgBSTwUgjBHov6+D6TUq
JjUAoJJxTr/iRL9mY94kaAQCRDin/064
=kt1y
-----END PGP SIGNATURE-----

--Signature=_Wed__10_Jun_2009_00_02_06_+1000_QFkjpG_knd4Ilfn0--
