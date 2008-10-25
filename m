From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for October 24 - powerpc - build failure with !CONFIG_BLK_DEV_IDEDMA_PMAC
Date: Sat, 25 Oct 2008 21:35:15 +0200
Message-ID: <200810252135.16056.bzolnier@gmail.com>
References: <20081024171932.1e8131d0.sfr@canb.auug.org.au> <200810251519.57543.bzolnier@gmail.com> <49036C17.1060604@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.191]:38788 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942AbYJYTg4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 25 Oct 2008 15:36:56 -0400
Received: by mu-out-0910.google.com with SMTP id g7so1086384muf.1
        for <linux-next@vger.kernel.org>; Sat, 25 Oct 2008 12:36:54 -0700 (PDT)
In-Reply-To: <49036C17.1060604@ru.mvista.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: benh@kernel.crashing.org, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-ide@vger.kernel.org

On Saturday 25 October 2008, Sergei Shtylyov wrote:
> Hello.
> 
> Bartlomiej Zolnierkiewicz wrote:
> 
> >>>>>    Hm, looks like this configuration was never buildable -- #ifdef's are missing and wrongly placed. CCing Ben Herrenschmidt...   
> >>>>>           
> >>>> What configuration ?
> >>>>   
> >>>>         
> >>>    See the subject.
> >>>       
> >> Ah ok. We should probably just remove the option...
> >>     
> >
> > Fine with me.  Anybody want an easy +1 patch-point? :)
> >   
> 
>    BTW, why this option selects BLK_DEV_IDEDMA_PCI?

Leftover from the dark-ages...  needs fixing.
