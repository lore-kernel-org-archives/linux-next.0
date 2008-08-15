From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Fri, 15 Aug 2008 09:43:47 +0300
Message-ID: <48A525A3.8050705@cs.helsinki.fi>
References: <20080815164512.3f36d7a6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:43481 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751485AbYHOGqv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Aug 2008 02:46:51 -0400
In-Reply-To: <20080815164512.3f36d7a6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, "Gustavo F. Padovan" <gustavo@las.ic.unicamp.br>

Stephen Rothwell wrote:
> Today's linux-next merge of the kmemcheck tree got a conflict in
> arch/x86/kernel/process_64.c between commits
> 8092c654de9a964c14d89da56834f73a80548a58 ("x86: add KERN_INFO to printks
> on process_64.c") and 7de08b4e1ed8d80e6086f71b7e99fc4b397aae39 ("x86:
> coding styles fixes to arch/x86/kernel/process_64.c") from the x86 tree
> and commit afdb7023b849cffda679fcec324ff592d7b24a51 ("x86:
> __show_registers() and __show_regs() API unification") from the kmemcheck
> tree.

Ingo, can we push the unification patch to mainline before kmemcheck to 
get rid of the conflict?

		Pekka
