From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: import of ide quilt series failed
Date: Thu, 12 Mar 2009 23:41:56 +0100
Message-ID: <200903122341.56771.bzolnier@gmail.com>
References: <20090313093048.c61dd9f4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f176.google.com ([209.85.220.176]:64448 "EHLO
	mail-fx0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753630AbZCLWj2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2009 18:39:28 -0400
Received: by fxm24 with SMTP id 24so2378080fxm.37
        for <linux-next@vger.kernel.org>; Thu, 12 Mar 2009 15:39:25 -0700 (PDT)
In-Reply-To: <20090313093048.c61dd9f4.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thursday 12 March 2009, Stephen Rothwell wrote:
> Hi Bart,
> 
> Today's import of the ide tree failed like this:
> 
> ide-floppy-do-not-map-dataless-cmds-to-an-sg.patch
> fatal: corrupt patch at line 52
> 
> Even patch(1) did not like that patch:
> 
> $ patch -p1 -E <.git/rebase-apply/patch 
> patching file drivers/ide/ide-atapi.c
> patching file drivers/ide/ide-floppy.c
> patch unexpectedly ends in middle of line
> 
> I will use yesterday's ide tree for today.

No idea what is wrong as it applies fine here...

I just refreshed the patch in hope that this will fix the issue. :)

Thanks,
Bart
