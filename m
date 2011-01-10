From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: linux-next: build warnings after merge of the tty tree
Date: Mon, 10 Jan 2011 01:51:51 +0100
Message-ID: <AANLkTim1c5fY7FNqP+qy0pM-C-SVLJHHR5=dPADeMtjc@mail.gmail.com>
References: <20101221181158.53f62590.sfr@canb.auug.org.au> <20101221194204.GA11611@kroah.com>
 <20110110114959.691c20f1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:35143 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750921Ab1AJAwH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 9 Jan 2011 19:52:07 -0500
In-Reply-To: <20110110114959.691c20f1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

On Mon, Jan 10, 2011 at 01:49, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Greg, Kay,
>
> On Tue, 21 Dec 2010 11:42:04 -0800 Greg KH <greg@kroah.com> wrote:
>>
>> On Tue, Dec 21, 2010 at 06:11:58PM +1100, Stephen Rothwell wrote:
>> >
>> > After merging the tty tree, today's linux-next build (powerpc
>> > ppc64_defconfig) produced these warnings:
>> >
>> > drivers/tty/tty_io.c: In function 'tty_init':
>> > drivers/tty/tty_io.c:3309: warning: ignoring return value of 'device_create_file', declared with attribute warn_unused_result
>> > drivers/tty/vt/vt.c: In function 'vty_init':
>> > drivers/tty/vt/vt.c:2997: warning: ignoring return value of 'device_create_file', declared with attribute warn_unused_result
>> >
>> > Introduced by commit fbc92a3455577ab17615cbcb91826399061bd789 ("tty: add
>> > 'active' sysfs attribute to tty0 and console device").
>>
>> Oops, Kay, care to make up a patch to fix these warnings?
>
> These warnings are now in Linus' tree ...

Discussing with Greg at the moment. Patch is on the way.

Thanks,
Kay
