From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next: build error after merge of the kgdb tree
Date: Sat, 07 Aug 2010 06:09:35 -0500
Message-ID: <4C5D3EEF.2080806@windriver.com>
References: <20100807142122.a305ed8a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:59974 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752904Ab0HGLJm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 7 Aug 2010 07:09:42 -0400
In-Reply-To: <20100807142122.a305ed8a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/06/2010 11:21 PM, Stephen Rothwell wrote:
> Hi Jason,
>
> After merging the kgdb tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this error (and hundreds of similar
> errors/warnings):
>
> In file included from include/linux/rculist.h:10,
>                  from include/linux/dcache.h:6,
>                  from include/linux/fs.h:375,
>                  from include/linux/security.h:25,
>                  from security/min_addr.c:3:
> include/linux/rcupdate.h:606: warning: function declaration isn't a prototype
>
>   

I removed the kgdb rcu stall detector patches from the queue until they
are re-worked against the latest rcu changes pending in linux-next.

Thanks,
Jason.
