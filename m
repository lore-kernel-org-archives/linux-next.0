From: Borislav Petkov <bp@alien8.de>
Subject: Re: efi_enabled(EFI_PARAVIRT) use
Date: Fri, 29 Apr 2016 10:25:02 +0200
Message-ID: <20160429082501.GA20762@pd.tnic>
References: <20160429142020.4499e185@canb.auug.org.au>
 <20160429063936.GA28320@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160429063936.GA28320@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>, Matt Fleming <matt@codeblueprint.co.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shannon Zhao <shannon.zhao@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 29, 2016 at 08:39:36AM +0200, Ingo Molnar wrote:
> With considerable pain we just got rid of paravirt_enabled() in the
> x86 tree, and Xen is now reintroducing it in the EFI code.

I think Matt is working towards removing EFI_PARAVIRT but he'll comment
himself when he wakes up... :)

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
