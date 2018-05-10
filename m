From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs
 tree
Date: Thu, 10 May 2018 15:44:08 -0600
Message-ID: <20180510154359.4aea2351@lwn.net>
References: <20180511074049.26072ec8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180511074049.26072ec8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 11 May 2018 07:40:49 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Commit
> 
>   5a779c40a8ad ("Revert "Documentation/features/vm: Remove arch support status file for 'pte_special'"")
> 
> is missing a Signed-off-by from its author and committer.  Reverts are
> commits too. ;-)

Argh.  I'm really not having a good time with this.

I've rebase-fixed it, I doubt anybody (except you! :) has pulled my tree
in the half-hour it was there...apologies if I'm wrong.

Thanks,

jon
