From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Next: please switch the GPIO tree to mine
Date: Fri, 6 Jul 2012 08:41:29 +1000
Message-ID: <20120706084129.e0e59f36c8660381dea39526@canb.auug.org.au>
References: <CACRpkdb+5ATkMQrW4jBDUyWn2cSRnvyoFyGnFEJQJAO9XkdM2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__6_Jul_2012_08_41_29_+1000_UR2n1uZTTPuZC3Wb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:42182 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932497Ab2GEWlk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Jul 2012 18:41:40 -0400
In-Reply-To: <CACRpkdb+5ATkMQrW4jBDUyWn2cSRnvyoFyGnFEJQJAO9XkdM2A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>

--Signature=_Fri__6_Jul_2012_08_41_29_+1000_UR2n1uZTTPuZC3Wb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 5 Jul 2012 16:04:09 +0200 Linus Walleij <linus.walleij@linaro.org> =
wrote:
>
> Grant asked me to take over the GPIO tree for a while.
> (See: https://lkml.org/lkml/2012/7/1/220)
>=20
> Can you please replace Grants tree:
> gpio-current    git     git://git.secretlab.ca/git/linux-2.6#gpio/merge
>=20
> With this one:
> gpio git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git#for-next

I have added this tree (as requested by Grant) from today.  I called it
gpio-lw with just you as the contact.

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

--Signature=_Fri__6_Jul_2012_08_41_29_+1000_UR2n1uZTTPuZC3Wb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJP9hgZAAoJEECxmPOUX5FEPMUP/2w83K+6mqoSMKmul4TWxCyc
Okxwx7P4CWA+WXACOfcy2UJPvVTus2K7ZH0zRQIMZjU+lXl2XLmZzzEShacU7IDD
hxcP7id1Bo0gKbwHza9dH346147Lr8koujXL8CkJaaWJLr8bd5/4IAPFMNi9LaIi
3/LDtFou0KbAVzSkTtxeZMYlFPqaDW3dlajq7JFxx+wFxEeOlLS+fVm21rEqXtfB
AGGRxHiT9yFWt0mvV7q7Y02tmI4NEA/79m4uMGrGNnWVLTlHAsALBOSUKWc8pp3g
qqE+8KpTRk72kl/Tb6gRGFDGFRRuiyI/0g3Dhv828NzmZj1Nk671lPPC4dqo2EbZ
8+vCTCr2Gk/e3VERcesA8ZJ2gKjCmzQ0ZcfOFbgq8rjEQwnuwVlV8MDCyMLa3n3I
gVlmaY77hTHa72ZD79QKaXiRO09vzvuzsr54GbqwjCg+napH12uG9YMN0BbOVs9F
w91sCmuEdkj1jHP0Oo6FC8MO418r4BM3+2ymDGpL68LOrMFLbsrisSJ/7InwfvRs
Ufwp4LxGk0yicFi017TO3Lhf6Pw8GjTXiQnY4FUuRYRsgMzdFk+GIw0CZhQ32GgV
+3RktbH/AwQu7762BscdXegMnjwFrYWph7vN40xXrorq6k/W2wonFnM2pJMeOba7
WdRP9ufmo8E21WxtnJ22
=Z+5+
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Jul_2012_08_41_29_+1000_UR2n1uZTTPuZC3Wb--
