From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 6 (acpi: PCI=n)
Date: Thu, 6 May 2010 08:07:22 -0700
Message-ID: <20100506080722.3b724475.randy.dunlap@oracle.com>
References: <20100506151502.f97afe54.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20100506151502.f97afe54.sfr@canb.auug.org.au>
Sender: linux-acpi-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-acpi@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 6 May 2010 15:15:02 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100505:


When CONFIG_PCI is not enabled:

arch/x86/kernel/acpi/boot.c:1034: error: 'pci_bus_type' undeclared

drivers/acpi/reboot.c:30: error:implicit declaration of function 'pci_find_bus'
drivers/acpi/reboot.c:30: warning: assignment makes pointer from integer without a cast
drivers/acpi/reboot.c:38: error:implicit declaration of function 'pci_bus_write_config_byte'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
