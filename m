From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 3 Dec 2015 10:06:38 +0100
Message-ID: <20151203090638.GA14329@lst.de>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org> <20151202164527.GA31048@lst.de> <565F5D96.5050902@kernel.dk> <565FFFA5.6000003@bjorling.me>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <565FFFA5.6000003@bjorling.me>
Sender: linux-kernel-owner@vger.kernel.org
To: Matias =?iso-8859-1?Q?Bj=F8rling?= <m@bjorling.me>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Mark Brown <broonie@kernel.org>, Keith Busch <keith.busch@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Dec 03, 2015 at 09:39:01AM +0100, Matias Bj=F8rling wrote:
> A little crazy yes. The reason is that the NVMe admin queues and NVMe=
 user=20
> queues are driven by different request queues. Previously this was pa=
tched=20
> up with having two queues in the lightnvm core. One for admin and ano=
ther=20
> for user. But was later merged into a single queue.

Why?  If you look at the current structure we have the admin queue
which is always allocated by the Low level driver, although it could an=
d
should move to the core eventually.  And then we have Command set speci=
fic
request_queues for the I/O queues.  One per NS for NVM currenly, either
one per NS or one globally for LightNVM, and in Fabrics I currently
have another magic one :)  Due to the tagset pointer in struct nvme_ctr=
l
that's really easy to handle.
