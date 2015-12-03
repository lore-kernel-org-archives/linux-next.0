From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 3 Dec 2015 08:35:22 +0100
Message-ID: <20151203073522.GA12920@lst.de>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org> <20151202164527.GA31048@lst.de> <565F5D96.5050902@kernel.dk> <20151202211400.GB31364@localhost.localdomain> <565F624C.9090301@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:33365 "EHLO newverein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750858AbbLCHfY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Dec 2015 02:35:24 -0500
Content-Disposition: inline
In-Reply-To: <565F624C.9090301@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <keith.busch@intel.com>, Christoph Hellwig <hch@lst.de>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org

On Wed, Dec 02, 2015 at 02:27:40PM -0700, Jens Axboe wrote:
> On 12/02/2015 02:14 PM, Keith Busch wrote:
>> On Wed, Dec 02, 2015 at 02:07:34PM -0700, Jens Axboe wrote:
>>> Christoph, for-4.5/nvme also fails if integrity isn't enabled:
>>
>> I forgot about this since I've merged this in my repo to fix:
>>
>> https://lkml.org/lkml/2015/10/26/546
>>
>> That ok, or should we handle this differently?
>
> I think that should make it compile, but the behavior will be a bit odd. If 
> you pass in meta and integrity isn't enabled, you'll get an ENOMEM error. 
> That seems a bit nonsensical.
>
> We could make bio_integrity_alloc() return an error pointer. That way we 
> could retain the ifdefs in the bip code, and not let it spread to drivers.

This looks reasonable to me.
