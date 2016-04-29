From: Ingo Molnar <mingo@kernel.org>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Fri, 29 Apr 2016 12:46:21 +0200
Message-ID: <20160429104621.GA6354@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Matt Fleming <matt@codeblueprint.co.uk>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shannon Zhao <shannon.zhao@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Borislav Petkov <bp@alien8.de>
List-Id: linux-next.vger.kernel.org


* Stefano Stabellini <sstabellini@kernel.org> wrote:

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

Thanks!

	Ingo
