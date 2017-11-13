From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the s390 tree
Date: Mon, 13 Nov 2017 16:30:33 +1100
Message-ID: <20171113163023.0e5bbe50@canb.auug.org.au>
References: <20171011155145.sfrwpb3b3rol7l3i@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51887 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750957AbdKMFaf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 00:30:35 -0500
In-Reply-To: <20171011155145.sfrwpb3b3rol7l3i@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Mark Brown <broonie@kernel.org>, Kirill Tkhai <ktkhai@virtuozzo.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

On Wed, 11 Oct 2017 16:51:45 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/s390/include/asm/rwsem.h
> 
> between commit:
> 
>    91a1fad759ffd ("s390: use generic rwsem implementation")
> 
> from the s390 tree and commit:
> 
>    a61ba2c8a48f1 ("locking/arch, s390: Add __down_read_killable()")
> 
> from the tip tree.
> 
> I fixed it up by re-deleting the file and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Just a reminder that this conflict still exists.

-- 
Cheers,
Stephen Rothwell
