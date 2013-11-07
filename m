From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2013-11-06-16-14 uploaded (block/cmdline-parser.c)
Date: Wed, 06 Nov 2013 18:57:15 -0800
Message-ID: <527B018B.6020604@infradead.org>
References: <20131107001557.B1BDE5A426A@corp2gmr1-2.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:43588 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752733Ab3KGC5V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Nov 2013 21:57:21 -0500
In-Reply-To: <20131107001557.B1BDE5A426A@corp2gmr1-2.hot.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, CaiZhiyong <caizhiyong@huawei.com>

On 11/06/13 16:15, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2013-11-06-16-14 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.
> 
> You will need quilt to apply these patches to the latest Linus release (3.x
> or 3.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> http://ozlabs.org/~akpm/mmotm/series
> 
> The file broken-out.tar.gz contains two datestamp files: .DATE and
> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> followed by the base kernel version against which this patch series is to
> be applied.

on i386:
CONFIG_BLOCK is not enabled!


warning: (MTD_CMDLINE_PARTS) selects BLK_CMDLINE_PARSER which has unmet direct dependencies (BLOCK)

In file included from block/cmdline-parser.c:8:0:
include/linux/cmdline-parser.h:17:12: error: 'BDEVNAME_SIZE' undeclared here (not in a function)
block/cmdline-parser.c: In function 'parse_subpart':
block/cmdline-parser.c:17:2: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
block/cmdline-parser.c:17:14: warning: assignment makes pointer from integer without a cast [enabled by default]
block/cmdline-parser.c:74:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
block/cmdline-parser.c: In function 'parse_parts':
block/cmdline-parser.c:100:11: warning: assignment makes pointer from integer without a cast [enabled by default]
block/cmdline-parser.c:96:7: warning: unused variable 'buf' [-Wunused-variable]
cc1: some warnings being treated as errors



-- 
~Randy
