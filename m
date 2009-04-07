From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH next] pci: fix build error with !PCIE_ECRC
Date: Tue, 7 Apr 2009 18:41:28 +0400
Message-ID: <a4423d670904070741h23ce6d10pf775b67c25f9899d@mail.gmail.com>
References: <20090407123707.GA18687@orion>
	 <20090407143248.GA21727@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20090407143248.GA21727@parisc-linux.org>
Sender: linux-pci-owner@vger.kernel.org
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, andrew.patterson@hp.com, jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org
List-Id: linux-next.vger.kernel.org

2009/4/7 Matthew Wilcox <matthew@wil.cx>:
> On Tue, Apr 07, 2009 at 04:37:08PM +0400, Alexander Beregalov wrote:
>> Fix this build error:
>> drivers/built-in.o: In function `pci_init_capabilities':
>> drivers/pci/probe.c:989: undefined reference to `pcie_set_ecrc_check=
ing'
>> drivers/built-in.o: In function `pci_setup':
>> drivers/pci/pci.c:2547: undefined reference to `pcie_ecrc_get_policy=
'
>
>> =C2=A0config PCIE_ECRC
>> =C2=A0 =C2=A0 =C2=A0 bool "PCI Express ECRC support"
>> - =C2=A0 =C2=A0 depends on PCI
>> + =C2=A0 =C2=A0 depends on PCI && PCIEPORTBUS
>
> How does this part of the patch relate to the above description?

Right, I agree. This should be another patch "PCIE_ECRC should depend o=
n PCIE"

When I found this problem PCIE_ECRC was set, but was not be built in.
My problem needs both patches to be fixed, I will send them few hours l=
ater.
