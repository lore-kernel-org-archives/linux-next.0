From: Mark Salter <msalter@redhat.com>
Subject: Re: linux-next build failure
Date: Mon, 06 Jan 2014 10:21:36 -0500
Message-ID: <1389021696.2564.39.camel@deneb.redhat.com>
References: <1388764729.2564.32.camel@deneb.redhat.com>
	 <20140103145609.76b9f8622e8914cde183d7ce@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:24147 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754670AbaAFPVj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Jan 2014 10:21:39 -0500
In-Reply-To: <20140103145609.76b9f8622e8914cde183d7ce@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, jmarchan@redhat.com

On Fri, 2014-01-03 at 14:56 -0800, Andrew Morton wrote:
> On Fri, 03 Jan 2014 10:58:49 -0500 Mark Salter <msalter@redhat.com> wrote:
> 
> > The c6x arch (no MMU) is failing to build in linux-next with:
> > 
> >   kernel/built-in.o:(.fardata+0x3fc): undefined reference to `overcommit_ratio_handler'
> >   kernel/built-in.o:(.fardata+0x420): undefined reference to `overcommit_kbytes_handler'
> >   make[1]: *** [vmlinux] Error 1
> > 
> > Looks like this patch adds those functions to mm/mmap.c which
> > is only used when CONFIG_MMU is defined.
> > 
> >   commit 31bdaf7c8e8a784fd8f889371bdacb24670734c7
> >   Author: Jerome Marchand <jmarchan@redhat.com>
> >   Date:   Tue Dec 17 10:45:06 2013 +1100
> > 
> >       mm: add overcommit_kbytes sysctl variable
> 
> Please check whether that linux-next includes
> http://ozlabs.org/~akpm/mmotm/broken-out/mm-add-overcommit_kbytes-sysctl-variable-fix-2.patch

It doesn't, but today's does, so the problem went away. Looks
like that patch got delayed a bit because of the holidays.
