From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] [v3] x86, pkeys: fix siginfo ABI breakage from new
 field
Date: Tue, 1 Mar 2016 09:33:17 +1100
Message-ID: <20160301093317.4afe0268@canb.auug.org.au>
References: <20160229221733.DC2C56B7@viggo.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42066 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751007AbcB2WdT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Feb 2016 17:33:19 -0500
In-Reply-To: <20160229221733.DC2C56B7@viggo.jf.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Hansen <dave@sr71.net>
Cc: linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, akpm@linux-foundation.org, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, deller@gmx.de

Hi Dave,

On Mon, 29 Feb 2016 14:17:33 -0800 Dave Hansen <dave@sr71.net> wrote:
>
> To fix this, we replace the u64 with an '__u32'.  The __u32 is
> guaranteed to union well with the pointers from _addr_bnd.  It is
> also plenty large enough to store the 16-bit pkey we have today
> on x86.

That looks better, thanks.

-- 
Cheers,
Stephen Rothwell
