From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the libata tree
Date: Thu, 31 Dec 2015 12:29:15 +1100
Message-ID: <20151231122915.64bc66e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38181 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751126AbbLaB3R (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Dec 2015 20:29:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jaedon Shin <jaedon.shin@gmail.com>

Hi Tejun,

Today's linux-next merge of the libata tree got conflicts all over teh
place due to commit:

  53fab927a8fc ("ata: ahci_brcmstb: add support for MIPS-based platforms")

from the libata tree which seem to contain most (if not all) of Linus'
tree :-(.

I have used the version of the libata tree from next-20151223 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
