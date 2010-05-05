From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [PATCH -next] infiniband: fix cxgb4 printk format warnings
Date: Wed, 05 May 2010 11:57:14 -0700
Message-ID: <adaaasekwhh.fsf@roland-alpha.cisco.com>
References: <20100428164341.cee2911a.sfr@canb.auug.org.au>
	<20100428103356.931ba48c.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-4.cisco.com ([171.68.10.86]:26017 "EHLO
	sj-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752739Ab0EES5Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 May 2010 14:57:24 -0400
In-Reply-To: <20100428103356.931ba48c.randy.dunlap@oracle.com> (Randy Dunlap's
	message of "Wed, 28 Apr 2010 10:33:56 -0700")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Roland Dreier <rolandd@cisco.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Thanks, rolled this into the new cxgb4 driver.

 > Wouldn't it be Good if virt_to_phys() returned the same typed value
 > on all arches?

heh.

 > Note: cxgb4 needs MAINTAINER info.

I'll try to take care of it.

Thanks
-- 
Roland Dreier <rolandd@cisco.com> || For corporate legal information go to:
http://www.cisco.com/web/about/doing_business/legal/cri/index.html
