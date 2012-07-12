From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 12 (pci)
Date: Thu, 12 Jul 2012 09:11:10 -0700
Message-ID: <4FFEF71E.7080706@xenotime.net>
References: <20120712160335.9cbff13c2f18eadc7d3cb0cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20120712160335.9cbff13c2f18eadc7d3cb0cf@canb.auug.org.au>
Sender: linux-pci-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 07/11/2012 11:03 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120710:
> 
> 
> The pci tree lost its conflicts.


on x86_64:

drivers/built-in.o: In function `pci_bus_add_device':
(.text+0x4f62): undefined reference to `pci_fixup_final_inited'


when CONFIG_PCI_QUIRKS is not enabled.


-- 
~Randy
