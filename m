From: Matt Fleming <matt@codeblueprint.co.uk>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Fri, 29 Apr 2016 10:26:51 +0100
Message-ID: <20160429092651.GD2839@codeblueprint.co.uk>
References: <20160429142020.4499e185@canb.auug.org.au>
 <20160429063936.GA28320@gmail.com>
 <20160429082501.GA20762@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37298 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752267AbcD2J0y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Apr 2016 05:26:54 -0400
Received: by mail-wm0-f46.google.com with SMTP id a17so26234944wme.0
        for <linux-next@vger.kernel.org>; Fri, 29 Apr 2016 02:26:54 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160429082501.GA20762@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shannon Zhao <shannon.zhao@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>

On Fri, 29 Apr, at 10:25:02AM, Borislav Petkov wrote:
> On Fri, Apr 29, 2016 at 08:39:36AM +0200, Ingo Molnar wrote:
> > With considerable pain we just got rid of paravirt_enabled() in the
> > x86 tree, and Xen is now reintroducing it in the EFI code.
> 
> I think Matt is working towards removing EFI_PARAVIRT but he'll comment
> himself when he wakes up... :)

Yeah, I haven't actually got around to dropping EFI_PARAVIRT yet but
since it's basically used to skip certain initialisation operations on
boot I figured we could just provide empty stub functions as part of
struct efi (probably).

The concerns Ingo voiced about EFI_PARAVIRT being a catch-all flag are
very true.

Incidentally kexec and arm64 would need a similar stub functions if we
move more EFI runtime setup code to drivers/firmware/efi, which is my
long-term plan, since neither can call SetVirtualAddressMap().

On x86, I think EFI_PARAVIRT is code for,

  1. Has no EFI memory map
  2. Runtime regions do not need to be mapped
  3. Cannot call SetVirtualAddressMap()
  4. /sys/firmware/efi/fw_vendor is invisible

1. and 2. should be covered by never setting EFI_MEMMAP and
EFI_RUNTIME_SERVICES in efi.flags. We have no bits for 3. and 4. yet.
