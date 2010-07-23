From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next: manual merge of the kgdb tree with Linus' tree
Date: Thu, 22 Jul 2010 22:38:24 -0500
Message-ID: <4C490EB0.2030007@windriver.com>
References: <20100723122646.a788fc86.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:41809 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753243Ab0GWDif (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Jul 2010 23:38:35 -0400
In-Reply-To: <20100723122646.a788fc86.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/22/2010 09:26 PM, Stephen Rothwell wrote:
> Hi Jason,
>
> Today's linux-next merge of the kgdb tree got a conflict in
> kernel/debug/kdb/kdb_main.c between commit
> edd63cb6b91024332d6983fc51058ac1ef0c081e ("sysrq,kdb: Use __handle_sysrq
> () for kdb's sysrq function") from Linus' tree and commit
> 93c47fada46e034941106fb34b76a00a87108fc5 ("kdb: Restore previous sysrq
> state") from the kgdb tree.
>
> These are two fixes for the same problem.  I effectively reverted the one
> from the kgdb tree.
>   

This already fixed.  The problem was caused by the for_linus pull branch
being out of sync with kgdb-next.

Thanks,
Jason.
