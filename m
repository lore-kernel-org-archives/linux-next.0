From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: linux-next: Tree for Jun 27 (dm-thin.c)
Date: Wed, 27 Jun 2012 17:18:50 +0100
Message-ID: <20120627161850.GE22768@agk-dp.fab.redhat.com>
References: <20120627132217.f8bbdd1f467711419123d188@canb.auug.org.au> <4FEB312D.5020608@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:1392 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751554Ab2F0QTB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jun 2012 12:19:01 -0400
Content-Disposition: inline
In-Reply-To: <4FEB312D.5020608@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Joe Thornber <dm-devel@redhat.com>, Alasdair Kergon <agk@redhat.com>

On Wed, Jun 27, 2012 at 09:13:33AM -0700, Randy Dunlap wrote:
> drivers/md/dm-thin.c: In function 'pool_preresume':
> drivers/md/dm-thin.c:2129:3: warning: format '%llu' expects type 'long long unsigned int', but argument 2 has type 'sector_t'
 
Thanks - fixed for tomorrow.

Alasdair
