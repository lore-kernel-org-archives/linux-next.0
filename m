From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] staging/easycap: make module params private/static,
 fix build
Date: Thu, 11 Nov 2010 14:18:12 -0800
Message-ID: <4CDC6BA4.3060307@oracle.com>
References: <20101111125655.15fa7188.sfr@canb.auug.org.au> <20101111104422.28594510.randy.dunlap@oracle.com> <4CDC67FF.3010006@sciolus.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:51932 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756167Ab0KKWV1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Nov 2010 17:21:27 -0500
In-Reply-To: <4CDC67FF.3010006@sciolus.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "R.M. Thomas" <rmthomas@sciolus.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de

On 11/11/10 14:02, R.M. Thomas wrote:
> Randy Dunlap wrote:
>> The easycap driver has module parameters (bars, gain, & debug)
>> with global scope that intrude on the kernel namespace and cause
>> build problems.  Change the names of them to be driver-specific
>> and make 2 of them static.
> 
> I did do test builds of the driver in-tree prior to submitting the
> recent set of patches, but did not see any warnings so did not spot
> this mistake.  There's presumably something wrong with the way I'm
> building the kernel.

This build problem shows up when this driver is built into the kernel
image, not built as a loadable module.  Did you only build as a loadable
module, maybe?  and what CPU architecture did you build for?  That could
also matter.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
