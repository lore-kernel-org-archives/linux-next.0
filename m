From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the pinctrl
 tree
Date: Mon, 26 Nov 2012 11:11:33 +0100
Message-ID: <50B34055.1000001@atmel.com>
References: <20121126203449.10d0d757dcddab773b308ee2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:22554 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753590Ab2KZKLh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Nov 2012 05:11:37 -0500
In-Reply-To: <20121126203449.10d0d757dcddab773b308ee2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-kernel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/26/2012 10:34 AM, Stephen Rothwell :
> Hi all,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in 
> arch/arm/boot/dts/Makefile between commit ec6754a7b9e9 ("arm: at91:
> dt: at91sam9 add serial pinctrl support") from the pinctrl tree and
> commit e8d623986990 ("Merge branch 'next/soc' into for-next") from
> the arm-soc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no
> action is required).

It seems to be the good way to fix it. Thanks Stephen, bye,
- -- 
Nicolas Ferre
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with undefined - http://www.enigmail.net/

iQEcBAEBAgAGBQJQs0BPAAoJEAf03oE53VmQTXwH/jMoCTS48phBHKB9kYSfPfkY
t9wgFhjTLOrtb/FCuoWxKPs1TN3F4t4zRcr4wRq+HvthuZ74kD+t6icoRxtjYkEB
Az8oSPN95///evy9ber+IbmJFJsxk6m9mcKTaJ6BYz3YhvA2CT0Qz4Z8c+1DbctC
kKsZ9Ngsb/suu/5xloPFdwO1KN5//PqPeOaXjlyY7eZabyIWf2u+OSG9rU0X3jH4
G+HXXW4AagUrxHrMY6CBKroXFj1VpVNyWq4EpQjmjjHuc01ofA5nLNmz99PW2wYX
2Xe/j8gUvE+3kmd+x7AV51NcZoGVDPDOYt0lTwjL6vXUwNxAgisOf5Be+nEA5f4=
=Y2lP
-----END PGP SIGNATURE-----
