From: Vasiliy Kulikov <segoon@openwall.com>
Subject: Re: linux-next: manual merge of the akpm tree with the slab tree
Date: Wed, 28 Sep 2011 13:10:05 +0400
Message-ID: <20110928091005.GA7203@albatros>
References: <20110928190158.d313ae65b9dcd0007fff0836@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:38949 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753861Ab1I1JK7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 05:10:59 -0400
Content-Disposition: inline
In-Reply-To: <20110928190158.d313ae65b9dcd0007fff0836@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>

On Wed, Sep 28, 2011 at 19:01 +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in mm/slab.c
> between commit ab067e99d22e ("mm: restrict access to slab files under
> procfs and sysfs") from the slab tree and commit ea14c46ee4d9 ("mm:
> restrict access to /proc/slabinfo") from the akpm tree.
> 
> The former is a superset of the latter, so I dropped that patch from the
> akpm tree.

Oops, sorry, Andrew, I would send the patch with /sys/kernel/slab/ only
if I knew that you've picked the first patch (I didn't receive a tip).
Where does -mm tree lives now?

Thanks,

-- 
Vasiliy Kulikov
http://www.openwall.com - bringing security into open computing environments
