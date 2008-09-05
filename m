From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for September 4
Date: Thu, 4 Sep 2008 21:44:37 -0700
Message-ID: <20080904214437.c53f02d9.akpm@linux-foundation.org>
References: <20080904193606.573f2cb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:37121 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751671AbYIEEpJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Sep 2008 00:45:09 -0400
In-Reply-To: <20080904193606.573f2cb3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Thu, 4 Sep 2008 19:36:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git

The infamous Vaio hasn't finished catching up with you guys yet. 
Something in linux-next broke suspend-to-RAM.

An `echo mem > /sys/power/state' causes "Freezing of tasks failed after
20.00 seconds (1 tasks refusing to freeze):"

dmesg: http://userweb.kernel.org/~akpm/dmesg-sony-suspend.txt
config: http://userweb.kernel.org/~akpm/config-sony.txt

This only happens after the X server has been started.

Mainline is OK.
