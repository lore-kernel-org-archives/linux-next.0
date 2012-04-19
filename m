From: Steven Whitehouse <swhiteho@redhat.com>
Subject: Re: linux-next: commit "GFS2: Clean up log write code path"
 breakage
Date: Thu, 19 Apr 2012 10:34:54 +0100
Message-ID: <1334828094.2718.1.camel@menhir>
References: <CAP=VYLoD6yLQkLO0Q=wGQ5yag9e9qw-5iwHLGgcck60Efy5-Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:48943 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752620Ab2DSJfB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Apr 2012 05:35:01 -0400
In-Reply-To: <CAP=VYLoD6yLQkLO0Q=wGQ5yag9e9qw-5iwHLGgcck60Efy5-Vg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, cluster-devel@redhat.com

Hi,

On Wed, 2012-04-18 at 21:26 -0400, Paul Gortmaker wrote:
> Hi Steven,
> 
> When you have a chance can you look at this? Git bisect says that
> this commit:
> 
Yes, I can see what that is... the most amazing thing is that it ever
worked in the first place. I'm cooking up a patch to fix it which should
be ready very shortly,

Steve.

> ----------
> commit e80623efc450fb615d1496774c8d5c063a50fb3a
> Author: Steven Whitehouse <swhiteho@redhat.com>
> Date:   Mon Apr 16 09:28:31 2012 +0100
> 
>     GFS2: Clean up log write code path
> ----------
> 
> has caused the failure seen in several allmodconfigs (sparc, m68k).
> 
> fs/gfs2/lops.c:379:42: error: request for member 'virtual' in
> something not a structure or union
> make[3]: *** [fs/gfs2/lops.o] Error 1
> 
> Here are some examples:
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/6131431/
> http://kisskb.ellerman.id.au/kisskb/buildresult/6131694/
> http://kisskb.ellerman.id.au/kisskb/buildresult/6131511/
> 
> Thanks,
> Paul.
