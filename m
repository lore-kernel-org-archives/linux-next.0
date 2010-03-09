From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] i2c: update for semaphore to mutex conversion of
 devices
Date: Tue, 9 Mar 2010 12:50:37 +1100
Message-ID: <20100309125037.5a218f22.sfr@canb.auug.org.au>
References: <20100309102828.18351564.sfr@canb.auug.org.au>
	<20100308235953.GA7808@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Mar_2010_12_50_37_+1100_tjW3/Zze3M24WQsh"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100308235953.GA7808@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Jean Delvare <khali@linux-fr.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__9_Mar_2010_12_50_37_+1100_tjW3/Zze3M24WQsh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 8 Mar 2010 15:59:53 -0800 Greg KH <greg@kroah.com> wrote:
>
> On Tue, Mar 09, 2010 at 10:28:28AM +1100, Stephen Rothwell wrote:
> > I have been carrying this patch in linux-next for some time and now
> > mainline needs it.
>=20
> Well, it's not required, but it is nice to have.  I didn't merge the
> "convert the driver core semaphore to a mutex" patch as it was causing
> too many false-positive lockdep warnings.

Ah, I missed that, sorry.

Strangely, I was assuming that what was in linux-next would get merged :-)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Mar_2010_12_50_37_+1100_tjW3/Zze3M24WQsh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuVqW0ACgkQjjKRsyhoI8wEjACgqdkzGRZzisEjHytZ5eLbkfKx
um0An23enf0N5MicwVuTlJ/htjai6uKo
=gLgi
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Mar_2010_12_50_37_+1100_tjW3/Zze3M24WQsh--
