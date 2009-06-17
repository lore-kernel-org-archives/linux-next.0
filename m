From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: linux-next: device-mapper tree build warnings
Date: Wed, 17 Jun 2009 13:37:22 +0100
Message-ID: <20090617123722.GD8912@agk-dp.fab.redhat.com>
References: <20090617130806.c17ec577.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:60384 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756422AbZFQMh0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Jun 2009 08:37:26 -0400
Content-Disposition: inline
In-Reply-To: <20090617130806.c17ec577.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>

On Wed, Jun 17, 2009 at 01:08:06PM +1000, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
> drivers/md/dm-delay.c: In function 'delay_iterate_devices':
> drivers/md/dm-delay.c:327: warning: passing argument 1 of 'fn' from incompatible pointer type
> drivers/md/dm-delay.c:327: note: expected 'struct dm_target *' but argument is of type 'struct delay_c *'
> drivers/md/dm-delay.c:332: warning: passing argument 1 of 'fn' from incompatible pointer type
> drivers/md/dm-delay.c:332: note: expected 'struct dm_target *' but argument is of type 'struct delay_c *'
> Introduced by commit ac2152571c038de73be920db171fb438d32bb744
> ("dm-targets-introduce-iterate-devices-fn").

Resolved, thanks.

Alasdair
