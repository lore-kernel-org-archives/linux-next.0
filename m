From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build warning after merge of the vfs tree
Date: Fri, 07 Sep 2018 09:57:51 +0100
Message-ID: <10476.1536310671@warthog.procyon.org.uk>
References: <20180906100220.4df8ac0e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906100220.4df8ac0e@canb.auug.org.au>
Content-ID: <10475.1536310671.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> security/selinux/hooks.c:2835:12: warning: 'selinux_sb_remount' defined but not used [-Wunused-function]
>  static int selinux_sb_remount(struct super_block *sb, void *data, size_t data_size)
>             ^~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   dfcf373eab92 ("vfs: Remove unused code after filesystem context changes")

Sorry, I forgot to remove the function.  It's no longer used, with the checks
being done in selinux_validate_for_sb_reconfigure() now, called indirectly
from the ->fs_context_validate() hook.

David
