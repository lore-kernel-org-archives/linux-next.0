From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Mon, 21 May 2012 05:56:10 -0700
Message-ID: <20120521125610.GB5662@xanatos>
References: <20120521162216.ca7c437235a2cc1aa54cacc9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:42776 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755356Ab2EUM4N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 May 2012 08:56:13 -0400
Content-Disposition: inline
In-Reply-To: <20120521162216.ca7c437235a2cc1aa54cacc9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 21, 2012 at 04:22:16PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/usb/core/hub.c: In function 'usb_disable_lpm':
> drivers/usb/core/hub.c:3394:2: error: implicit declaration of function 'usb_enable_lpm' [-Werror=implicit-function-declaration]
> drivers/usb/core/hub.c: At top level:
> drivers/usb/core/hub.c:3424:6: warning: conflicting types for 'usb_enable_lpm' [enabled by default]
> drivers/usb/core/hub.c:3394:2: note: previous implicit declaration of 'usb_enable_lpm' was here
> drivers/usb/core/driver.c: In function 'usb_probe_interface':
> drivers/usb/core/driver.c:339:2: error: implicit declaration of function 'usb_unlocked_disable_lpm' [-Werror=implicit-function-declaration]
> drivers/usb/core/driver.c:364:3: error: implicit declaration of function 'usb_unlocked_enable_lpm' [-Werror=implicit-function-declaration]
> drivers/usb/core/message.c: In function 'usb_set_interface':
> drivers/usb/core/message.c:1314:2: error: implicit declaration of function 'usb_disable_lpm' [-Werror=implicit-function-declaration]
> drivers/usb/core/message.c:1323:3: error: implicit declaration of function 'usb_enable_lpm' [-Werror=implicit-function-declaration]
> drivers/usb/core/message.c:1368:2: error: implicit declaration of function 'usb_unlocked_enable_lpm' [-Werror=implicit-function-declaration]
> 
> Caused by commit 8306095fd2c1 ("USB: Disable USB 3.0 LPM in critical
> sections").

Hi Stephan,

I'm creating a patch (and verifying the other drivers that were touched
by that commit) right now.  Sorry for the build failures.

Sarah Sharp
