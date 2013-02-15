From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Fri, 15 Feb 2013 20:05:51 +0000
Message-ID: <201302152005.51575.arnd@arndb.de>
References: <20130215162657.6dd03d27e8cfed0c134b5dd3@canb.auug.org.au> <20130215173429.GA27707@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:54177 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750911Ab3BOUGA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Feb 2013 15:06:00 -0500
In-Reply-To: <20130215173429.GA27707@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Stevenson <david@avoncliff.com>

On Friday 15 February 2013, Greg KH wrote:
> On Fri, Feb 15, 2013 at 04:26:57PM +1100, Stephen Rothwell wrote:
> > 
> > After merging the char-misc tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> > 
> > drivers/w1/slaves/w1_therm.c: In function 'w1_therm_read':
> > drivers/w1/slaves/w1_therm.c:245:15: warning: 'crc' may be used uninitialized in this function [-Wuninitialized]
> > 
> > Its a false positive, but it was introduced by commit 867ff9880d5d
> > ("w1_therm: Retries: remove old code add CRC")
> 
> I don't see that here with gcc 4.7.1, perhaps you need to upgrade your
> version of gcc to not show these false positives?

I have finally put the pieces of the puzzle together. I already knew
that some of these warnings only happen when building with -Os (even
in gcc-4.8), since gcc turns off the inlining at a point after it
determines that the variable might be used uninitialized but before
determining that it's actually isn't.

I think the best way forward is to disable this particular warning
when building with -Os (which is enabled in allyesconfig). A false
positive seems more harmful than a false negative here, because it
prompts people to add broken initializations. This patch indeed
makes the majority of the allyesconfig warnings on ARM go away.
For the regular defconfig builds, we are already mostly clean,
and those are built with -O2.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/Makefile b/Makefile
index 0b4bf62..4d60d97 100644
--- a/Makefile
+++ b/Makefile
@@ -570,7 +570,7 @@ endif # $(dot-config)
 all: vmlinux
 
 ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
-KBUILD_CFLAGS	+= -Os
+KBUILD_CFLAGS	+= -Os $(call cc-option,-Wno-maybe-uninitialized,)
 else
 KBUILD_CFLAGS	+= -O2
 endif
