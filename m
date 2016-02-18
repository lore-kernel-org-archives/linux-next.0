From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] PCI: mvebu: Restrict build to 32-bit ARM
Date: Thu, 18 Feb 2016 15:41:45 +0100
Message-ID: <2551766.4Kx1a2F3t1@wuerfel>
References: <1455802330-17565-1-git-send-email-thierry.reding@gmail.com> <5051836.EUN3ennYNm@wuerfel> <87egcaqe89.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87egcaqe89.fsf@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: linux-next.vger.kernel.org

On Thursday 18 February 2016 15:34:30 Gregory CLEMENT wrote:
>  On jeu., f=E9vr. 18 2016, Arnd Bergmann <arnd@arndb.de> wrote:
>=20
> > On Thursday 18 February 2016 14:32:10 Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>=20
> >> This driver uses PCI glue that is only available on 32-bit ARM. Th=
is
> >> used to work fine as long as ARCH_MVEBU and ARCH_DOVE were exclusi=
vely
> >> 32-bit, but that's changed now, with ARCH_MVEBU also being availab=
le
> >> on 64-bit ARM.
> >>=20
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >
> > Looks fine as a temporary workaround, but I think what we really wa=
nt to
> > do here is to remove the dependency, as the new ARM64 platforms are=
 going
> > to need this driver anyway.
>=20
> Actually the mvebu ARM64 platform we know about (Armada 3700, 7K and
> 8K), won't use the same controller. A7K/A8K will use a synopsis IP an=
d
> Armada 3700 a new Marvell IP.
>=20
> So for me depending on ARM32 is enough.

Ah, that makes things much easier indeed.

Does this mean no more MBUS on the 64-bit platforms too?

	Arnd
