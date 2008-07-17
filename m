From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 3/3] proc: make grab_header static
Date: Thu, 17 Jul 2008 15:09:50 -0700
Message-ID: <20080717150950.5d721d90.akpm@linux-foundation.org>
References: <1216329755.6029.31.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:35223 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1760426AbYGQWJw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jul 2008 18:09:52 -0400
In-Reply-To: <1216329755.6029.31.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: viro@ZenIV.linux.org.uk, linux-next@vger.kernel.org

On Thu, 17 Jul 2008 14:22:35 -0700
Harvey Harrison <harvey.harrison@gmail.com> wrote:

> fs/proc/proc_sysctl.c:69:25: warning: symbol 'grab_header' was not declared. Should it be static?
> 
> Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
> ---
> Appeared between next-20080716 and next-20080717
> 
>  fs/proc/proc_sysctl.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
> index f9a8b89..84f58e8 100644
> --- a/fs/proc/proc_sysctl.c
> +++ b/fs/proc/proc_sysctl.c
> @@ -66,7 +66,7 @@ static struct ctl_table *find_in_table(struct ctl_table *p, struct qstr *name)
>  	return NULL;
>  }
>  
> -struct ctl_table_header *grab_header(struct inode *inode)
> +static struct ctl_table_header *grab_header(struct inode *inode)
>  {
>  	if (PROC_I(inode)->sysctl)
>  		return sysctl_head_grab(PROC_I(inode)->sysctl);

urgh.  We need to do something here.

People are dumping large hunks of 2.6.28 material into linux-next
during the merge window.  This screws me up because I haven't merged
into 2.6.27 yet, and my patch queue is based on linux-next.  And I
_have_ to do that, because lots of the git trees haven't merged into
mainline yet.

So to maintain my tree I need to forward-port patches on top of the
newly-added 2.6.28 material, then backport it all onto mainline for
merging (which will wreck the next linux-next release).

I hadn't anticipated this.

It's nothing new - it used to happen when -mm was a collection of 70
git-foo.patch as well.


See, for the purposes of tree maintainers who haven't merged yet,
linux-next is still the 2.6.27 candidate tree.  For those who _have_
merged, linux-next becomes the 2.6.28 candidate tree.

We'll see how it goes, but we might need a "don't merge 2.6.x+1 stuff
into linux-next until 2.6.x-rc1 has been released" rule.
