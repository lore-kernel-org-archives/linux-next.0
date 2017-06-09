From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v1] thermal: int340x_thermal: Switch to use new generic
        UUID API
Date: Fri, 9 Jun 2017 15:18:54 +0200
Message-ID: <20170609131854.GA20026@lst.de>
References: <20170609083306.83431-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170609083306.83431-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 09, 2017 at 11:33:06AM +0300, Andy Shevchenko wrote:
> There are new types and helpers that are supposed to be used in
> new code.
> 
> As a preparation to get rid of legacy types and API functions do
> the conversion here.
> 
> The conversion fixes a potential bug in int340x_thermal as well
> since we have to use memcmp() on binary data.

Thanks Andy, applied.
