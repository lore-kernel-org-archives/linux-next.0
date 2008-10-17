From: "Bartlomiej Zolnierkiewicz" <bzolnier@gmail.com>
Subject: Re: linux-next: manual merge of the bdev tree
Date: Fri, 17 Oct 2008 15:24:53 +0200
Message-ID: <58cb370e0810170624y20090878pa0dff1a41b851fd5@mail.gmail.com>
References: <20081017183557.f831ab54.sfr@canb.auug.org.au>
	 <20081017184259.b66089bc.sfr@canb.auug.org.au>
	 <58cb370e0810170158p666c1dbcm6f7b08b4aa7bdffb@mail.gmail.com>
	 <20081017111423.GI28946@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.228]:55903 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753684AbYJQNYy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Oct 2008 09:24:54 -0400
Received: by rv-out-0506.google.com with SMTP id k40so557024rvb.1
        for <linux-next@vger.kernel.org>; Fri, 17 Oct 2008 06:24:54 -0700 (PDT)
In-Reply-To: <20081017111423.GI28946@ZenIV.linux.org.uk>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Fri, Oct 17, 2008 at 1:14 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Fri, Oct 17, 2008 at 10:58:42AM +0200, Bartlomiej Zolnierkiewicz wrote:
>
>> Yes, the common ide-{disk,floppy}.c code resides now in ide-gd.c.
>>
>> > I got a bit harder after that ... so I have again dropped the bdev for
>> > today.
>>
>> This may be actually my fault since I remember Al asking me about some
>> conflicting
>> changes during KS/LPC? (though I later forgot about it).
>>
>> Al, is stuff in bdev-next going in during this merge window?  If so
>> please push it
>> to Linus ASAP and I'll take care of fixing IDE patches.  Otherwise I'm
>> going to push
>> IDE stuff to Linus and you'll have to fixup bdev-next. ;-)
>
> As the matter of fact, I've got bdev-next variant covering ide-gd, so
> if you can push the relevant ide patch(es) to Linus, bdev would be ready

Great!  Thanks for taking care of it.

> to go.  Or I can push the mainline-based variant and send the pieces
>
> that affect ide-gd your way (basically, it's a matter of f_mode/f_flags
> stuff being touched in ide-gd instead of ide-floppy, converting your
> disk_ops->ioctl() to sane prototype and converting ide-gd.c to new
> bdev method prototypes).  Up to you...

I prefer to push IDE changes first...

[ I'll send another pull request to Linus later today. ]

Bart
