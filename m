From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: please include init-v4.1-rc6 branch for v4.2
Date: Wed, 3 Jun 2015 13:39:04 +1000
Message-ID: <20150603133904.5d8b0bfb@canb.auug.org.au>
References: <20150602232318.GI29898@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F4+.KU_oxudJXmg/Z/h6ShK"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35371 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751673AbbFCDjL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Jun 2015 23:39:11 -0400
In-Reply-To: <20150602232318.GI29898@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/F4+.KU_oxudJXmg/Z/h6ShK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, 2 Jun 2015 19:23:18 -0400 Paul Gortmaker <paul.gortmaker@windriver.=
com> wrote:
>
> Please include init-v4.1-rc6 branch of:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git

OK, I will add it in just before I merge Andrew's tree and see how it
goes.

> I've been cross building it and test merging it with next on and off for
> several weeks now, so it should be trouble free (hopefully).  There will
> be two relatively trivial conflicts upon merging to next:
>=20
> 1) A removal of a __cpuinit from this tree will conflict with a removal
>    of the whole code block contaning the original __cpuinit in the file
>    arch/arm/mach-keystone/platsmp.c
>=20
> 2) A removal of a __CPUINIT from this tree will conflict with a complete
>    file removal (removed, not renamed) of arch/arm/mach-hisi/headsmp.S

Thanks for the heads up on these.

> Assuming I can get Linus to pull the chunks this time, it should be a
> one shot (one version) tree from a linux-next point of view.

If he takes it, please remind me to remove the tree.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
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

--Sig_/F4+.KU_oxudJXmg/Z/h6ShK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbnbdAAoJEMDTa8Ir7ZwVzXoP/3aVYL5UQbf1JJyldEa3Yv2m
7SB5uzJehnjaPIChTKuviB8m4HusfLnyyv52pDjLU/faTfQWrMixoTe6Rkhpggva
fP+v74DdG8LF1Qi0pXU03Unt9cOl1pazIw3aOHAU25aaAYfJBJLOhRUiHNzpMIv/
odvBMh2PTU9H63spJlV5fYEyIzkB45MHhpMV151WiWU8MU7yZ3jDC8xSbG2tWCwM
adYuRroFmSigUSN7iwkBiYd4HVv7AT6YdraxJKbLz/6TzsgtZW4ktXLji1ZcVqx4
ZaPYk1qGL6m410ZdEJ5n3hz/CBuJW1nnzcT2rLXcBNwMwfLjLlnUGrSS+HXvBKK7
i/rWqrqYqBJjSQAZSa8N10YvbaS702NeLi0Lezgf3HhdobgrvJYuzNuwFhXGx3d4
QJmvzDqUnYYhJCqzq6Z+5ajWT9m6kEyL2g3JjJN5kF+8TiBPO2gXzY2CcDCQcVgO
Q9gacbIxjfXKnHxnTZQ/LTH3Tt3xqBBkKqM/PB3cejwvcyg266jrGwMSY6vNM3ca
BGRs2ZWa7PTFV1NQZTVP5ORIzybc5uDxNgElGUsJmbX7s83WG0iH10aFPXB2/lII
TVLZ26AePJDLbJxkq75B0M9PJiiEbam+lnScr0OE66w29x9EY2FQXZVYsanYAp6T
ijJVroMKoLQx/Q0SQMl/
=bJE0
-----END PGP SIGNATURE-----

--Sig_/F4+.KU_oxudJXmg/Z/h6ShK--
