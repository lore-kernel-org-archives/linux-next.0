From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [s390] next Feb 18: defconfig build break
Date: Thu, 19 Feb 2009 22:18:10 +1030
Message-ID: <200902192218.11781.rusty@rustcorp.com.au>
References: <20090218191640.0b023029.sfr@canb.auug.org.au> <200902191045.25878.rusty@rustcorp.com.au> <20090219095150.GA5808@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:40281 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751826AbZBSLsR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Feb 2009 06:48:17 -0500
In-Reply-To: <20090219095150.GA5808@flint.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk+lkml@arm.linux.org.uk>
Cc: Mike Frysinger <vapier.adi@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "Sachin P. Sant" <sachinp@in.ibm.com>, linux-s390@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com

On Thursday 19 February 2009 20:21:50 Russell King wrote:
> On Thu, Feb 19, 2009 at 10:45:25AM +1030, Rusty Russell wrote:
> > Subject: arm: allow usage of string functions in linux/string.h
> 
> Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> 
> I guess this should go in with the change which caused the breakage.

Well, feel free to queue it yourself too, but now you've acked it I've put it
in my queue ahead of the strstarts patch.

Thanks,
Rusty.
