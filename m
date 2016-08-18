From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: request new tree for linux-next
Date: Thu, 18 Aug 2016 08:45:31 +0200
Message-ID: <CAJfpegtBESANiPjGGbMetJ4h+X_QR2c35BnaCShmH4hfepMwjA@mail.gmail.com>
References: <CAJfpegsWt52zN33xzyXzQEjmT-rTjJG6vU_vQ_iEejFtVZ-MYA@mail.gmail.com>
 <20160818094835.170ef2fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35560 "EHLO
	mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092AbcHRGpe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Aug 2016 02:45:34 -0400
Received: by mail-oi0-f67.google.com with SMTP id e80so2427415oig.2
        for <linux-next@vger.kernel.org>; Wed, 17 Aug 2016 23:45:34 -0700 (PDT)
In-Reply-To: <20160818094835.170ef2fd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

On Thu, Aug 18, 2016 at 1:48 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Miklos,
>
> On Wed, 17 Aug 2016 14:58:17 +0200 Miklos Szeredi <miklos@szeredi.hu> wrote:
>>
>> Could you please add
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git#next
>>
>> to -next?
>>
>> This is for any filesystem related stuff that doesn't fit in the fuse
>> or overlayfs queues.
>
> Added from today.  Called vfs-miklos.  Is this intended to be merged
> via Al's tree, or directly to Linus?
>
> I do note that none of the commits have any Acked-by or Reviewed-by tags ...

Via Al.

I plan to post these, but they are conflict prone so I think it's
worth getting them into -next ASAP.

Thanks,
Miklos
