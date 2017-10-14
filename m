From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 13th (drivers/mfd/lpc_ich ->
 mtd/spi-nor/intel-spi-platform)
Date: Fri, 13 Oct 2017 17:31:27 -0700
Message-ID: <b6c40f74-2a08-13b2-70c1-2a7fce2ca1ef@infradead.org>
References: <20171013210628.izp3bf4glwa5kq7h@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:49422 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753230AbdJNAbh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Oct 2017 20:31:37 -0400
In-Reply-To: <20171013210628.izp3bf4glwa5kq7h@sirena.co.uk>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Bin Meng <bmeng.cn@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

On 10/13/17 14:06, Mark Brown wrote:
> Changes since 20171012:
> 
> The rdma tree gained a conflict.


on i386:

CONFIG_PCI is not enabled.

../drivers/mfd/lpc_ich.c: In function 'lpc_ich_init_spi':
../drivers/mfd/lpc_ich.c:1137:3: error: implicit declaration of function 'pci_bus_write_config_byte' [-Werror=implicit-function-declaration]
   pci_bus_write_config_byte(bus, p2sb, 0xe1, 0x0);
   ^
../drivers/mfd/lpc_ich.c:1138:3: error: implicit declaration of function 'pci_bus_read_config_dword' [-Werror=implicit-function-declaration]
   pci_bus_read_config_dword(bus, spi, PCI_BASE_ADDRESS_0,
   ^
../drivers/mfd/lpc_ich.c:1147:5: error: implicit declaration of function 'pci_bus_write_config_dword' [-Werror=implicit-function-declaration]
     pci_bus_write_config_dword(bus, spi, BCR, bcr);
     ^
../drivers/mfd/lpc_ich.c: At top level:
../drivers/mfd/lpc_ich.c:1246:1: warning: data definition has no type or storage class [enabled by default]
 module_pci_driver(lpc_ich_driver);
 ^
../drivers/mfd/lpc_ich.c:1246:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Werror=implicit-int]
../drivers/mfd/lpc_ich.c:1246:1: warning: parameter names (without types) in function declaration [enabled by default]
../drivers/mfd/lpc_ich.c:1239:26: warning: 'lpc_ich_driver' defined but not used [-Wunused-variable]
 static struct pci_driver lpc_ich_driver = {
                          ^
cc1: some warnings being treated as errors
../scripts/Makefile.build:313: recipe for target 'drivers/mfd/lpc_ich.o' failed
make[3]: *** [drivers/mfd/lpc_ich.o] Error 1


But that driver depends on PCI, so it should not be built.
This was caused by:

CONFIG_SPI_INTEL_SPI=y
CONFIG_SPI_INTEL_SPI_PLATFORM=y

where the latter does this:

config SPI_INTEL_SPI_PLATFORM
	tristate "Intel PCH/PCU SPI flash platform driver" if EXPERT
	depends on X86
	select SPI_INTEL_SPI
	select LPC_ICH

even though CONFIG_PCI is not enabled.  That's a no-no.


-- 
~Randy
