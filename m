From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Subject: Re: linux-next: manual merge of the tests tree
Date: Tue, 22 Jul 2008 17:59:45 +0530
Message-ID: <20080722122945.GC4379@in.ibm.com>
References: <20080722135642.c54172c9.sfr@canb.auug.org.au>
Reply-To: ananth@in.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e32.co.us.ibm.com ([32.97.110.150]:40814 "EHLO
	e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753410AbYGVMas (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Jul 2008 08:30:48 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com [9.17.195.106])
	by e32.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m6MCP3SN022670
	for <linux-next@vger.kernel.org>; Tue, 22 Jul 2008 08:25:03 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m6MCUlPb176764
	for <linux-next@vger.kernel.org>; Tue, 22 Jul 2008 06:30:47 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m6MCUlrU024180
	for <linux-next@vger.kernel.org>; Tue, 22 Jul 2008 06:30:47 -0600
Content-Disposition: inline
In-Reply-To: <20080722135642.c54172c9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org

On Tue, Jul 22, 2008 at 01:56:42PM +1000, Stephen Rothwell wrote:
> Hi Ananth,
> 
> Today's linux-next merge of the tests tree got conflicts in
> lib/Kconfig.debug against Linus' tree.
> 
> I have been carrying the fix to these conflicts for a while but no that
> they are in Linus' tree, you should rebase/merge your tree against his
> and carefully check/test the results.
> 
> My current fixup patch to your tests/Kconfig is below.  It may not be
> complete.

Thanks Stephen!

Sam,

Can you please request Linus to pull the tests tree now that 2.6.27
window is open?

Thanks,
Ananth
