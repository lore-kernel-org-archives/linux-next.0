From: Toshi Kani <toshi.kani@hpe.com>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Tue, 02 Feb 2016 17:32:27 -0700
Message-ID: <1454459547.7165.14.camel@hpe.com>
References: <20160203110940.1c3ecf32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g4t3427.houston.hp.com ([15.201.208.55]:46222 "EHLO
	g4t3427.houston.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755025AbcBCAde (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2016 19:33:34 -0500
In-Reply-To: <20160203110940.1c3ecf32@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Borislav Petkov <bp@suse.de>

On Wed, 2016-02-03 at 11:09 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   kernel/memremap.c
> 
> between commit:
> 
>   eb7d78c9e7f6 ("devm_memremap_pages: fix vmem_altmap lifetime +
> alignment handling")
> 
> from Linus' tree and commit:
> 
>   1c29f25bf5d6 ("memremap: Change region_intersects() to take @flags and
> @desc")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good.  Thanks for the marge.
-Toshi
