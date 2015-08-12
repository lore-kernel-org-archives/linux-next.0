From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] Bluetooth: hci_bcm: improve use of gpios API
Date: Wed, 12 Aug 2015 07:39:31 -0700
Message-ID: <342A6333-EC23-4743-8BD2-FC220A2F8B82@holtmann.org>
References: <20150812165949.0d66f2be@canb.auug.org.au> <1439364056-8564-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439364056-8564-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Gustavo F. Padovan" <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Frederic Danis <frederic.danis-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, inux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

Hi Uwe,

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
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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

patch has been applied to bluetooth-next tree.

Regards

Marcel
