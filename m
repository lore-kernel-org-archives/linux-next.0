From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the slab tree
Date: Wed, 13 Aug 2008 10:10:47 +0300
Message-ID: <48A288F7.6060901@cs.helsinki.fi>
References: <20080813145741.43da1fc8.sfr@canb.auug.org.au>	<48A27CEF.3040708@cs.helsinki.fi> <20080813171116.6cce0139.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:58600 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751362AbYHMHOU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Aug 2008 03:14:20 -0400
In-Reply-To: <20080813171116.6cce0139.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, vegard.nossum@gmail.com

Hi Stephen,

Stephen Rothwell wrote:
> You should *never* base anything on linux-next if it is to be included in
> linux-next.  What you should do is merge in Linus' latest tree (since
> that is the other side of the conflict, in this case) and you will get the
> same conflict and you can fix it in the merge that you do. Then tomorrow,
> I won't see the conflict when I do my merge of your updated tree.

OK, thanks! But what about kmemcheck then? We have conflicts there that 
won't be resolved until 2.6.28. Does this mean I should grab the 
kmemcheck patches to my tree now to fix them?
