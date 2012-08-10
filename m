From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: xtensa port maintenance
Date: Fri, 10 Aug 2012 21:15:59 +0000
Message-ID: <201208102115.59946.arnd@arndb.de>
References: <50205592.1030205@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:58476 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758010Ab2HJVQQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Aug 2012 17:16:16 -0400
In-Reply-To: <50205592.1030205@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-next@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Chris Zankel <chris@zankel.net>, Marc Gauthier <marc@tensilica.com>, Kirill Krinkin <kirill.krinkin@gmail.com>

On Monday 06 August 2012, Max Filippov wrote:
> I have a couple of questions regarding the path of xtensa-specific patches
> upstream:
>     - which git tree should they be targeted for? Should I set up a tree for
>       pull requests, or will patches be picked up into some existing tree?
>       (Looks like Linus' tree is the right target. AFAIK previously xtensa
>       patches went mostly through akpm tree).

Setting up a git tree is a good first step if you want to be the official
maintainer, and if you want to get it included into linux-next.

You should also update the maintainers file to list your git tree and name,
and have Chris give you an official approval for that update. My impression
is that he is still occasionally doing work on upstream maintainance but
has moved on to other priorities now. The two of you should decide
together if you want to both be listed as maintainers or one of you
should be a primary contact and the other one doing work in the background.

>     - which mailing lists should they go to?
>       (I guess that besides linux-xtensa@linux-xtensa.org list they should go
>       to linux-kernel@vger.kernel.org for general review. Anything else?)

There is also linux-arch, which has the architecture maintainers. You can
consult that list if you have specific questions about changes that are
going on across architectures.

What kind of changes to you expect to do to the architecture port?
Are there additional platforms you want to get supported? Do you
want to stay compatible with existing user space software, or are you
thinking about moving to the new generic system call interfaces that
would require rebuilding all user land binaries?

	Arnd
