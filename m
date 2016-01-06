From: Or Gerlitz <ogerlitz@mellanox.com>
Subject: Re: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Wed, 6 Jan 2016 16:46:42 +0200
Message-ID: <568D28D2.4090507@mellanox.com>
References: <20151231133022.0b3ecab9@canb.auug.org.au>
 <20160104124450.7ba21c87@canb.auug.org.au> <5689DEA0.1020803@redhat.com>
 <20160104193616.GB30315@fieldses.org>
 <24AC8112-95A2-4D7B-8048-3D7D50A78B90@oracle.com>
 <20160106121529.GA21780@lst.de>
 <90E07B04-AAFD-45E9-85EA-44C659191180@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-db5eur01on0078.outbound.protection.outlook.com ([104.47.2.78]:57216
	"EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751981AbcAFOq6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Jan 2016 09:46:58 -0500
In-Reply-To: <90E07B04-AAFD-45E9-85EA-44C659191180@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, "J. Bruce Fields" <bfields@fieldses.org>, Doug Ledford <dledford@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML Kernel <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>

On 1/6/2016 4:24 PM, Chuck Lever wrote:
> Actually, one of Or's for-4.5 devattr patches doesn't appear to have the proper Ack's for the changes under net/sunrpc/xprtrdma either.

Chuck,

Lets be concrete... anything wrong with patch [1]?

Or.

[1]  commit e3e45b1 "xprtrdma: Avoid calling ib_query_device"

in git://git.kernel.org/pub/scm/linux/kernel/git/dledford/rdma.git 
k.o/for-4.5

http://git.kernel.org/cgit/linux/kernel/git/dledford/rdma.git/commit/?h=k.o/for-4.5&id=e3e45b1b43988b99007a9908ca0ba738b3fbd0ff
