From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] compat_ioctl: fix make headers_check regression
Date: Thu, 07 Jul 2011 08:19:04 +0200
Message-ID: <4E154FD8.8010604@kernel.dk>
References: <20110704134842.7ab89126.sfr@canb.auug.org.au> <20110704100316.GA15894@sig21.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0122700014.0.fullrate.dk ([95.166.99.235]:60995 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753202Ab1GGGTI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jul 2011 02:19:08 -0400
In-Reply-To: <20110704100316.GA15894@sig21.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Stezenbach <js@sig21.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

On 2011-07-04 12:03, Johannes Stezenbach wrote:
> Fix headers_check error introduced by 390192b30057:
> 
> include/linux/fd.h:6: included file 'linux/compat.h' is not exported

Thanks!

-- 
Jens Axboe
