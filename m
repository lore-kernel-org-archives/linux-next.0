From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: manual merge of the signal tree with the powerpc
 tree
Date: Wed, 20 Feb 2013 23:50:13 -0600
Message-ID: <1361425813.4676.47.camel@pasglop>
References: <20130221155208.bcb1295ab9bdecf394d48bfc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130221155208.bcb1295ab9bdecf394d48bfc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

On Thu, 2013-02-21 at 15:52 +1100, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the signal tree got conflicts in
> arch/powerpc/kernel/signal_32.c and arch/powerpc/kernel/signal_64.c
> between commit 2b0a576d15e0 ("powerpc: Add new transactional memory state
> to the signal context") from the powerpc tree and commit 7cce246557bf
> ("powerpc: switch to generic sigaltstack") from the signal tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary
> (no action is required).

Mikey, can you check everything's all right ?

I'm happy to wait for Al stuff to go in first & fixup the conflict
before I send the pull request to Linus. I'm off travelling around but I
should be able to get stuff out this week-end.

Cheers,
Ben.
