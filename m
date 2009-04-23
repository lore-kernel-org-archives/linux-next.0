From: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH v2] powerpc: fix for long standing bug noticed by gcc 4.4.0
Date: Thu, 23 Apr 2009 08:55:12 -0500
Message-ID: <34687519-FB41-4447-9575-68EB1DC2D3EC@kernel.crashing.org>
References: <20090423160656.fac84e3f.sfr@canb.auug.org.au> <20090423103336.GA3825@zod.rchland.ibm.com> <20090423225611.d569764c.sfr@canb.auug.org.au>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:54173 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751337AbZDWNze (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 09:55:34 -0400
In-Reply-To: <20090423225611.d569764c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


On Apr 23, 2009, at 7:56 AM, Stephen Rothwell wrote:

> Previous gcc versions didn't notice this because one of the preceding
> #ifs always evaluated to true.
>
> gcc 4.4.0 produced this error:
>
> arch/powerpc/mm/tlb_nohash_low.S:206:6: error: #elif with no  
> expression
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Acked-by: Josh Boyer <jwboyer@linux.vnet.ibm.com>
> ---
> arch/powerpc/mm/tlb_nohash_low.S |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>
> v2: fixed up commit message, added Josh'd Ack.

applied to merge.  Picking this up as I'm touching tlb_nohash_low.S w/ 
another "fix".

- k
