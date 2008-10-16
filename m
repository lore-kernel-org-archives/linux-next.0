From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: Tree for October 16
Date: Thu, 16 Oct 2008 23:22:06 +0100
Message-ID: <19912.1224195726@redhat.com>
References: <20081016184118.GA19976@x200.localdomain> <20081016211811.a523c8f2.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:34157 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755071AbYJPWWR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Oct 2008 18:22:17 -0400
In-Reply-To: <20081016184118.GA19976@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Alexey Dobriyan <adobriyan@gmail.com> wrote:

> +#include <linux/cred.h>
>  #include <linux/types.h>
>  #include <linux/file.h>
>  #include <linux/fs.h>
> @@ -13,6 +14,7 @@
>  #include <linux/linkage.h>
>  #include <linux/namei.h>
>  #include <linux/mount.h>
> +#include <linux/sched.h>

Only the latter addition should be necessary.  linux/sched.h #includes
linux/cred.h.

David
