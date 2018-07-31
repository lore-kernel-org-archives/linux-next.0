From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the pm tree
Date: Tue, 31 Jul 2018 10:39:23 +1000
Message-ID: <20180731103923.47c7c294@canb.auug.org.au>
References: <20180730120053.62732d27@canb.auug.org.au>
        <20180730072445.kt2yxxifx4i7y3fr@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cIUv3ou4LxH=jOVXGf4L2o0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730072445.kt2yxxifx4i7y3fr@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: linux-next.vger.kernel.org

--Sig_/cIUv3ou4LxH=jOVXGf4L2o0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 30 Jul 2018 10:24:45 +0300 Sakari Ailus <sakari.ailus@linux.intel.c=
om> wrote:
>
> On Mon, Jul 30, 2018 at 12:00:53PM +1000, Stephen Rothwell wrote:
> >=20
> > After merging the pm tree, today's linux-next build (x86_64 allmodconfi=
g)
> > produced this warning:
> >=20
> > drivers/media/i2c/mt9v111.c: In function 'mt9v111_set_format':
> > drivers/media/i2c/mt9v111.c:887:15: warning: 'idx' may be used uninitia=
lized in this function [-Wmaybe-uninitialized]
> >   unsigned int idx;
> >                ^~~
> >=20
> > Introduced by commit
> >=20
> >   aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
> >=20
> > Looks like a false positive, but not something that gcc can easily see.=
 =20
>=20
> This must be coming from a new driver merged to media tree recently. Than=
ks
> for reporting this.

Yeah, sorry, process failure.  This should have been reported against
the v4l-dvb tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/cIUv3ou4LxH=jOVXGf4L2o0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltfr7sACgkQAVBC80lX
0GzvLgf/bhtKo4+1OmwV+KOKis2Z4fwwj0KbkV5/cEn1mQnDN+5RBwAZjPjIV75Y
/SWpPRh/B9riwAjZ3geVRkky7mf/x7yoBxVafM9tdAV1+DjPO645rYQZ1jmGYxbG
qEN/p1NXyE7bkw9CLLPtt6pfr8ImMNj0ugtODNZpgkfbXG7uk/60z06HIXu36Vdv
vE4nKWmRi8YdJFHWn+6sjshRVG4aiYAjRgWubGxwuRuHBcvh1xEI2C/ud0kg7ZVm
MV1STUnfjDtUFT/NlrCZT+dinQ5TSy9xIese/GXnvoMAVglSPlCe1+i3T63CHVbH
nhVxoHWGLZb9lZ+lz5PW0uPT6w+WYQ==
=po4R
-----END PGP SIGNATURE-----

--Sig_/cIUv3ou4LxH=jOVXGf4L2o0--
