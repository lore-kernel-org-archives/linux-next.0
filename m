From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: linux-next: build warnings after merge of the tty tree
Date: Mon, 10 Jan 2011 15:55:35 +0100
Message-ID: <AANLkTimd1oOzHau3OoyfLzNTRKJTpwxU5-+bQM6Xssm=@mail.gmail.com>
References: <20101221181158.53f62590.sfr@canb.auug.org.au> <20101221194204.GA11611@kroah.com>
 <20110110114959.691c20f1.sfr@canb.auug.org.au> <20110110005601.GA19570@kroah.com>
 <20110110125908.4251eb45.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:40389 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752350Ab1AJOzx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Jan 2011 09:55:53 -0500
In-Reply-To: <20110110125908.4251eb45.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

On Mon, Jan 10, 2011 at 02:59, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Greg,
>
> On Sun, 9 Jan 2011 16:56:01 -0800 Greg KH <greg@kroah.com> wrote:
>>
>> Yes, Kay just sent me a patch to fix this, which I will queue up after
>> .38-rc1 is out.
>
> It is surely a pretty obvious patch, why not just do a quick test and
> send it on to Linus (or at least your tty-current tree)?
>
> /me gets annoyed by more warnings than necessary - especially when they
> should have never been introduced in the first place.

Honestly, just disable these mindless warnings. They *might* be a hint
for a developer, but they should not be triggered in any non-manual
build.

These warnings usually just misguide people to make make random
trivial things fatal at bootup, which even prevent a box from coming
up and allow to find the real error. If these return values would
really be important, the called function would log the error itself,
not force the caller.

I personally think they are as useless as the dumb 80 char limit
checkpatch likes to warn about. It just makes things worse, hard to
read -- while it possibly should just warn about to many indents,
never the line length.

Like the must_check nonsense, it's all stuff with well-intended, but
with really bad results in reality.

People should really stop imposing these sick rules everywhere in
tools -- everybody of us has enough personal issues already, I really
don't need our software to throw the issues of other people at me on
top. :)

Kay
