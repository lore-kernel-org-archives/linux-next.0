From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: input tree build failure
Date: Mon, 9 Mar 2009 22:02:51 -0700
Message-ID: <20090310050250.GB18546@dtor-d630.eng.vmware.com>
References: <20090310154919.31f45de6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f122.google.com ([209.85.221.122]:46222 "EHLO
	mail-qy0-f122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751575AbZCJFDA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2009 01:03:00 -0400
Received: by qyk28 with SMTP id 28so1500303qyk.33
        for <linux-next@vger.kernel.org>; Mon, 09 Mar 2009 22:02:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20090310154919.31f45de6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Henrik Rydberg <rydberg@euromail.se>

Hi Stephen,

On Tue, Mar 10, 2009 at 03:49:19PM +1100, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/input/mouse/bcm5974.c: In function 'report_tp_state':
> drivers/input/mouse/bcm5974.c:301: error: 'raw_n' undeclared (first use in this function)
> drivers/input/mouse/bcm5974.c:341: error: 'ibt' undeclared (first use in this function)
> 
> Caused by commit d86c56b75718295025be895a0f7a157298c84491 ("Input:
> bcm5974 - augment debug information").
> 
> I have merged the version of the input tree from next-20090306 instead of
> today's.

I just noticed the failure and rebuilt the tree without that patch as
it was dependent upon another bcm change. Sorry about that.

-- 
Dmitry
