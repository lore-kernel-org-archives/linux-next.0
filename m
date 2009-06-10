From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: next-20090609 hangs in early user mode
Date: Wed, 10 Jun 2009 18:46:07 +1000
Message-ID: <20090610184607.fd4122ad.sfr@canb.auug.org.au>
References: <20090610180058.99bd3dda.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__10_Jun_2009_18_46_07_+1000_C8rXlukwu8oBVimd"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20090610180058.99bd3dda.sfr@canb.auug.org.au>
Sender: linux-fsdevel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-next@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__10_Jun_2009_18_46_07_+1000_C8rXlukwu8oBVimd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jun 2009 18:00:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> commit d4fdcb2068eef29c03d6027aa219fa60171c6b87
> Author: Theodore Ts'o <tytso@mit.edu>
> Date:   Thu May 21 16:00:59 2009 -0400
>=20
>     fs: i_flags and i_state in struct inode only need to be unsigned short

I will revert that commit from linux-next today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__10_Jun_2009_18_46_07_+1000_C8rXlukwu8oBVimd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkovcs8ACgkQjjKRsyhoI8xfggCfTA1KWjV0iVzdaUWa6jh9zDF+
NmgAn03nSJbwBsoDRjnlSN+2T56DR1Kf
=y5oc
-----END PGP SIGNATURE-----

--Signature=_Wed__10_Jun_2009_18_46_07_+1000_C8rXlukwu8oBVimd--
