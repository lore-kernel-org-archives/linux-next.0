From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: genesis-2.6 tree addition request
Date: Mon, 8 Feb 2010 18:40:32 +1100
Message-ID: <20100208184032.65be574f.sfr@canb.auug.org.au>
References: <20100208043209.GA7674@linux-sh.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__8_Feb_2010_18_40_32_+1100_57CetGXW2g=unwsy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43074 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753134Ab0BHHki (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Feb 2010 02:40:38 -0500
In-Reply-To: <20100208043209.GA7674@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

--Signature=_Mon__8_Feb_2010_18_40_32_+1100_57CetGXW2g=unwsy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Mon, 8 Feb 2010 13:32:09 +0900 Paul Mundt <lethal@linux-sh.org> wrote:
>
> I'd like to get the genesis-2.6 tree rolled in to -next. This is
> primarily for supporting ARM-based SH-Mobile G-series CPUs, which were
> previously discussed on the ARM lists.
>=20
> There shouldn't be any ordering issues, but it would be ideal to place
> this after both the sh and arm trees in the merge order to avoid any
> future issues.

I have merged it last for today, but will put it after the sh tree from
tomorrow.

> The tree is at:
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/lethal/genesis-2.6.git
>=20
> and also contains the following defconfigs:
>=20
> 	ap4evb_defconfig
> 	g3evm_defconfig
> 	g4evm_defconfig
>=20
> which would be nice to have added to the ARM defconfig builds. Any issues
> that pop up with these configs are likely to be SH-related and ideally
> should come to me directly, rather than having to bother Russell with
> them.

I will add these to our builds.  I usually expect people to check these
build results for themselves and only occasionally look through them
myself,

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

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Mon__8_Feb_2010_18_40_32_+1100_57CetGXW2g=unwsy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktvv/AACgkQjjKRsyhoI8wo4QCgla8XDO9BkWcKHGHEnzaQGaEz
NQ8An34+QiBe8ytxvryGNWCeMXbCW4zL
=ZA2x
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Feb_2010_18_40_32_+1100_57CetGXW2g=unwsy--
