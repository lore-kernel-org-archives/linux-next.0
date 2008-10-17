From: "Bartlomiej Zolnierkiewicz" <bzolnier@gmail.com>
Subject: Re: linux-next: manual merge of the bdev tree
Date: Fri, 17 Oct 2008 10:58:42 +0200
Message-ID: <58cb370e0810170158p666c1dbcm6f7b08b4aa7bdffb@mail.gmail.com>
References: <20081017183557.f831ab54.sfr@canb.auug.org.au>
	 <20081017184259.b66089bc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.225]:33257 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752131AbYJQI6n (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Oct 2008 04:58:43 -0400
Received: by rv-out-0506.google.com with SMTP id k40so446264rvb.1
        for <linux-next@vger.kernel.org>; Fri, 17 Oct 2008 01:58:43 -0700 (PDT)
In-Reply-To: <20081017184259.b66089bc.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org

On Fri, Oct 17, 2008 at 9:42 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Al,
>
> On Fri, 17 Oct 2008 18:35:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the bdev tree got a conflict in
>> drivers/ide/ide-floppy.c between commits from the ide tree and commit
>> a55897a7d06734d1ae32124a5e19cb903c33b8e3 ("[PATCH] eliminate use of
>> ->f_flags in block methods") from the bdev tree.
>>
>> Again you don't need to patch drivers/ide/ide-floppy.c any more, but
>> drivers/ide/ide-gd.c instead.  Patch below.

Yes, the common ide-{disk,floppy}.c code resides now in ide-gd.c.

> I got a bit harder after that ... so I have again dropped the bdev for
> today.

This may be actually my fault since I remember Al asking me about some
conflicting
changes during KS/LPC? (though I later forgot about it).

Al, is stuff in bdev-next going in during this merge window?  If so
please push it
to Linus ASAP and I'll take care of fixing IDE patches.  Otherwise I'm
going to push
IDE stuff to Linus and you'll have to fixup bdev-next. ;-)

Thanks,
Bart
