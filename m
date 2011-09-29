From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please include pin control subsystem in linux-next
Date: Fri, 30 Sep 2011 09:02:28 +1000
Message-ID: <20110930090228.f3766d7980253bc54a1be723@canb.auug.org.au>
References: <CACRpkdZcQU6pGrsZ684GvK9T8jD0qVKx6wx8kwdT=Qd7+1QwCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__30_Sep_2011_09_02_28_+1000_PbGCvcUb6zAs2f/w"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:36407 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756920Ab1I2XCg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Sep 2011 19:02:36 -0400
In-Reply-To: <CACRpkdZcQU6pGrsZ684GvK9T8jD0qVKx6wx8kwdT=Qd7+1QwCw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org

--Signature=_Fri__30_Sep_2011_09_02_28_+1000_PbGCvcUb6zAs2f/w
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 29 Sep 2011 14:57:41 +0200 Linus Walleij <linus.walleij@linaro.org>=
 wrote:
>
> my pin control subsystem is maturing, so could you please
> include this in linux-next:
>=20
> git://git.linaro.org/people/triad/linux-pinctrl.git for-next

I have added your tree from today.

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

--Signature=_Fri__30_Sep_2011_09_02_28_+1000_PbGCvcUb6zAs2f/w
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOhPkEAAoJEDMEi1NhKgbsz2MH/1eGofBKLQy+w+UgkBg8I0Zs
zETrEX8dGMAVwgdn6alWwJvp5NRqqUHMi4WMJfOq9/xMDcFIZNUSorV5M9KoBcPt
rCL66fnYaaRpBVjisCqP01CuOZghn+tN1Nn7ms8rEPRRsHji2Ialv01BGL5g5w/X
rLebIFjqwElZ/UyrT5oZkBQYKUp06h/57VlbAAkxC/mEC6v5DFwT3ewWBrlIlgFN
bZ+zNe6qPP4/7XIrb6pbDUT6FQaOOeWcuTlUVBGpfPX4qJAfq/HflVKbQ1Jm+n0N
YrANEz+1Njwo4553/dVdDBB18UUO+eNcicDHrU/9/S/CH7DH1nVTKM9ExmTSUeQ=
=giGB
-----END PGP SIGNATURE-----

--Signature=_Fri__30_Sep_2011_09_02_28_+1000_PbGCvcUb6zAs2f/w--
