From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 07 Nov 2008 15:04:48 +0000
Message-ID: <27012.1226070288@redhat.com>
References: <20081107184934.8ad8b6ca.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:51336 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752242AbYKGPFA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 10:05:00 -0500
In-Reply-To: <20081107184934.8ad8b6ca.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>  +	read_lock_irq(&tasklist_lock);
>  +	psig = current->parent->sighand;
>  +	spin_lock_irqsave(&psig->siglock, flags);

There's no point using spin_lock_irqsave(): you've already disabled interrupts
with read_lock_irq().  Similarly:

>  +	spin_unlock_irqrestore(&psig->siglock, flags);
>  +	read_unlock_irq(&tasklist_lock);

spin_unlock_irqrestore() here is never going to re-enable interrupts.

Apart from that, it looks okay.

My tree and James's tree definitely need to meet before you see them.

David
