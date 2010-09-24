From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: build warning from Linus' tree
Date: Fri, 24 Sep 2010 14:32:19 +0200
Message-ID: <20100924123215.GA5368@nowhere>
References: <20100924140859.038ccf89.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:42892 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753270Ab0IXMc0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Sep 2010 08:32:26 -0400
Content-Disposition: inline
In-Reply-To: <20100924140859.038ccf89.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 24, 2010 at 02:08:59PM +1000, Stephen Rothwell wrote:
> Hi Arnd,
> 
> Today's (and lots before) linux-next build (i386 defconfig) produced this
> warning:
> 
> fs/autofs4/root.c:31: warning: 'autofs4_root_compat_ioctl' declared 'static' but never defined
> 
> Introduced by commit c9243f5bdd6637b2bb7dc254b54d9edf957ef17e
> ("autofs/autofs4: Move compat_ioctl handling into fs").


Yeah, I've seen two patches:

autofs: only declare function when CONFIG_COMPAT is defined
autofs4: fix compilation warning

I'm going to relay them. Thanks!
