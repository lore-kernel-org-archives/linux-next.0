From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip-core tree with Linus' tree
Date: Mon, 9 Feb 2009 09:51:28 +0100
Message-ID: <20090209085128.GA31890@elte.hu>
References: <20090209113855.180c03cb.sfr@canb.auug.org.au> <1234140383.26563.0.camel@think.oraclecorp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:39135 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750983AbZBIIvr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Feb 2009 03:51:47 -0500
Content-Disposition: inline
In-Reply-To: <1234140383.26563.0.camel@think.oraclecorp.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Mason <chris.mason@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Chris Mason <chris.mason@oracle.com> wrote:

> On Mon, 2009-02-09 at 11:38 +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the tip-core tree got a conflict in
> > fs/btrfs/locking.c between commit
> > b4ce94de9b4d64e8ab3cf155d13653c666e22b9b ("Btrfs: Change btree locking to
> > use explicit blocking points") from Linus' tree and commit
> > cf47b8f3d96b0b8b10b557444a28b3ca4024ff82 ("Btrfs: stop spinning on
> > mutex_trylock and let the adaptive code spin for us") from the tip-core
> > tree.
> > 
> > Resolved as in tip/master by taking the version from Linus' tree.
> 
> Sorry, I meant to ask Ingo to drop the patch I had sent along for the btrfs 
> adaptive code. Using Linus' copy was the right answer, it replaces the patch I 
> sent to Ingo.

It was obvious how to resolve it so i did not notify you about it. I generally ping 
people when a conflict looks troublesome in some way - that's pretty rare.

	Ingo
