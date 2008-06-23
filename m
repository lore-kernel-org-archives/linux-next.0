From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: kernel BUG at kernel/workqueue.c:169 (was: linux-next: Tree for June 16)
Date: Mon, 23 Jun 2008 13:15:54 +1000
Message-ID: <200806231315.54490.rusty@rustcorp.com.au>
References: <20080616190103.c3271e3e.sfr@canb.auug.org.au> <1213651727.3275.3.camel@dhcppc4> <1213987718.3134.7.camel@dhcppc4>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:40101 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752291AbYFWDQD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Jun 2008 23:16:03 -0400
In-Reply-To: <1213987718.3134.7.camel@dhcppc4>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>
Cc: rpjday@crashcourse.ca, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Saturday 21 June 2008 04:48:37 Thomas Meyer wrote:
> I tried to bisect this one, but without a consistent result.

That's always suspicious...

> Another thing i tried is to change <linux/kernel.h>:

This will also cause almost everything to be rebuilt.  I find it hard to 
believe this is the culprit; does a "make clean" also fix it?

Thanks,
Rusty.
