From: "R.M. Thomas" <rmthomas@sciolus.org>
Subject: Re: [PATCH -next] staging/easycap: make module params private/static,
 fix build
Date: Thu, 11 Nov 2010 22:02:39 +0000
Message-ID: <4CDC67FF.3010006@sciolus.org>
References: <20101111125655.15fa7188.sfr@canb.auug.org.au> <20101111104422.28594510.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from claranet-outbound-smtp02.uk.clara.net ([195.8.89.35]:37843 "EHLO
	claranet-outbound-smtp02.uk.clara.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752835Ab0KKWfj (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Nov 2010 17:35:39 -0500
In-Reply-To: <20101111104422.28594510.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de

Randy Dunlap wrote:
> The easycap driver has module parameters (bars, gain, & debug)
> with global scope that intrude on the kernel namespace and cause
> build problems.  Change the names of them to be driver-specific
> and make 2 of them static.

I did do test builds of the driver in-tree prior to submitting the
recent set of patches, but did not see any warnings so did not spot
this mistake.  There's presumably something wrong with the way I'm
building the kernel.

Thanks,
Mike
