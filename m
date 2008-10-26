From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Subject: Re: linux-next: left over things in linux-next after 2.6.28-c1
Date: Sun, 26 Oct 2008 08:40:33 +0100
Message-ID: <49041EF1.8070508@s5r6.in-berlin.de>
References: <20081026005009.50dbbb33.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from einhorn.in-berlin.de ([192.109.42.8]:46329 "EHLO
	einhorn.in-berlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750957AbYJZHk6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 26 Oct 2008 03:40:58 -0400
In-Reply-To: <20081026005009.50dbbb33.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Stephen Rothwell wrote:
> The following is an approximate list of commits left in linux-next
> relative to 2.6.28-rc1.
...
> ieee1394
> 
> 	David Moore (1):
> 	      firewire: Include iso timestamp in headers when header_size > 4
> 
> 	Jay Fenlason (2):
> 	      firewire: add a client_list_lock
> 	      firewire: Survive more than 256 bus resets
> 
> 	Stefan Richter (2):
> 	      firewire: fw-sbp2: extend failure check after SCSI probe
> 	      firewire: convert client_list_lock to mutex

1x new fix for a pull request soon
1x obsoleted by belated info from a problem reporter
3x things which turned out unfit for -next pre 2.6.28-rc1 but I was too
    lazy to temporarily revert in my for-next branch
-- 
Stefan Richter
-=====-==--- =-=- ==-=-
http://arcgraph.de/sr/
