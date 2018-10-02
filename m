From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: build warnings after merge of the pci tree
Date: Tue, 2 Oct 2018 08:47:37 -0500
Message-ID: <CAErSpo52h3KEFvEw+dEGiy53uvD=956K8QT5RQFLk=ArDJ9EUw@mail.gmail.com>
References: <20181002102602.53320db6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002102602.53320db6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, poza@codeaurora.org
List-Id: linux-next.vger.kernel.org

On Mon, Oct 1, 2018 at 7:26 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Bjorn,
>
> After merging the pci tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warning:
>
> drivers/net/ethernet/intel/ixgbe/ixgbe_main.c: In function 'ixgbe_io_slot_reset':
> drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:11102:6: warning: unused variable 'err' [-Wunused-variable]
>   int err;
>       ^~~
> drivers/net/ethernet/intel/i40e/i40e_main.c: In function 'i40e_pci_error_slot_reset':
> drivers/net/ethernet/intel/i40e/i40e_main.c:14230:6: warning: unused variable 'err' [-Wunused-variable]
>   int err;
>       ^~~
>
> also from the x86_64 allmodconfig build:
>
> drivers/dma/ioat/init.c: In function 'ioat_pcie_error_slot_reset':
> drivers/dma/ioat/init.c:1255:6: warning: unused variable 'err' [-Wunused-variable]
>   int err;
>       ^~~
> drivers/net/ethernet/sfc/efx.c: In function 'efx_io_slot_reset':
> drivers/net/ethernet/sfc/efx.c:3824:6: warning: unused variable 'rc' [-Wunused-variable]
>   int rc;
>       ^~
> drivers/net/ethernet/sfc/falcon/efx.c: In function 'ef4_io_slot_reset':
> drivers/net/ethernet/sfc/falcon/efx.c:3163:6: warning: unused variable 'rc' [-Wunused-variable]
>   int rc;
>       ^~

Fixed the above, thanks!

> Introduced by commit
>
>   6dcde3e574b2 ("XXX PCI/AER: Remove pci_cleanup_aer_uncorrect_error_status() calls")
> (good subject prefix there :-))

Yeah, that's a note to self to update something in the changelog.

Bjorn
