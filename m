From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: staging: zsmalloc appears to break linux-next
Date: Wed, 7 Mar 2012 13:33:39 -0800
Message-ID: <20120307213339.GA30036@kroah.com>
References: <CAP=VYLoSR2ygm98jhiVJ8FYTU-cjHvXpJRoNSUPeGdb515tSwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:60415 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758483Ab2CGVeM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Mar 2012 16:34:12 -0500
Received: by yhmm54 with SMTP id m54so3233859yhm.19
        for <linux-next@vger.kernel.org>; Wed, 07 Mar 2012 13:34:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAP=VYLoSR2ygm98jhiVJ8FYTU-cjHvXpJRoNSUPeGdb515tSwQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org

On Tue, Mar 06, 2012 at 08:06:41PM -0500, Paul Gortmaker wrote:
> Hi Greg,
> 
> The allmodconfig in linux-next is failing on zsmalloc as follows:
> 
> drivers/staging/zsmalloc/zsmalloc-main.c:255: error:
> 'MAX_PHYSMEM_BITS' undeclared (first use in this function)
> 
> At 1st glance, it looks to be missing an include of asm/sparsemem.h
> 
> Fail log is here:
> 
>    http://kisskb.ellerman.id.au/kisskb/buildresult/5806748/
> 
> Apologies if this is something you are aware of already.

No problem, this should be fixed up in the next linux-next release, I
just added some patches that should fix it.

If not, please let me know.

thanks,

greg k-h
