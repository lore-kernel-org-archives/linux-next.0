From: Tejun Heo <tj@kernel.org>
Subject: Re: -next March 3: Boot failure on x86 (Oops)
Date: Fri, 05 Mar 2010 15:09:53 +0900
Message-ID: <4B90A031.8090306@kernel.org>
References: <20100303174603.5be197ba.sfr@canb.auug.org.au> <4B8E83D4.6090507@in.ibm.com> <4B8F0CD0.1040507@kernel.org> <4B8F43DD.10002@in.ibm.com> <4B909FC5.8020800@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:58677 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750888Ab0CEGKB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Mar 2010 01:10:01 -0500
In-Reply-To: <4B909FC5.8020800@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 03/05/2010 03:08 PM, Tejun Heo wrote:
> Hmmm... this means that on one of the chunks, chunk->list.next was
> NULL (BTW, the disassembly is from unlinked object, right?).  The main
> allocation code hasn't seen much change lately.  The only changes are,
> 
> 22b737f4c75197372d64afc6ed1bccd58c00e549 : just refactoring
> 833af8427be4b217b5bc522f61afdbd3f1d282c2 : possible but isn't very new

Can you also please try reverting the above two commits?

Thanks.

-- 
tejun
