From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the sparc tree
Date: Fri, 21 Feb 2014 11:32:44 +0000
Message-ID: <28092.1392982364@warthog.procyon.org.uk>
References: <20140221174238.acefa05c8a5e71b06155d32d@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140221174238.acefa05c8a5e71b06155d32d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the akpm-current tree got a conflict in
> drivers/sbus/char/jsflash.c between commit 967f038e491b ("Sparc:
> sparc_cpu_model isn't in asm/system.h any more [ver #2]") from the sparc
> tree and commit 695f43eb1721 ("asm/system.h: sparc: sparc_cpu_model isn't
> in asm/system.h any more") from the akpm-current tree.

I think Andrew's is an old version.

David
