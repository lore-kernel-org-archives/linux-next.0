From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 3 Dec 2015 17:42:59 +0100
Message-ID: <20151203164259.GA14678@lst.de>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org> <20151202164527.GA31048@lst.de> <565F5D96.5050902@kernel.dk> <565FFFA5.6000003@bjorling.me> <20151203090638.GA14329@lst.de> <566010EE.6050806@bjorling.me> <20151203095726.GA15428@lst.de> <566014BF.3080702@bjorling.me> <20151203102132.GA15905@lst.de> <5660226B.5070800@bjorling.me>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:35625 "EHLO newverein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750966AbbLCQnD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Dec 2015 11:43:03 -0500
Content-Disposition: inline
In-Reply-To: <5660226B.5070800@bjorling.me>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matias =?iso-8859-1?Q?Bj=F8rling?= <m@bjorling.me>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, Keith Busch <keith.busch@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org

On Thu, Dec 03, 2015 at 12:07:23PM +0100, Matias Bj=F8rling wrote:
> What is the reason to keep the nvme_ns internally to the nvme core?
>
> We can definitely move ->nsid and the lba_shift into nvm_dev. Only th=
ing I=20
> have is that it moves a small part of nvme logic into the lightnvm co=
re.

It's a structure specific to the NVM command set, and the block device
use to implement it in Linux.  Similar to how you wouldn't use the SCSI
disk driver data structures to implement the tape driver for example.
