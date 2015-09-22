From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Tue, 22 Sep 2015 18:31:04 +0300
Message-ID: <20150922153104.GA19024@node.dhcp.inet.fi>
References: <20150922132751.GB17969@node.dhcp.inet.fi>
 <201509221357.t8MDv6G5015271@ignucius.se.axis.com>
 <20150922151835.GM4029@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:38607 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757975AbbIVPbH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Sep 2015 11:31:07 -0400
Received: by wiclk2 with SMTP id lk2so29803754wic.1
        for <linux-next@vger.kernel.org>; Tue, 22 Sep 2015 08:31:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150922151835.GM4029@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Hans-Peter Nilsson <hans-peter.nilsson@axis.com>, starvik@axis.com, linux@roeck-us.net, jespern@axis.com, hughd@google.com, kirill.shutemov@linux.intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, minchan@kernel.org, linux-cris-kernel@axis.com

On Tue, Sep 22, 2015 at 08:18:35AM -0700, Paul E. McKenney wrote:
> On Tue, Sep 22, 2015 at 03:57:06PM +0200, Hans-Peter Nilsson wrote:
> > I guess you hit the right spot, but I'd think people would be
> > more comfortable with aligning to sizeof (void *).
> 
> I would indeed prefer sizeof(void *).

Do you prefer to have the attribute set for whole structure or for ->next?
I think attribute on ->next is more appropriate from documentation POV.

-- 
 Kirill A. Shutemov
