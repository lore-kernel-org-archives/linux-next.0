From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH] PCI: mvebu: Restrict build to 32-bit ARM
Date: Thu, 18 Feb 2016 15:34:30 +0100
Message-ID: <87egcaqe89.fsf@free-electrons.com>
References: <1455802330-17565-1-git-send-email-thierry.reding@gmail.com>
	<5051836.EUN3ennYNm@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5051836.EUN3ennYNm@wuerfel> (Arnd Bergmann's message of "Thu, 18
	Feb 2016 15:06:23 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: linux-next.vger.kernel.org

Hi Arnd,
=20
 On jeu., f=C3=A9vr. 18 2016, Arnd Bergmann <arnd@arndb.de> wrote:

> On Thursday 18 February 2016 14:32:10 Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>=20
>> This driver uses PCI glue that is only available on 32-bit ARM. This
>> used to work fine as long as ARCH_MVEBU and ARCH_DOVE were exclusive=
ly
>> 32-bit, but that's changed now, with ARCH_MVEBU also being available
>> on 64-bit ARM.
>>=20
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>
> Looks fine as a temporary workaround, but I think what we really want=
 to
> do here is to remove the dependency, as the new ARM64 platforms are g=
oing
> to need this driver anyway.

Actually the mvebu ARM64 platform we know about (Armada 3700, 7K and
8K), won't use the same controller. A7K/A8K will use a synopsis IP and
Armada 3700 a new Marvell IP.

So for me depending on ARM32 is enough.

Gregory

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
