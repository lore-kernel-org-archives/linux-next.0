From: Eric Anholt <eric@anholt.net>
Subject: Re: linux-next: build warnings after merge of the drm tree
Date: Fri, 02 Jun 2017 17:45:10 -0700
Message-ID: <8737bhlx0p.fsf@eliezer.anholt.net>
References: <20170519120729.597f5a9e@canb.auug.org.au> <87y3tsg2jx.fsf@eliezer.anholt.net> <20170525114933.1e1dea04@canb.auug.org.au> <20170602135925.70272f31@canb.auug.org.au> <87poem85it.fsf@eliezer.anholt.net> <20170603094037.7aa077d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:60378 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751061AbdFCApO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 2 Jun 2017 20:45:14 -0400
In-Reply-To: <20170603094037.7aa077d9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Cooksey <tom.cooksey@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Caesar Wang <wxt@rock-chips.com>, Mark Yao <mark.yao@rock-chips.com>

--=-=-=
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> On Fri, 02 Jun 2017 14:05:14 -0700 Eric Anholt <eric@anholt.net> wrote:
>>
>> Not sure what's going on.  I see your "yesterday" list present, and not
>> your "today" commit.
>
> I just refetched the drm-misc tree and received no changes.  It is
> still as I said in the previous email.  This tree is fetched from the
> drm-misc-next branch of git://anongit.freedesktop.org/drm/drm-misc
>
> The single commit currently in that branch was authored by "Caesar Wang
> <wxt@rock-chips.com>" and committed by "Mark Yao
> <mark.yao@rock-chips.com>" (both now cc'd).

I see that commit in drm-misc-next-fixes, but not drm-misc-next.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkyBpcACgkQtdYpNtH8
nuj+RBAArbybrvrQKL01E/ISw/0ONrtIiu8qCyAON+SGWySdv23TxBlMqZ/flvga
5rsiJi9samI54L/cbQpNtC54Sz/GJSwAyDE+QNnbAQajbHDlWW6F0ee0MXogcv3q
8yK3srB9XF3QTirfy0XXn7t3j8X9A4wO6KXzBzdkMwGa6IGsghdFnkhobwlBEJPA
qBQhdeF0UiOZAj8EhoO1xEU7Dw0P61m0unYyRoTsoAvGPHk2m2wqNYORKxfpBT8S
i7nCJs5qclbqX2QK0JrKi6x07MEzB8jxTcsnegag5VOSLuQM7Rlb54g1eZbFrzM9
ShIF6+27rzowXdyba94CaQF4bnxJ2AS2UQKDPzjxYtA+GeawmweLR7cPB6nZVrHa
J0zZA2hOlDkXShlI3FTPlV1HDgQanQyDrJlvU2YwQlcILmZQBUmno/HHkGvUtTMI
7TSBorHQ64KlhjAulW7/6bU06txS6yXbusjMBrbfmPC5zrqp6+98XhL6FXCZk5D9
wKeQ9iFjfAX8DIW6qT6BN5b3a9Ahe6UghIwagkSulPdig5tjghW0YXJKc4Vbt1Y9
8Z+fktSy1YXvP4SNvKHeM1e3BXgx0P68uG8pVGcp9/W+MPj28kgkKQftJrfPkacn
ZA/NesqUQFCdD6Ef7Xv0JJS/FX4p+gpHRmxBttVr8ow9xh0tac4=
=yov0
-----END PGP SIGNATURE-----
--=-=-=--
