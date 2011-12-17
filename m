From: David Daney <david.s.daney@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree (mips
 tree related)
Date: Sat, 17 Dec 2011 10:06:59 -0800
Message-ID: <4EECDA43.6040004@gmail.com>
References: <20111217155044.094c4c2b51af7c66e8ec90a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:59579 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752118Ab1LQSHF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 17 Dec 2011 13:07:05 -0500
In-Reply-To: <20111217155044.094c4c2b51af7c66e8ec90a3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hillf Danton <dhillf@gmail.com>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, "Jayachandran C." <jayachandranc@netlogicmicro.com>

On 12/16/2011 08:50 PM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (mips almost all
> configs) failed like this:
>
> arch/mips/mm/tlb-r4k.c: In function 'local_flush_tlb_range':
> arch/mips/mm/tlb-r4k.c:128: error: 'HPAGE_SIZE' undeclared (first use in this function)
> arch/mips/mm/tlb-r4k.c:130: error: 'HPAGE_SHIFT' undeclared (first use in this function)
>
> Probably caused by commit 0b07e859f87b ("MIPS: Flush huge TLB").

Indeed that is the case.

We have a patch for this issue:  http://patchwork.linux-mips.org/patch/3114/

Perhaps Ralf will push out a mips-for-linux-next containing this patch 
in the near future.

David Daney
