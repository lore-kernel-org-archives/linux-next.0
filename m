From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the kmemcheck tree with the x86
	tree
Date: Fri, 23 Jan 2009 16:21:54 +0200
Message-ID: <1232720514.6094.61.camel@penberg-laptop>
References: <20090123154409.e3d1cd1d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:53708 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756367AbZAWOV5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Jan 2009 09:21:57 -0500
In-Reply-To: <20090123154409.e3d1cd1d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>

Hi Stephen,

On Fri, 2009-01-23 at 15:44 +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the kmemcheck tree got a conflict in
> arch/x86/mm/fault.c between commit do_page_fault ("x86: optimise x86's
> do_page_fault (C entry point for the page fault path)") from the x86 tree
> and commit 787ecfaa503dc63ff1831ddc74b15dad49bace1d ("x86: add hooks for
> kmemcheck") from the kmemcheck tree.
> 
> I fixed it up (see below) but it is worth a check.  I can carry the fix
> as necessary.

Looks good to me. Vegard?

		Pekka
