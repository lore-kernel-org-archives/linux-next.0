From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: [PATCH] ide: ide-cd.c blocklen is a big-endian value
Date: Thu, 24 Jul 2008 12:16:57 -0700
Message-ID: <1216927017.30386.76.camel@brick>
References: <1216852296.30386.21.camel@brick>
	 <200807242048.20087.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.171]:29573 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753212AbYGXTQ7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jul 2008 15:16:59 -0400
Received: by wf-out-1314.google.com with SMTP id 27so3609499wfd.4
        for <linux-next@vger.kernel.org>; Thu, 24 Jul 2008 12:16:59 -0700 (PDT)
In-Reply-To: <200807242048.20087.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, linux-ide <linux-ide@vger.kernel.org>, Jens Axboe <jens.axboe@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Michael Buesch <mb@bu3sch.de>, Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <petkovbb@googlemail.com>

On Thu, 2008-07-24 at 20:48 +0200, Bartlomiej Zolnierkiewicz wrote:
> On Thursday 24 July 2008, Harvey Harrison wrote:
> > Noticed by sparse between next-20080722 and next-20080723
> > 
> > Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
> 
> Thanks for noticing/fixing this.
> 
> I integrated it into the guilty patch
> ("ide-cd: fix oops when using growisofs").
> 

This is precisely why I'm running sparse on each linux-next, so
no worries.

Harvey
