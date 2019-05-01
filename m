From: Jessica Yu <jeyu@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the modules tree
Date: Wed, 1 May 2019 10:03:51 +0200
Message-ID: <20190501080351.GB10762@linux-8ccs>
References: <20190501081054.387820b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501081054.387820b2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prarit Bhargava <prarit@redhat.com>
List-Id: linux-next.vger.kernel.org

+++ Stephen Rothwell [01/05/19 08:10 +1000]:
>Hi all,
>
>In commit
>
>  7e470ea99bcd ("kernel/module: Reschedule while waiting for modules to finish loading")
>
>Fixes tag
>
>  Fixes: linux-next commit f9a75c1d717f ("modules: Only return -EEXIST for modules that have finished loading")
>
>has these problem(s):
>
>  - the "linux-next commit" is unexpected (and not really meaningful
>    once this is merged into Linus' tree)
>
>-- 
>Cheers,
>Stephen Rothwell

A fixed verison has been pushed out to modules-next.

Thanks!

Jessica
