From: Mike Marshall <hubcap@omnibond.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Wed, 9 Dec 2015 16:30:34 -0500
Message-ID: <CAOg9mSRoyq-yYXh2RMicwvjVPF8EGN=XdvSfZPfbTP62B+szDg@mail.gmail.com>
References: <20151209121916.1d4cdba4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:32774 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753147AbbLIVag (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2015 16:30:36 -0500
Received: by lbbkw15 with SMTP id kw15so38374789lbb.0
        for <linux-next@vger.kernel.org>; Wed, 09 Dec 2015 13:30:35 -0800 (PST)
In-Reply-To: <20151209121916.1d4cdba4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>

Hi all...

I'm having a chicken-and-egg moment here...

I think "posix acls: Remove duplicate xattr name definitions" got into
linux-next after
Linus committed  Linux 4.4-rc4.

Unless I merge my for-next with Linus' tree at the current (arbitrary)
point, I need to wait
until I can merge with rc5 before I can apply this fix.

I know Linus hates to get pull requests for stuff that's not based on
a discrete tag,
I'm not sure what's appropriate for linux-next... ?

-Mike

On Tue, Dec 8, 2015 at 8:19 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Al,
>
> After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> In file included from fs/orangefs/acl.c:8:0:
> fs/orangefs/acl.c: In function 'pvfs2_get_acl':
> fs/orangefs/pvfs2-kernel.h:203:38: error: 'POSIX_ACL_XATTR_ACCESS' undeclared (first use in this function)
>  #define PVFS2_XATTR_NAME_ACL_ACCESS  POSIX_ACL_XATTR_ACCESS
>                                       ^
> fs/orangefs/acl.c:21:9: note: in expansion of macro 'PVFS2_XATTR_NAME_ACL_ACCESS'
>    key = PVFS2_XATTR_NAME_ACL_ACCESS;
>          ^
> fs/orangefs/pvfs2-kernel.h:203:38: note: each undeclared identifier is reported only once for each function it appears in
>  #define PVFS2_XATTR_NAME_ACL_ACCESS  POSIX_ACL_XATTR_ACCESS
>                                       ^
> fs/orangefs/acl.c:21:9: note: in expansion of macro 'PVFS2_XATTR_NAME_ACL_ACCESS'
>    key = PVFS2_XATTR_NAME_ACL_ACCESS;
>          ^
> fs/orangefs/pvfs2-kernel.h:204:38: error: 'POSIX_ACL_XATTR_DEFAULT' undeclared (first use in this function)
>  #define PVFS2_XATTR_NAME_ACL_DEFAULT POSIX_ACL_XATTR_DEFAULT
>                                       ^
> fs/orangefs/acl.c:24:9: note: in expansion of macro 'PVFS2_XATTR_NAME_ACL_DEFAULT'
>    key = PVFS2_XATTR_NAME_ACL_DEFAULT;
>          ^
> fs/orangefs/acl.c: In function 'pvfs2_set_acl':
> fs/orangefs/pvfs2-kernel.h:203:38: error: 'POSIX_ACL_XATTR_ACCESS' undeclared (first use in this function)
>  #define PVFS2_XATTR_NAME_ACL_ACCESS  POSIX_ACL_XATTR_ACCESS
>                                       ^
> fs/orangefs/acl.c:77:10: note: in expansion of macro 'PVFS2_XATTR_NAME_ACL_ACCESS'
>    name = PVFS2_XATTR_NAME_ACL_ACCESS;
>           ^
> fs/orangefs/pvfs2-kernel.h:204:38: error: 'POSIX_ACL_XATTR_DEFAULT' undeclared (first use in this function)
>  #define PVFS2_XATTR_NAME_ACL_DEFAULT POSIX_ACL_XATTR_DEFAULT
>                                       ^
> fs/orangefs/acl.c:101:10: note: in expansion of macro 'PVFS2_XATTR_NAME_ACL_DEFAULT'
>    name = PVFS2_XATTR_NAME_ACL_DEFAULT;
>           ^
>
> Caused by commit
>
>   97d79299223b ("posix acls: Remove duplicate xattr name definitions")
>
> interacting with the addition of orangefs in the orangefs tree.
>
> I applied this merge fix patch:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 9 Dec 2015 12:13:37 +1100
> Subject: [PATCH] orangefs: update for POSIX ACL name changes
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/orangefs/pvfs2-kernel.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/orangefs/pvfs2-kernel.h b/fs/orangefs/pvfs2-kernel.h
> index 4295e263e25b..9beeddbf8aa9 100644
> --- a/fs/orangefs/pvfs2-kernel.h
> +++ b/fs/orangefs/pvfs2-kernel.h
> @@ -200,8 +200,8 @@ struct client_debug_mask {
>  #endif
>  #endif
>
> -#define PVFS2_XATTR_NAME_ACL_ACCESS  POSIX_ACL_XATTR_ACCESS
> -#define PVFS2_XATTR_NAME_ACL_DEFAULT POSIX_ACL_XATTR_DEFAULT
> +#define PVFS2_XATTR_NAME_ACL_ACCESS  XATTR_NAME_POSIX_ACL_ACCESS
> +#define PVFS2_XATTR_NAME_ACL_DEFAULT XATTR_NAME_POSIX_ACL_DEFAULT
>  #define PVFS2_XATTR_NAME_TRUSTED_PREFIX "trusted."
>  #define PVFS2_XATTR_NAME_DEFAULT_PREFIX ""
>
> --
> 2.6.2
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
