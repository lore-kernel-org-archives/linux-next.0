From: Eric B Munson <emunson@akamai.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 20 Jul 2015 10:57:40 -0400
Message-ID: <20150720145740.GA5411@akamai.com>
References: <20150716152036.3551cef7@canb.auug.org.au>
 <55A7C18B.7030104@akamai.com>
 <20150717075258.77fc24ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150717075258.77fc24ce@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Jul 2015, Stephen Rothwell wrote:

> Hi Eric,
>=20
> On Thu, 16 Jul 2015 10:36:59 -0400 Eric B Munson <emunson@akamai.com> wro=
te:
> >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au> Date: Thu, 16 Jul
> > > 2015 14:58:53 +1000 Subject: [PATCH] mm: mlock: fix for add new
> > > mlock, munlock, and munlockall system calls
> > >=20
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au> ---=20
> > > arch/arm/include/asm/unistd.h | 2 +- arch/arm/kernel/calls.S
> > > | 2 +- 2 files changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/arch/arm/include/asm/unistd.h
> > > b/arch/arm/include/asm/unistd.h index 32640c431a08..2516c09d65d7
> > > 100644 --- a/arch/arm/include/asm/unistd.h +++
> > > b/arch/arm/include/asm/unistd.h @@ -19,7 +19,7 @@ * This may need
> > > to be greater than __NR_last_syscall+1 in order to * account for
> > > the padding in the syscall table */ -#define __NR_syscalls  (388)=20
> > > +#define __NR_syscalls  (392)
> >=20
> > IIUC, this should be 391.
>=20
> Read the comment above - it has to be 392 for padding.  (I actually
> tried 391 and it fails to build.)

I saw the comment but it wasn't clear to me what that padding value
should be (does __NR_syscalls need to be even, %4, %8, etc).  Is there
somewhere that I missed that describes what the padding needs to be and
when it should be present?

>=20
> BTW, what mail client are you using - it really made a mess :-(
>=20

That was thunderbird, which has started acting up on me, not sure why it
mangled everything.  Back to mutt now that I have my laptop back.
Hopefully this one is in better shape.


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVrQxkAAoJELbVsDOpoOa9g6AQAKX0m+Jaf21FD6x1CmfUbgI3
s64rcNuRby0TK9F3mDpg19dUU7ePT1bKjY6NvIEqMXzh2ULcLWa8HoosZ3GCxWEn
4xrX2lagCNku5kvvFrBewTXs5XFk/og9gFIeC+MDqR+VNS6TMCQEHIWPWnvsL3RJ
S54MYoB5HWEqew1KcaHAEFQN8KNIBDimUmbZNJwWXqKMDTdkjSnKl6q3vUr1SPOa
u8EDqzqSRm+B6dQoYQ8mfG9WdbN/EJp41PI2NTas60/rgi5wvkKetByqbp1ilU46
bCe2VFQRxt0BENY4PItyIE8MWWsb1ROYMdAhTJ8muNOD66eoFfvmF/tSBTyJA5p9
I//VPYt5Dumn1PwiKUgxY3tNGWaat3sc3Y8meAS1Kd8J6euLeBUuAC4czpvuuwO9
6ZPYW6KoW9+0qkWaIkXxUm6GxWpoaQ83ITw8/xPCrRyU1pFEdqodL+1SdsieyqQa
TanPBhKn9OkpJQAq0pRrpmF2QBXyN1UbN2Fsdz7OBrJTEn19ah33UoSXPjDbI5qm
XAkXgCPQsBOFYKWDZk4sBxvCnhLc2hUSnm5cvmiqTQhNyK/MqRXD1TAjOQcGI5Ya
fVH1FIPzAggXdDtFlKcAasDh22m7691/DD4E10StDERSA6f9XZ7x0IjTHKyWVt5L
vpoTdZk//Msfhj+5/lC6
=6DaA
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
