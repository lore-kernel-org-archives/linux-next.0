From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next: build warning
Date: Fri, 29 Aug 2008 07:09:35 -0500
Message-ID: <48B7E6FF.4010205@windriver.com>
References: <20080829181433.78a5ae42.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:65079 "EHLO mail.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754264AbYH2MJt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Aug 2008 08:09:49 -0400
In-Reply-To: <20080829181433.78a5ae42.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Thanks Stephen,

My apologies for introducing the error.  This particular patch had not
undergone, final testing before making it to the linux-next tree (IE
checkpatch, boot regression, sparse, code inspection sanity).  It
accidentally got pushed while testing all the script changes from
"git-foo" to "git foo".

As a side note, checkpatch tells one to use strict_strtoul instead of
simple_strtoul, but they are obviously not "pin compatible". :-)

Cheers,
Jason.

Stephen Rothwell wrote:
> Hi Jason,
>
> The current linux-next build (x86_64 allmodconfig) gives this warning:
>
> drivers/char/tty_io.c: In function 'tty_find_polling_driver':
> drivers/char/tty_io.c:307: warning: passing argument 2 of 'strict_strtoul' makes integer from pointer without a cast
> drivers/char/tty_io.c:307: warning: passing argument 3 of 'strict_strtoul' makes pointer from integer without a cast
>
> Which points to an actual bug introduced by commit
> 8a89d640448c261c248594511c72db0569725058 ("kgdboc,tty: Fix tty polling
> search to use name correctly") from the kgdb tree.
>
> simple_strtol() and strict_strtoul() take different parameters and have
> different return values.
>
> Warnings are important!  Please take a more care.
>
> I will revert that commit from linux-next for today.
>   
