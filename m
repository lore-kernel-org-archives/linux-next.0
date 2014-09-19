From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: Tree for Sep 1
Date: Thu, 18 Sep 2014 23:52:03 -0400
Message-ID: <20140919035203.GA28292@mtj.dyndns.org>
References: <20140901230728.GM29327@sirena.org.uk>
 <1627064.QhxvejlWdk@amdc1032>
 <alpine.DEB.2.11.1409020857110.9201@gentwo.org>
 <alpine.DEB.2.11.1409020958530.9608@gentwo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f182.google.com ([209.85.216.182]:55176 "EHLO
	mail-qc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751294AbaISDwH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Sep 2014 23:52:07 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1409020958530.9608@gentwo.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.pitre@linaro.org, Russell King <rmk+kernel@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>

On Tue, Sep 02, 2014 at 10:00:07AM -0500, Christoph Lameter wrote:
> On Tue, 2 Sep 2014, Christoph Lameter wrote:
> 
> > Oww.. This is double indirection deal there. A percpu offset pointing to
> > a pointer?
> >
> > Generally the following is true (definition from
> > include/asm-generic/percpu.h that is used for ARM for raw_cpu_read):
> >
> > #define raw_cpu_read_4(pcp)             (*raw_cpu_ptr(&(pcp)))
> 
> I think what the issue is that we dropped the fetch of the percpu offset
> in the patch. Instead we are using the address of the variable that
> contains the offset. Does this patch fix it?
> 
> 
> Subject: irqchip: Properly fetch the per cpu offset
> 
> The raw_cpu_read() conversion dropped the fetch of the offset
> from base->percpu_base in gic_get_percpu_base.
> 
> Signed-off-by: Christoph Lameter <cl@linux.com>

Applied to percpu/for-3.18-consistent-ops.

Thanks.

-- 
tejun
