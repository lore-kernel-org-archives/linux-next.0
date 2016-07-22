From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: next-20160722 build: 1 failures 5 warnings (next-20160722)
Date: Fri, 22 Jul 2016 12:29:22 +0100
Message-ID: <57920392.5070009@arm.com>
References: <E1bQXSf-0008Uu-Ej@optimist> <20160722103829.GY6509@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:52604 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753329AbcGVL30 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Jul 2016 07:29:26 -0400
In-Reply-To: <20160722103829.GY6509@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Matthew Wilcox <matthew.r.wilcox@intel.com>, Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>
Cc: xfs@oss.sgi.com, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org

On 22/07/16 11:38, Mark Brown wrote:
[...]
> DAX is explicitly disabled on
> 32 bit ARM due to problems with virtual aliasing caches (it's not clear
> to me that it shouldn't also be disabled for arm64 for the same reason).

>From ARMv7 onwards, data caches have to behave as if PIPT, so I wouldn't
expect there to be a problem for arm64.

Robin.
