From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: manual merge of the powerpc tree
Date: Mon, 14 Jul 2008 21:24:36 -0400 (EDT)
Message-ID: <Pine.LNX.4.58.0807142123280.2955@gandalf.stny.rr.com>
References: <20080714154459.0ed9da62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:43041 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760908AbYGOBYi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Jul 2008 21:24:38 -0400
In-Reply-To: <20080714154459.0ed9da62.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Mark Nelson <markn@au1.ibm.com>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>



On Mon, 14 Jul 2008, Stephen Rothwell wrote:

> Hi Paul, Ben,
>
> Today's linux-next merge of the powerpc tree got a conflict in
> arch/powerpc/Kconfig between commit
> 4e491d14f2506b218d678935c25a7027b79178b1 ("ftrace: support for PowerPC")
> from the ftrace tree and commit 3affedc4e1ce837033b6c5e9289d2ce2f5a62d31
> ("powerpc/dma: implement new dma_*map*_attrs() interfaces") from the
> powerpc tree.
>
> The former commit moved the "select HAVE_OPROFILE" to the bottom of the
> "config PPC" list (for no reason that I can fathom) while the latter
> added another select.  Simple fixup.  I can carry it.

I heard someone mention that they try to keep the configs in alphabetical
order. I did the move of OPROFILE for just that reason. I should have said
so in the change log. Oh well.

-- Steve
