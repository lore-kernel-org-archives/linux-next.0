From: Keith Busch <keith.busch@intel.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 2 Dec 2015 21:14:00 +0000
Message-ID: <20151202211400.GB31364@localhost.localdomain>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org>
 <20151202164527.GA31048@lst.de>
 <565F5D96.5050902@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <565F5D96.5050902@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Dec 02, 2015 at 02:07:34PM -0700, Jens Axboe wrote:
> Christoph, for-4.5/nvme also fails if integrity isn't enabled:

I forgot about this since I've merged this in my repo to fix:

https://lkml.org/lkml/2015/10/26/546

That ok, or should we handle this differently?
