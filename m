From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the at91 tree with the arm-soc tree
Date: Fri, 31 Jul 2015 09:09:16 +0200
Message-ID: <55BB1F1C.6000501@atmel.com>
References: <20150731083803.71c9d466@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150731083803.71c9d466@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>
List-Id: linux-next.vger.kernel.org

Le 31/07/2015 00:38, Stephen Rothwell a =E9crit :
> Hi Nicolas,
>=20
> Today's linux-next merge of the at91 tree got a conflict in:
>=20
>   arch/arm/mach-at91/sama5.c
>=20
> between commit:
>=20
>   19c233b79d1a ("ARM: appropriate __init annotation for const data")
>=20
> from the arm-soc tree and commit:
>=20
>   a6e41317b9b8 ("ARM: at91/soc: add basic support for new sama5d2 SoC=
")
>=20
> from the at91 tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).

The merge is correct. Thanks Stephen!

Bye,
--=20
Nicolas Ferre
