From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] Fix xfs build when CONFIG_XFS_POSIX_ACL=n
Date: Thu, 15 Jul 2010 20:00:38 +0200
Message-ID: <20100715180038.GA1396@lst.de>
References: <4c3f42cf1240489af5@agluck-desktop.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:48841 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933810Ab0GOSBB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jul 2010 14:01:01 -0400
Content-Disposition: inline
In-Reply-To: <4c3f42cf1240489af5@agluck-desktop.sc.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Alex Elder <aelder@sgi.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>, Randy Dunlap <randy.dunlap@oracle.com>

On Thu, Jul 15, 2010 at 10:18:07AM -0700, Luck, Tony wrote:
> When CONFIG_XFS_POSIX_ACL is not set "xfs_check_acl" is #defined
> to NULL - which breaks the code attempting to add a tracepoint
> on this function.
> 
> Only define the tracepoint when the function exists.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>

Thanks, that's much better than the stubbing changes I had prepared.


Reviewed-by: Christoph Hellwig <hch@lst.de>
