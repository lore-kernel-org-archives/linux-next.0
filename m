From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Subject: Re: [PATCH 0/2] Tentative fix for the divide-by-zero on
 score/paris/..
Date: Thu, 16 Apr 2015 15:58:18 +0200
Message-ID: <20150416135818.GC6703@chrystal.uk.oracle.com>
References: <20150414165000.GA19434@roeck-us.net>
 <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
 <552E6722.1080507@roeck-us.net>
 <20150415211956.GA6703@chrystal.uk.oracle.com>
 <552F13AF.5030606@roeck-us.net>
 <20150416082116.GB6703@chrystal.uk.oracle.com>
 <552FAF4C.2050202@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:22829 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754030AbbDPN4E (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Apr 2015 09:56:04 -0400
Content-Disposition: inline
In-Reply-To: <552FAF4C.2050202@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

On Thu, Apr 16, 2015 at 05:47:08AM -0700, Guenter Roeck wrote:
> On 04/16/2015 01:21 AM, Quentin Casasnovas wrote:
> > On Wed, Apr 15, 2015 at 06:43:11PM -0700, Guenter Roeck wrote:
> >> Let me know if you can find a score toolchain - otherwise I'll make a copy
> >> of mine available.
> >
> > I could not find one, if it's not too much trouble for you to make yours
> > available that'd be great.
> >
> 
> Hi Quentin,

Hi Guenter,

> 
> Try http://server.roeck-us.net/qemu/score.tgz. I have it installed in /opt/kernel,
> and build the kernel with
> 
> PATH=/opt/kernel/score/bin:${PATH}
> make ARCH=score CROSS_COMPILE=score-elf-
> 
> 
> Hope this helps,

It did, thanks a lot!  I shouldn't be able to break score now.. :-)

Quentin
