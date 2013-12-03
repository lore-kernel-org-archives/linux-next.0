From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with Linus'
 tree
Date: Mon, 2 Dec 2013 23:31:31 -0800
Message-ID: <20131202233131.3f7933d1.akpm@linux-foundation.org>
References: <20131203125219.97839b4335adffdeb3ef7160@canb.auug.org.au>
	<1552053.4Szip5nVtU@sandpuppy>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:45768 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751043Ab3LCHai (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Dec 2013 02:30:38 -0500
In-Reply-To: <1552053.4Szip5nVtU@sandpuppy>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 03 Dec 2013 08:16:04 +0100 Richard Weinberger <richard@nod.at> wrote:

> Andrew,
> 
> Am Dienstag, 3. Dezember 2013, 12:52:19 schrieb Stephen Rothwell:
> > Hi Andrew,
> > 
> > Today's linux-next merge of the akpm-current tree got a conflict in
> > arch/um/kernel/sysrq.c between commit 8ed12fcc194d ("um: Rename
> > print_stack_trace to do_stack_trace") from Linus' tree and commit
> > ce89e7878311 ("arch/um/kernel/sysrq.c: rename print_stack_trace()") from
> > the akpm-current tree.
> > 
> > I fixed it up (I used the version fro, Linus' tree) and can carry the fix
> > as necessary (no action is required).
> 
> How comes that this patch landed in your tree, I didn't receive a mail from 
> your bot?

Coz after I wrote it I carefully added cc:richrd@nod.at ;)
