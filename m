From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Fri, 15 Feb 2013 18:07:46 +0000
Message-ID: <201302151807.46217.arnd@arndb.de>
References: <20130215162657.6dd03d27e8cfed0c134b5dd3@canb.auug.org.au> <20130215173429.GA27707@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:50825 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751988Ab3BOSH5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Feb 2013 13:07:57 -0500
In-Reply-To: <20130215173429.GA27707@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Stevenson <david@avoncliff.com>

On Friday 15 February 2013, Greg KH wrote:
> On Fri, Feb 15, 2013 at 04:26:57PM +1100, Stephen Rothwell wrote:
> > Hi all,
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

I see the same warning with gcc-4.6.3, 4.7.2 and 4.8.0-20130114 on ARM.

In case of 4.8, the output is

drivers/w1/slaves/w1_therm.c: In function 'w1_therm_read':
drivers/w1/slaves/w1_therm.c:245:15: warning: 'crc' may be used uninitialized in this function [-Wmaybe-uninitialized]
  c -= snprintf(buf + PAGE_SIZE - c, c, ": crc=%02x %s\n",
               ^

I actually see much more of these false positives with 4.7 and 4.8 than
I get with 4.6, which is the main reason for me to use 4.6 for my daily
builds. I agree that this particular false positive is an especially
dumb one and it would be good to not just shut up gcc by initializing
it, but I have no other idea what to do with the hundreds of such
warnings I get.

	Arnd
