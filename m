From: Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Date: Tue, 2 Apr 2013 08:49:56 +0200
Message-ID: <20130402084956.65cc1d65@spider.haslach.nod.at>
References: <20130402172950.1fd8d6653a4c79b319945212@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a.ns.miles-group.at ([95.130.255.143]:47834 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760598Ab3DBGuA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Apr 2013 02:50:00 -0400
In-Reply-To: <20130402172950.1fd8d6653a4c79b319945212@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Am Tue, 2 Apr 2013 17:29:50 +1100
schrieb Stephen Rothwell <sfr@canb.auug.org.au>:

> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/misc/cs5535-mfgpt.c:30:3: warning: missing terminating "
> character [enabled by default] drivers/misc/cs5535-mfgpt.c:31:31:
> warning: missing terminating " character [enabled by default]
> drivers/misc/cs5535-mfgpt.c:384:0: error: unterminated argument list
> invoking macro "MODULE_PARM_DESC" drivers/misc/cs5535-mfgpt.c:27:1:
> error: expected '=', ',', ';', 'asm' or '__attribute__' at end of
> input
> 
> Caused by commit 945480b159aa ("cs5535-mfgpt: Add another reset
> method").
> 
> I have used the char-misc tree from next-20130328 for today.

New patch sent.
A terminating quote was missing.
Looks like I fat fingered it while editing the patch file by hand...

Sorry for that,
//richard
