From: Matt Fleming <matt@codeblueprint.co.uk>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Fri, 29 Apr 2016 15:39:31 +0100
Message-ID: <20160429143931.GG2839@codeblueprint.co.uk>
References: <20160429142020.4499e185@canb.auug.org.au>
 <20160429063936.GA28320@gmail.com>
 <alpine.DEB.2.10.1604291123260.3312@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1604291123260.3312@sstabellini-ThinkPad-X260>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shannon Zhao <shannon.zhao@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Borislav Petkov <bp@alien8.de>
List-Id: linux-next.vger.kernel.org

On Fri, 29 Apr, at 11:34:45AM, Stefano Stabellini wrote:
> On Fri, 29 Apr 2016, Ingo Molnar wrote:
> > Also, it would be nice to have all things EFI in a single tree, the conflicts are 
> > going to be painful! There's very little reason not to carry this kind of commit:
> > 
> >  arch/arm/xen/enlighten.c           |  6 +++++
> >  drivers/firmware/efi/arm-runtime.c | 17 +++++++++-----
> >  drivers/firmware/efi/efi.c         | 45 ++++++++++++++++++++++++++++++++------
> >  3 files changed, 56 insertions(+), 12 deletions(-)
> > 
> > in the EFI tree.
> 
> That's true. I'll drop this commit from xentip and let Matt pick it up
> or request changes as he sees fit.

One small change I think would be sensible to make is to expand
EFI_PARAVIRT into a few more bits to clearly indicate the quirks on
Xen, and in the process, to delete EFI_PARAVIRT.

That should address Ingo's major concern, and also make it much easier
to rework the code in a piecemeal fashion.

Could somebody enumerate the things that make Xen (dom0) different on
arm* compared with bare metal EFI boot? The list I made for x86 was,

  1. Has no EFI memory map
  2. Runtime regions do not need to be mapped
  3. Cannot call SetVirtualAddressMap()
  4. /sys/firmware/efi/fw_vendor is invisible

The first maps to not setting EFI_MEMMAP, the second to not setting
EFI_RUNTIME. If we add EFI_ALREADY_VIRTUAL and EFI_FW_VENDOR_INVISIBLE
to efi.flags that should cover everything on x86. Does arm* require
anything else?
