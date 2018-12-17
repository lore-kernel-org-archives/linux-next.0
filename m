From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Add secondary kgdb tree
Date: Tue, 18 Dec 2018 08:48:13 +1100
Message-ID: <20181218084813.03360386@canb.auug.org.au>
References: <20181217164253.5ficzs4zr4dxbemu@holly.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_FEzZclaidC3mbsmZDb2DHy"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217164253.5ficzs4zr4dxbemu@holly.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net
List-Id: linux-next.vger.kernel.org

--Sig_/_FEzZclaidC3mbsmZDb2DHy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, 17 Dec 2018 16:42:53 +0000 Daniel Thompson <daniel.thompson@linaro.=
org> wrote:
>
> Is there any change you could add my kgdb tree to the roster for
> linux-next :
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux.git kgdb/fo=
r-next
>=20
> I'm currently collecting kgdb patches for v4.21 together and at the
> moment it looks like the PR for kgdb will come from my tree this dev
> cycle.
>=20
> This will leave you with two kgdb trees in this list which I assume
> isn't great for you (although Jason's tree isn't really changing much
> at the moment so I guess merging it is a nop). Anyhow I've made a diary
> note to follow this up in two kernel cycles time and decide which one
> we want to keep on the roster. Is that OK for you?

Added from today.  I called it kgdb-dt but that can be changed if you
decide to replace Jason's tree with this one.

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

--Sig_/_FEzZclaidC3mbsmZDb2DHy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwYGZ0ACgkQAVBC80lX
0GyQ1wf/e5WXJTmLg29JEbKb5tf2bS0p9k0c7cc96zuFYnQ5M3768vyyYF5CeL/h
dGautkUUwYz5O4gAaIixFhTowRjyAifvMjxXFqCB7/3VnwnhPLZpQRenCfkvdN0H
mCEeGiD9ZaWSVmKKhb8ePHhNrej/jTJR8yVhlMBwAFNoLf5Efby62ziToK3ehvJC
2qDS0bbTegwu+n0ogr2fmmqJCO6yGoZpS8JwmEmBzxz5px0K3mkGDxekzkvoZp7o
4n2GvMXd4rLMUGLLXyzhKPqoJfHChejJyCMMauVnrOal8O8N9+JVD4gPTbP9zOJR
IGp+Mqn1YeSdskgz5vsahr0VuYyF3A==
=0Y7Y
-----END PGP SIGNATURE-----

--Sig_/_FEzZclaidC3mbsmZDb2DHy--
