From: Ted Ts'o <tytso@mit.edu>
Subject: Re: [PATCH -next] jbd2: fix build when CONFIG_BUG is not enabled
Date: Thu, 27 Oct 2011 04:06:11 -0400
Message-ID: <20111027080611.GZ31921@thunk.org>
References: <20111011201127.455df266dcbffb1d621f8576@canb.auug.org.au>
 <4E9495C8.1030200@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from li9-11.members.linode.com ([67.18.176.11]:56969 "EHLO
	test.thunk.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753745Ab1J0IGS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Oct 2011 04:06:18 -0400
Content-Disposition: inline
In-Reply-To: <4E9495C8.1030200@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-ext4@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Arnaud Lacombe <lacombar@gmail.com>

On Tue, Oct 11, 2011 at 12:15:20PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> Fix build error when CONFIG_BUG is not enabled:
> 
> fs/jbd2/transaction.c:1175:3: error: implicit declaration of function '__WARN'
> 
> by changing __WARN() to WARN_ON(), as suggested by
> Arnaud Lacombe <lacombar@gmail.com>.
> 
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Arnaud Lacombe <lacombar@gmail.com>

Thanks, applied.

					- Ted
