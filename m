From: Chris Mason <chris.mason@oracle.com>
Subject: Re: linux-next: manual merge of the tip-core tree with Linus' tree
Date: Sun, 08 Feb 2009 19:46:23 -0500
Message-ID: <1234140383.26563.0.camel@think.oraclecorp.com>
References: <20090209113855.180c03cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:54174 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753512AbZBIAqx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 8 Feb 2009 19:46:53 -0500
In-Reply-To: <20090209113855.180c03cb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

On Mon, 2009-02-09 at 11:38 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip-core tree got a conflict in
> fs/btrfs/locking.c between commit
> b4ce94de9b4d64e8ab3cf155d13653c666e22b9b ("Btrfs: Change btree locking to
> use explicit blocking points") from Linus' tree and commit
> cf47b8f3d96b0b8b10b557444a28b3ca4024ff82 ("Btrfs: stop spinning on
> mutex_trylock and let the adaptive code spin for us") from the tip-core
> tree.
> 
> Resolved as in tip/master by taking the version from Linus' tree.

Sorry, I meant to ask Ingo to drop the patch I had sent along for the
btrfs adaptive code. Using Linus' copy was the right answer, it replaces
the patch I sent to Ingo.

-chris
