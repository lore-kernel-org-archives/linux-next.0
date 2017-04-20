From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 20 (bfq)
Date: Thu, 20 Apr 2017 08:24:06 -0700
Message-ID: <83a9471d-08d3-6c78-f778-0896896faafa@infradead.org>
References: <20170420164341.77790320@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:54338 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S970516AbdDTPYM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Apr 2017 11:24:12 -0400
In-Reply-To: <20170420164341.77790320@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, axboe <axboe@kernel.dk>, Paolo Valente <paolo.valente@linaro.org>

On 04/19/17 23:43, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20170419:
> 

on i386:
when CONFIG_CGROUPS is not enabled:

In file included from ../block/bfq-iosched.c:105:0:
../block/bfq-iosched.h:819:22: error: array type has incomplete element type
 extern struct cftype bfq_blkcg_legacy_files[];
                      ^
../block/bfq-iosched.h:820:22: error: array type has incomplete element type
 extern struct cftype bfq_blkg_files[];
                      ^



-- 
~Randy
