From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: xfs tree build failure
Date: Wed, 5 Nov 2008 13:20:00 +1100
Message-ID: <20081105132000.4e560cad.sfr@canb.auug.org.au>
References: <20081030132324.0d619fdd.sfr@canb.auug.org.au>
	<20081030090832.GQ17077@disturbed>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Nov_2008_13_20_00_+1100_t_BRxWqGCWmfMbZ3"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20081030090832.GQ17077@disturbed>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Dave Chinner <david@fromorbit.com>
Cc: xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, Lachlan McIlroy <lachlan@sgi.com>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__5_Nov_2008_13_20_00_+1100_t_BRxWqGCWmfMbZ3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, 30 Oct 2008 20:08:32 +1100 Dave Chinner <david@fromorbit.com> wrote:
>
> On Thu, Oct 30, 2008 at 01:23:24PM +1100, Stephen Rothwell wrote:
> >=20
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> >=20
> > ERROR: "inode_wait" [fs/xfs/xfs.ko] undefined!
> >=20
> > Caused by commit 676a7711ee281c3bf41db18e29e296584de82793 ("[XFS] Fix
> > race when looking up reclaimable inodes") which introduced a use of
> > wait_on_inode() which is an inline that calls inode_wait().
>=20
> Putting a non-exported symbol in an inline function in a header file
> that is full of exported functions.  That's pretty anti-social. ;)
>=20
> > I applied the following patch (probably wrong :-)).
>=20
> I think it's probably the only solution - we need to wait until
> the I_LOCK bit is cleared from the inode and AFAICT wait_on_inode()
> is the only way to do it.

Any resolution?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Nov_2008_13_20_00_+1100_t_BRxWqGCWmfMbZ3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkRAtAACgkQjjKRsyhoI8yd5wCdFYWW0QqCeh0K/Rm9DtMBSenF
eDoAn2cveyC26sNcrCYqn+WWsvJ8Z3wW
=Psn2
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Nov_2008_13_20_00_+1100_t_BRxWqGCWmfMbZ3--
