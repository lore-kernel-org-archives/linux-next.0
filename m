From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the vfs tree with the ia64 tree
Date: Wed, 3 Apr 2013 10:07:02 +1100
Message-ID: <20130403100702.3396b4c87f4867bf5907dcd4@canb.auug.org.au>
References: <20130402112017.8c5e288cbbd31f93788df9d5@canb.auug.org.au>
	<3908561D78D1C84285E8C5FCA982C28F1E09672C@ORSMSX108.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__3_Apr_2013_10_07_02_+1100_/A1enS5qlO4dKgun"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3908561D78D1C84285E8C5FCA982C28F1E09672C@ORSMSX108.amr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__3_Apr_2013_10_07_02_+1100_/A1enS5qlO4dKgun
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Tue, 2 Apr 2013 16:42:27 +0000 "Luck, Tony" <tony.luck@intel.com> wrote:
>
> > Today's linux-next merge of the vfs tree got a conflict in
> > arch/ia64/kernel/palinfo.c between commit 40c275bd92b8 ("[IA64] Fix sta=
ck
> > overflow in create_palinfo_proc_entries") from the ia64 tree and commit
> > d8e904861a28 ("palinfo fixes") from the vfs tree.
> >
> > I fixed it up (arbitrarily choosing the vfs tree version) and can carry
> > the fix as necessary (no action is required).
>=20
> It looks like you picked the version from the ia64 tree - but it would ha=
ve
> been better to pick Al's version. He wastes less space on the stack by on=
ly
> declaring cpustr[3+4+1] instead of cpustr[32], but more importantly he
> checks the return value from proc_mkdir().

I actually (effectively) dropped Al's tree due to a build error (after
making the "correct" choice).  It will be back in today.

> I'll drop 40c275bd92b8 out of my tree so Al's can go in without a conflic=
t.

OK.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__3_Apr_2013_10_07_02_+1100_/A1enS5qlO4dKgun
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRW2SWAAoJEECxmPOUX5FEXSMP/AtcRyDsoRfpJBdxRof/VFkW
roMLEs3K5NyuzQz9noMzirV438AqDNLxNy7KcVtkndYejWHL1H+ziJ1bVIobZPgf
5ZQ5zLgWXJUb5j9rKvhboa8c4HNMwVgNrCSHZ9QxnJOsQXF8MrDBgTytjL44hUPP
4uwyt3BNdOfYEzy8sXy3mmEWGAgwQ0IoCT0nO9wZ5WaCsAgzCcP70oYMCmkLKLhE
bvKFnbi6I9XPOI4ab/UONjXNjadj/hJGp0tQIGDsW2wvCOSB5KYyI9TLd9yAaxpy
AWB9+dJySMfbYApI0RpAD47uKd5owzGlMOcFPxqDCU0okpOO2AQnjzXGneCSXaGX
S99JKD744tDZ/ZEiZ4lP4WY+w08pqvNrgYaHZdBTVlwllGM7EdbEk7jfcCe5JncN
4/cYYR3JwpBufZhQfSP64kYYlQ5/o6I7pTcK1xDSrtmPABKSXgJFCYmvwZJUFVMG
I/xjtpXEJNFkff8laQhbCZU9Ish2qVAru41l17RGXAiEGWUM+6TiIaAW/oAxFday
l31iFIGu9qSaoAQt+5l/Z7KIU6ti9NEkp9Egh3rBo1fb/kLqFVFfS8fStSAtdHPA
XAwhIzup0eym5VTKE7GpinN/wahzDMyGNGRXBDEX/i1lT2PWP4vj9ttJkTIUoF5U
FzPA+gFOoyFmc6+9uB8X
=RG64
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Apr_2013_10_07_02_+1100_/A1enS5qlO4dKgun--
