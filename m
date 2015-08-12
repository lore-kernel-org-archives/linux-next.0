From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] Bluetooth: hci_bcm: improve use of gpios API
Date: Wed, 12 Aug 2015 18:19:05 +1000
Message-ID: <20150812181905.78ade990@canb.auug.org.au>
References: <20150812165949.0d66f2be@canb.auug.org.au>
	<1439364056-8564-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41985 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753878AbbHLITI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 04:19:08 -0400
In-Reply-To: <1439364056-8564-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, Frederic Danis <frederic.danis@linux.intel.com>, Marcel Holtmann <marcel@holtmann.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, kernel@pengutronix.de

Hi Uwe,

On Wed, 12 Aug 2015 09:20:56 +0200 Uwe Kleine-K=C3=B6nig <u.kleine-koen=
ig@pengutronix.de> wrote:
>
> devm_gpiod_get currently has an optional parameter to set initial
> direction and value for the requested gpio. Make use of this to simpl=
ify
> the driver and make it not fail to build when this parameter is made
> mandatory (which is scheduled for 4.3-rc1).
>=20
> Moreover use the _optional variant of devm_gpiod_get to simplify erro=
r
> handling (which also gets more strict for free).
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> this is needed on top of commit 0395ffc1ee05 ("Bluetooth: hci_bcm: Ad=
d
> PM for BCM devices") incombination with b17d1bf16cc7 ("gpio: make fla=
gs
> mandatory for gpiod_get functions") which is currently sitting in nex=
t.
>=20
> Stephen fixed it up with a simpler patch, which works fine, but doesn=
't
> benefit from the nice things devm_gpiod_get et al offer.
>=20
> Best regards
> Uwe
>=20
>  drivers/bluetooth/hci_bcm.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)

I will use this instead of my simple patch tomorrow if the bluetooth
maintainer has not applied it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
