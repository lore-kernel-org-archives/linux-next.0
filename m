From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the s390
 tree
Date: Fri, 24 Jun 2011 13:55:56 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1106241354520.11049@pobox.suse.cz>
References: <20110621133740.b23b87d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110621133740.b23b87d4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaliy Ivanov <vitalivanov@gmail.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
List-Id: linux-next.vger.kernel.org

On Tue, 21 Jun 2011, Stephen Rothwell wrote:

> Hi Jiri,
> 
> Today's linux-next merge of the trivial tree got a conflict in
> arch/s390/kvm/sie64a.S between commit 57e98c34511e ("[S390] move sie code
> to entry.S") from the s390 tree and commit e44ba033c565 ("treewide:
> remove duplicate includes") from the trivial tree.
> 
> The former merged this file into another file, so I just removed this file.

Thanks for reporting, I have dropped the hunk.

-- 
Jiri Kosina
SUSE Labs
