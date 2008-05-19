From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: x86/driver-core merge failure
Date: Mon, 19 May 2008 16:23:07 +0200
Message-ID: <200805191623.07902.rjw@sisk.pl>
References: <20080519113328.c98700c4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:37263 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756587AbYESOXS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 10:23:18 -0400
In-Reply-To: <20080519113328.c98700c4.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org

On Monday, 19 of May 2008, Stephen Rothwell wrote:
> Hi Greg, Ingo,
> 
> Today's linux-next merge of the x86 tree got a conflict in
> kernel/power/main.c between commit
> 7c6e17af5dfa9e70e1eb32981f3f608ef1d0eca5 ("PM: Introduce new top level
> suspend and hibernation callbacks") from the driver-core tree and commit
> 338e075309d960eb91cc8540f69b9cb5b2967d3e ("sleepy linux self-test") from
> the x86 tree.  The former added a parameter to device_resume() while the
> latter put a suspend_test_start()/suspend_test_finish() pair around the
> device_resume() call in the error path of suspend_devices_and_enter().
> It is a trivial fixup.

Okay, but I think the "sleepy linux self-test" patch should be updated.

Thanks,
Rafael
