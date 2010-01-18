From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: linux-next: trivial tree build failure
Date: Mon, 18 Jan 2010 09:36:29 +0100
Message-ID: <63386a3d1001180036h2bad24cas8c407edde729678e@mail.gmail.com>
References: <20100118162412.9944c571.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f219.google.com ([209.85.218.219]:49386 "EHLO
	mail-bw0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753560Ab0ARIoT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Jan 2010 03:44:19 -0500
In-Reply-To: <20100118162412.9944c571.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Egger <siccegge@stud.informatik.uni-erlangen.de>, Linus Walleij <linus.walleij@stericsson.com>, Samuel Ortiz <sameo@linux.intel.com>

2010/1/18 Stephen Rothwell <sfr@canb.auug.org.au>:

> Exposed by commit 8dcafdf0475eb4633401d1f0bf0e0d35e4ebb9d5
> "CONFIG_DEBUG_FS wrongly written as CONFIG_DEBUGFS".
> I have reverted that commit for today.

I have sent a proper patch to Sam last night, that fix the #ifdef and
makes the code work.

> That file probably just needs to include <linux/seq_file.h> ...

Not quite, there was some code rot in the #ifdef:ed code as well.

But it should all be fixed now!

Linus Walleij
