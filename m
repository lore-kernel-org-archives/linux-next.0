From: Alex Elder <aelder@sgi.com>
Subject: Re: [PATCH] Fix xfs build when CONFIG_XFS_POSIX_ACL=n
Date: Wed, 28 Jul 2010 09:22:58 -0500
Message-ID: <1280326978.2238.4.camel@doink>
References: <4c3f42cf1240489af5@agluck-desktop.sc.intel.com>
	 <20100726084829.b173ffe3.randy.dunlap@oracle.com>
Reply-To: aelder@sgi.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay3.sgi.com ([192.48.152.1]:47694 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754484Ab0G1OXE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Jul 2010 10:23:04 -0400
In-Reply-To: <20100726084829.b173ffe3.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>

On Mon, 2010-07-26 at 08:48 -0700, Randy Dunlap wrote:
> On Thu, 15 Jul 2010 10:18:07 -0700 Luck, Tony wrote:
> 
> > When CONFIG_XFS_POSIX_ACL is not set "xfs_check_acl" is #defined
> > to NULL - which breaks the code attempting to add a tracepoint
> > on this function.
> > 
> > Only define the tracepoint when the function exists.
> > 
> > Signed-off-by: Tony Luck <tony.luck@intel.com>
> 
> Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Alex, can we get this merged for linux-next, please?
> This problem causes lots of xfs build errors in linux-next without this patch.

Confirmed fixed as of today's linux-next build.	-Alex
