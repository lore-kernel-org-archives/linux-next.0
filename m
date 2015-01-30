From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: linux-next: Tree for Jan 30 (build failures)
Date: Fri, 30 Jan 2015 17:01:58 +0100
Message-ID: <54CBAAF6.6030106@rempel-privat.de>
References: <20150130180209.2bd86cc4@canb.auug.org.au> <20150130142520.GA6872@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pI9QfeliA5KBojLPVLdQUn7WmbcIkWHiB"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150130142520.GA6872@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <matthew.r.wilcox@intel.com>, Linus Torvalds <torvalds@linux-foundation.org>, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pI9QfeliA5KBojLPVLdQUn7WmbcIkWHiB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Am 30.01.2015 um 15:25 schrieb Guenter Roeck:
> On Fri, Jan 30, 2015 at 06:02:09PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20150129:
>>
>> The arm-soc gained conflicts against the arm-current and arm trees.
>>
>> The spi tree gained a build failure for which I reverted a commit.
>>
>> Non-merge commits (relative to Linus' tree): 6300
>>  6348 files changed, 255117 insertions(+), 131620 deletions(-)
>>
>> ----------------------------------------------------------------------=
------
>=20
> Build failures below. I copied the culprits (including Linus ;-).
>=20
> Guenter
>=20
> =3D=3D=3D
> Building arc:defconfig ... failed
> Building arc:tb10x_defconfig ... failed
> --------------
> Error log:
> arch/arc/mm/fault.c: In function 'do_page_fault':
> arch/arc/mm/fault.c:164: error: 'VM_FAULT_SIGSEV' undeclared
>=20
> Typo. Caused by 33692f27597f ("vm: add VM_FAULT_SIGSEGV handling suppor=
t"),
> from mainline. I submitted a patch.
>=20
> =3D=3D=3D
> Building mips:allmodconfig ... failed
> --------------
> Error log:
>=20
> fs/built-in.o: In function `dax_fault':
> (.text+0x5e284): undefined reference to `copy_user_page'
>=20
> Caused by 4927b7d77c001 ("dax,ext2: replace the XIP page fault handler =
with the
> DAX page fault handler"). Looks like copy_user_page does not exist in m=
ips.
>=20
> =3D=3D=3D
> Building sparc64:allmodconfig ... failed
> --------------
> Error log:
> drivers/built-in.o: In function `asm9260_timer_init':
> asm9260_timer.c:(.init.text+0x60d4): undefined reference to `of_io_requ=
est_and_map'
>=20
> Caused by e4940cd76934 ("ARM: clocksource: add asm9260_timer driver").
> of_io_request_and_map does not exist for the sparc architecture.
> Maybe that driver should depend on ARM  or at least on !SPARC ?

White listing will be easiest way. Should i send patch for it, or it is
better to fixup existing patch?

--=20
Regards,
Oleksij


--pI9QfeliA5KBojLPVLdQUn7WmbcIkWHiB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlTLqv0ACgkQHwImuRkmbWloogD+JIkTCz85UXEjy7rPKY4ZnNbX
EeJOCjOdHYwipFmD9VAA/iZs790Qd7iWdhAQrWCxLQHsPQ6cG3I3lY8q4mJaZa19
=ZnG9
-----END PGP SIGNATURE-----

--pI9QfeliA5KBojLPVLdQUn7WmbcIkWHiB--
