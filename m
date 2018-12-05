From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Add Thunderbolt tree to linux-next
Date: Thu, 6 Dec 2018 09:31:06 +1100
Message-ID: <20181206093106.70511c41@canb.auug.org.au>
References: <20181205113736.GM2469@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oIojDWPp.l3UCbgSPrOrW/G"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205113736.GM2469@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linux-Next <linux-next@vger.kernel.org>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>
List-Id: linux-next.vger.kernel.org

--Sig_/oIojDWPp.l3UCbgSPrOrW/G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mika,

On Wed, 5 Dec 2018 13:37:36 +0200 Mika Westerberg <mika.westerberg@linux.in=
tel.com> wrote:
>
> I maintain the Thunderbolt tree that gets merged to mainline via Greg's
> char-misc tree. I would like to get the tree included in linux-next to
> get wider coverage before it hits Greg's tree.
>=20
> Can you please include branches 'fixes' and 'next' from:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git
>    =20
> in linux-next?

Added from today (well the fixes tree will be added tomorrow - but it
was empty anyway).

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/oIojDWPp.l3UCbgSPrOrW/G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwIUaoACgkQAVBC80lX
0Gw6/wf/eeq8inNICyvIiS/ArSdmLq1BElOUfZzGDsKENAYxVzz4b4VSpPmEFS8+
067yF+QywrGndq669ByOSwBu4Z57BFZnL8W4UvRzkhjK1Pv2rF4e+SLTv2yCoLGy
gVjYgHKl+mtzgB7I6RHHDRwy2GfP66p4N6vqYMn7fjspguCKsFcqnffSZpxKpJO1
j6iyOWwmluqMnQnaPT54Yev0BXoAUBXHDE0khHpac+J+ZFWBDywV5ATqYYukGvvb
mWoPEX6wyugdR6N0FjqX/JAjBtvz6cWEh86bZOaWfTncBMoQi+Op7+juS8JbbVL7
j+o+ahyvDk5iyixrY0O2skXCi/GqYg==
=Bbp1
-----END PGP SIGNATURE-----

--Sig_/oIojDWPp.l3UCbgSPrOrW/G--
