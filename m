From: "J.R. Mauro" <jrm8005@gmail.com>
Subject: Re: Can you add the staging tree to -next?
Date: Thu, 13 Nov 2008 19:13:40 -0500
Message-ID: <3aaafc130811131613j1f4425deodcb3b3f9fd330653@mail.gmail.com>
References: <20081112235600.GA27554@kroah.com>
	 <20081114104421.772feee3.sfr@canb.auug.org.au>
	 <20081114000133.GA19644@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.233]:23318 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752700AbYKNANl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Nov 2008 19:13:41 -0500
Received: by rv-out-0506.google.com with SMTP id k40so1128930rvb.1
        for <linux-next@vger.kernel.org>; Thu, 13 Nov 2008 16:13:40 -0800 (PST)
In-Reply-To: <20081114000133.GA19644@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 13, 2008 at 7:01 PM, Greg KH <greg@kroah.com> wrote:
> On Fri, Nov 14, 2008 at 10:44:21AM +1100, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> On Wed, 12 Nov 2008 15:56:00 -0800 Greg KH <greg@kroah.com> wrote:
>> >
>> > I'm starting to get people sending me patches against -next for the
>> > drivers/staging/ tree that don't apply as -next does not include my
>> > quilt tree of staging patches.
>> >
>> > Can you please pick it up?  You can put it at the end of your series,
>> > and the 'make allmodconfig' option disables building anything in the
>> > drivers/staging/ subdirectory, so it should not have any build or merge
>> > conflicts with anything.
>> >
>> > It can be found at:
>> >     http://kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/gregkh-05-staging/
>> > and is a quilt tree.
>> >
>> > It will follow all the same rules as other trees, with patches only for
>> > the next merge window (2.6.29 right now) in it.
>>
>> OK, I have added it starting today.
>
> Thank you very much, I appreciate it.

Greg, will this suffice for having a git repo for staging, or are you
still planning on a discrete staging repo?

>
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
