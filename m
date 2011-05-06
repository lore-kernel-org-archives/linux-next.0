From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the final tree (suspend tree related)
Date: Fri, 6 May 2011 20:15:42 +0200
Message-ID: <201105062015.43024.rjw@sisk.pl>
References: <20110506135345.a885d08a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:56455 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751131Ab1EFSPS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 May 2011 14:15:18 -0400
In-Reply-To: <20110506135345.a885d08a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday, May 06, 2011, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> drivers/built-in.o: In function `_request_firmware':
> firmware_class.c:(.text+0x385c8): undefined reference to `usermodehelper_is_disabled'
> 
> Caused by commit 3e61c4dd3e1e ("PM: Print a warning if firmware is
> requested when tasks are frozen").  usermodehelper_is_disabled is only
> defined if CONFIG_PM_SLEEP is set.
> 
> I have reverted that commit for today.

Should be fixed now, sorry for the trouble.

Thanks,
Rafael
