From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Subject: Re: [PATCH 0/2] Tentative fix for the divide-by-zero on
 score/paris/..
Date: Thu, 16 Apr 2015 10:21:16 +0200
Message-ID: <20150416082116.GB6703@chrystal.uk.oracle.com>
References: <20150414165000.GA19434@roeck-us.net>
 <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
 <552E6722.1080507@roeck-us.net>
 <20150415211956.GA6703@chrystal.uk.oracle.com>
 <552F13AF.5030606@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:20439 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752251AbbDPITF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Apr 2015 04:19:05 -0400
Content-Disposition: inline
In-Reply-To: <552F13AF.5030606@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

On Wed, Apr 15, 2015 at 06:43:11PM -0700, Guenter Roeck wrote:
> 
> For
> 
>  >From 2e9abac9cbde18af48951c54d52c9c515f9883a7 Mon Sep 17 00:00:00 2001
> From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
> Date: Wed, 15 Apr 2015 22:39:50 +0200
> Subject: [PATCH] modpost: do not try to match the SHT_NUL section.
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 

Thanks a lot Guenter!

> Let me know if you can find a score toolchain - otherwise I'll make a copy
> of mine available.

I could not find one, if it's not too much trouble for you to make yours
available that'd be great.

Thanks,
Quentin
