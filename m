From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Tue, 22 Feb 2011 10:21:15 +0100
Message-ID: <20110222092114.GA30279@sortiz-mobl>
References: <20110222142005.946468ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:28766 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753019Ab1BVJVS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Feb 2011 04:21:18 -0500
Content-Disposition: inline
In-Reply-To: <20110222142005.946468ee.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Murthy <arun.murthy@stericsson.com>

Hi Stephen,

On Tue, Feb 22, 2011 at 02:20:05PM +1100, Stephen Rothwell wrote:
> Hi Samuel,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/mfd/ab8500-gpadc.c:20:36: error: linux/mfd/ab8500-gpadc.h: No such file or directory
> 
> Caused by commit 38a7f5349d3820b3603384733cd2f35913f923ea ("mfd: Add new
> ab8500 GPADC driver"). Looks like an include file was forgotten.
That's my fault, I had to manually merge this one and forgot to git add the
header file.
It should be all fixed now, thanks for the notification.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
