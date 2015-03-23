From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm-perf
 tree
Date: Tue, 24 Mar 2015 08:16:10 +1100
Message-ID: <20150324081610.52b1e92d@canb.auug.org.au>
References: <20150323113318.0319c248@canb.auug.org.au>
	<CAM4voanC-ur=A-UJ+Jw4qECUOnd-gZ2V87794tEVWJOqaqDT+g@mail.gmail.com>
	<55102DAF.7050206@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=oY/.D4qjXwpC_bI+cneY7h"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55102DAF.7050206@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Suzuki K. Poulose" <Suzuki.Poulose@arm.com>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Will Deacon <Will.Deacon@arm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-next.vger.kernel.org

--Sig_/=oY/.D4qjXwpC_bI+cneY7h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 23 Mar 2015 15:13:51 +0000 "Suzuki K. Poulose" <Suzuki.Poulose@arm.=
com> wrote:
>
> On 23/03/15 14:41, Abhilash Kesavan wrote:
> >
> > On Mon, Mar 23, 2015 at 6:03 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >>
> >> Today's linux-next merge of the arm-soc tree got a conflict in
> >> drivers/bus/Kconfig between commit c9966c98697a ("arm-cci: Split the
> >> code for PMU vs driver support") from the arm-perf tree and commit
> >> 13fbf3c8d0f7 ("drivers: bus: Sort Kconfig entries alphabetically") from
> >> the arm-soc tree.
> >>
> >> I fixed it up (see below) and can carry the fix as necessary (no action
> >> is required).
> >
> > Not sure if this has been reported elsewhere, but I am seeing core
> > boot-up failures on the exynos5420 with next-20150323 due to this.
> > Your conflict fix is missing the ARM_CCI symbol because of which the
> > CCI does not get enabled.
> >
> > Suzuki, can you confirm ?
>=20
> Yes, you are right. We need the config ARM_CCI even now, which enables=20
> the building of the arm-cci.c.
>=20
> Stephen,
>=20
> We need the following fix on the linux-next.

Oops, sorry about that.  I have fixed up the merge resolution for today
so that file starts like this:

#
# Bus Devices
#

menu "Bus devices"

config ARM_CCI
	bool

config ARM_CCI400_COMMON
	bool
	select ARM_CCI

config ARM_CCI400_PMU
	bool "ARM CCI400 PMU support"
	default y
	depends on ARM || ARM64
	depends on HW_PERF_EVENTS
	select ARM_CCI400_COMMON
	help
	  Support for PMU events monitoring on the ARM CCI cache coherent
	  interconnect.

	  If unsure, say Y

config ARM_CCI400_PORT_CTRL
	bool
	depends on ARM && OF && CPU_V7
	select ARM_CCI400_COMMON
	help
	  Low level power management driver for CCI400 cache coherent
	  interconnect for ARM platforms.

config ARM_CCN
	.
	.
	.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/=oY/.D4qjXwpC_bI+cneY7h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVEIKfAAoJEMDTa8Ir7ZwVr8IP/19mePYh9XQgXFTcoskO/GvT
LiMV8yv94BJ0HcbjuJ3u5h8B/Na0DQcrD/dAlaCgAj/wMsWHF8QqVTlvTJJatoxy
AZpHiNIBrSMbB827/lLFZWcBiAgLFbasuTua0gI3BVwVNAtsVuAWIcsfoLW9AE3J
g87hXYqwkD/pmYZiUonbxKo/RI8rWeyC4rwJvbNDuW91eLE1oLN6LUTIxjpbRpxm
BzbAN/AJm03P6VbfHic3sBx772ux7UgzIfk5v8oWS/vguA6s9H6gFtSOiiww/1pH
J+zNJue24GnfT+lIV1/0BKeFtQjn8r2Ki6DFRGmilCnGhsRpFkBz1xwIMUldwtOP
WbvB+MLQVAIA1PEuK6lCVPK6j1bug+sN88TqexwbsjNyvFiZ4AWNXLNhdIrWfJ3A
y30us4I9MnlivQZE+WDnD5OhIX0K+0KfYztEQQGIYjAPFGDn0oGw7NLVi1wnXwhG
ROTNLMsPTet/5RTHRNq02ge95cDsUsYfuBs/43eUitqvfMVHp+nY48H71FUgyCqO
RFOx9dzrzKUiVMoDIcP8NrmHZhmLTlQvMf0GriG9MCnWRbJNIvhq7VsWQV0xe/j9
q1tk/wZWzCa0UU0vsJy7xpn5PweMoajD6npC6KlnDFnSV19cNFqYfJ9HQ4K1uLPu
apSI4qw8QAIWQzET0hO0
=MGCv
-----END PGP SIGNATURE-----

--Sig_/=oY/.D4qjXwpC_bI+cneY7h--
