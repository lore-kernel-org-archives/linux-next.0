From: Borislav Petkov <bp@alien8.de>
Subject: Re: linux-next: manual merge of the edac-amd tree with the tip tree
Date: Thu, 4 Jun 2015 10:01:51 +0200
Message-ID: <20150604080151.GB3795@pd.tnic>
References: <20150604165529.04d35606@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:48160 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750936AbbFDIBx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jun 2015 04:01:53 -0400
Content-Disposition: inline
In-Reply-To: <20150604165529.04d35606@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 04, 2015 at 04:55:29PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the edac-amd tree got a conflict in
> arch/x86/Kconfig between commit 6471b825c41e ("x86/kconfig: Reorganize
> arch feature Kconfig select's") from the tip tree and commit
> b01aec9b2c7d ("EDAC: Cleanup atomic_scrub mess") from the edac-amd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Ah yes, the two new EDAC Kconfig items from the EDAC tree and the
sorting of the selects from the tip tree:

...
>  +    select COMPAT_OLD_SIGACTION             if IA32_EMULATION
>  +    select DCACHE_WORD_ACCESS
> ++    select EDAC_ATOMIC_SCRUB
> ++    select EDAC_SUPPORT
>  +    select GENERIC_CLOCKEVENTS
>  +    select GENERIC_CLOCKEVENTS_BROADCAST    if X86_64 || (X86_32 && X86_LOCAL_APIC)
...

Looks good to me, thanks Stephen!

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
