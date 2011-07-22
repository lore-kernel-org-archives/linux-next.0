From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: Tree for July 22 (xen)
Date: Fri, 22 Jul 2011 13:48:33 -0400
Message-ID: <20110722174833.GB7698@dumpdata.com>
References: <20110722164237.2b3f6cbdedafa9e1d3f70867@canb.auug.org.au>
 <20110722092245.589ec3d7.rdunlap@xenotime.net>
 <20110722173548.GA7698@dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:57166 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753830Ab1GVRsv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Jul 2011 13:48:51 -0400
Content-Disposition: inline
In-Reply-To: <20110722173548.GA7698@dumpdata.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, dan.magenheimer@oracle.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, xen-devel@lists.xensource.com

On Fri, Jul 22, 2011 at 01:35:48PM -0400, Konrad Rzeszutek Wilk wrote:
> On Fri, Jul 22, 2011 at 09:22:45AM -0700, Randy Dunlap wrote:
> > On Fri, 22 Jul 2011 16:42:37 +1000 Stephen Rothwell wrote:
> > 
> > > Hi all,
> 
> Hey Randy,
> 
> This only shows up on xen but not xen-two?

n/m. I can reproduce it. Thanks for spotting it, looks like it is missing
an #include there.
