From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the ptrace tree with the s390 tree
Date: Thu, 21 Jul 2011 10:02:40 +0200
Message-ID: <20110721080240.GZ3455@htj.dyndns.org>
References: <20110720153320.a7f33784158ccb04fafcb5d6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110720153320.a7f33784158ccb04fafcb5d6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Oleg Nesterov <oleg@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
List-Id: linux-next.vger.kernel.org

Hello,

On Wed, Jul 20, 2011 at 03:33:20PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the ptrace tree got a conflict in
> arch/s390/kernel/traps.c between commit 248bed4b0f3c ("[S390] use siginfo
> for sigtrap signals") from the s390 tree and commit a288eecce525
> ("ptrace: kill trivial tracehooks") from the ptrace tree.
> 
> It looks like the former is a superset of the latter, so I used the
> former.

Yeap, pretty much.  Martin, testing if (current->ptrace) is enough.
If PT_PTRACED is not set, no other flag there is allowed to set.
Also, I think we really should standardize what gets reported in these
debug traps instead of letting each arch do its own thing.

Thanks.

-- 
tejun
