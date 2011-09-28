From: Jouni Malinen <jouni@qca.qualcomm.com>
Subject: Re: linux-next: manual merge of the wireless tree with the
 wireless-current tree
Date: Wed, 28 Sep 2011 12:10:18 +0300
Message-ID: <20110928091018.GC2758@jouni.qca.qualcomm.com>
References: <20110928131917.fe58aa3efa5549a9b3a6e3da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254]:24618 "EHLO
	wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752017Ab1I1JKZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 05:10:25 -0400
Content-Disposition: inline
In-Reply-To: <20110928131917.fe58aa3efa5549a9b3a6e3da@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 28, 2011 at 01:19:17PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the wireless tree got a conflict in
> net/wireless/nl80211.c between commit 1b9ca0272ffa ("cfg80211: Fix
> validation of AKM suites") from the wireless-current tree and commit
> 6d30240e3d68 ("cfg80211: Remove strict validation of AKM suites") from
> the wireless tree.
> 
> The latter seems to make the former partly unneccessary, so I used that
> (see below).

The former was a semi-urgent bug fix which was the reason for pushing it
out more quickly. The latter does indeed remove half of the fix (the
wrong count used in the for loop), but the first part to validate
n_akm_suites is still needed. As long as you kept that from the former,
the latter one should indeed be used. These commits should apply cleanly
on top of each other when applied, but I'm not sure how that ends up
being handled for linux-next.

 
-- 
Jouni Malinen                                            PGP id EFC895FA
