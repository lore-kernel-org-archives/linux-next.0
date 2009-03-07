From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree with the blackfin and x86 trees
Date: Sat, 7 Mar 2009 11:41:53 +1030
Message-ID: <200903071141.54753.rusty@rustcorp.com.au>
References: <20090306153759.c8c6b470.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:56791 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754709AbZCGBMA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 20:12:00 -0500
In-Reply-To: <20090306153759.c8c6b470.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Bryan Wu <cooloney.lkml@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Friday 06 March 2009 15:07:59 Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the rr tree added conflicts in
> arch/blackfin/kernel/ipipe.c and arch/x86/mach-voyager/setup.c.  I didn't
> bother to work out exactly what is conflicting because I dropped the rr
> tree due to the build failures that I assume are still present from
> yesterday.

Good call.  Arabella didn't quite sleep long enough for me to get the fixes
out yesterday.

I've moved the arch/blackfin/kernel/ipipe.c patch out of linux-next until I've
sorted this.

Thanks,
Rusty.
