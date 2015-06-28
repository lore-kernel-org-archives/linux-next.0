From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] modules: elide param_lock if !CONFIG_SYSFS
Date: Sun, 28 Jun 2015 14:51:14 +0930
Message-ID: <87vbe8s911.fsf@rustcorp.com.au>
References: <CALZtONA4kOn2yciNYA2C9QdXuovdjFXBca4EU4CDs6XDiQtxJQ@mail.gmail.com> <1435237448-13684-1-git-send-email-ddstreet@ieee.org> <87616bsd02.fsf@rustcorp.com.au> <CALZtOND_-LahkJE5pD6eQOusT42M4-9ECKZ1cD+F_dPK4CVX8A@mail.gmail.com> <20150627102134.00e58047@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33259 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751000AbbF1FY0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Jun 2015 01:24:26 -0400
In-Reply-To: <20150627102134.00e58047@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dan Streetman <ddstreet@ieee.org>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Rusty,
>
> On Thu, 25 Jun 2015 17:34:31 -0400 Dan Streetman <ddstreet@ieee.org> wrote:
>>
>> On Thu, Jun 25, 2015 at 5:18 PM, Rusty Russell <rusty@rustcorp.com.au> wrote:
>> > Dan Streetman <ddstreet@ieee.org> writes:
>> >> Only include the built-in and per-module param_lock, and corresponding
>> >> lock/unlock functions, if sysfs is enabled.  If there is no sysfs there
>> >> is no need for locking kernel params.
>> >>
>> >> This fixes a build break when CONFIG_SYSFS is not enabled, introduced
>> >> by commit b51d23e.
>> >
>> > This doesn't even come close to applying to my tree?
>> 
>> sorry, I had the !CONFIG_MODULES patch in my tree also, so this was on
>> top of that one:
>> https://lkml.org/lkml/2015/6/24/550
>> 
>> I can resend that one, on top of this one, or you can fix it up.
>> 
>> Sorry for not getting it right the first time ;-)
>
> This is what I ended up applying to yesterday's linux-next:

Thanks, added correct description to previous patch and applied this
on top.

Sorry for the hassle,
Rusty.
