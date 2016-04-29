From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Fri, 29 Apr 2016 11:34:45 +0100 (BST)
Message-ID: <alpine.DEB.2.10.1604291123260.3312@sstabellini-ThinkPad-X260>
References: <20160429142020.4499e185@canb.auug.org.au> <20160429063936.GA28320@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:38666 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752777AbcD2Key (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Apr 2016 06:34:54 -0400
In-Reply-To: <20160429063936.GA28320@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Matt Fleming <matt@codeblueprint.co.uk>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shannon Zhao <shannon.zhao@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Borislav Petkov <bp@alien8.de>

On Fri, 29 Apr 2016, Ingo Molnar wrote:
> Also, it would be nice to have all things EFI in a single tree, the conflicts are 
> going to be painful! There's very little reason not to carry this kind of commit:
> 
>  arch/arm/xen/enlighten.c           |  6 +++++
>  drivers/firmware/efi/arm-runtime.c | 17 +++++++++-----
>  drivers/firmware/efi/efi.c         | 45 ++++++++++++++++++++++++++++++++------
>  3 files changed, 56 insertions(+), 12 deletions(-)
> 
> in the EFI tree.

That's true. I'll drop this commit from xentip and let Matt pick it up
or request changes as he sees fit.
