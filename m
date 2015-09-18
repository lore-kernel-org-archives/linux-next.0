From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Sep 18 (build failures)
Date: Fri, 18 Sep 2015 07:22:04 -0700
Message-ID: <20150918142204.GA17018@roeck-us.net>
References: <20150918140810.6345bce9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150918140810.6345bce9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Zhang <zjzhang@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 18, 2015 at 02:08:10PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150917:
> 
> I used the h8300 tree from next-20150828 since the current tree has been
> rebased onto something very old :-(
> 
> The bluetooth tree still had its build failure.
> 
> The tip tree gained a conflict against Linus' tree.
> 
> The akpm-current tree lost its build failure.
> 
> Non-merge commits (relative to Linus' tree): 1938
>  1581 files changed, 83940 insertions(+), 23948 deletions(-)
> 

Build failures:

ia64:defconfig
ia64:allnoconfig

drivers/built-in.o: In function `efi_mem_attributes':
(.text+0xde962): undefined reference to `memmap'
drivers/built-in.o: In function `efi_mem_attributes':
(.text+0xde971): undefined reference to `memmap'

Bisect points to 'efi, x86: Rearrange efi_mem_attributes()'.
On a side note, 'memmap' is really a bad name for a global variable,
As the patch desciption suggests, the variable does not exist for ia64,
so the build failure is not entirely unexpected.

----
powerpc:ppc64e_defconfig
powerpc:85xx/sbc8548_defconfig

arch/powerpc/sysdev/fsl_pci.c: In function 'fsl_pci_mcheck_exception':
arch/powerpc/sysdev/fsl_pci.c:1002:4: error: passing argument 2 of 'probe_kernel_read' makes pointer from integer without a cast

Bisect points to 'uaccess: reimplement probe_kernel_address() using
probe_kernel_read()'.

Guenter
