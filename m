From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 3 Dec 2015 12:07:23 +0100
Message-ID: <5660226B.5070800@bjorling.me>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org>
 <20151202164527.GA31048@lst.de> <565F5D96.5050902@kernel.dk>
 <565FFFA5.6000003@bjorling.me> <20151203090638.GA14329@lst.de>
 <566010EE.6050806@bjorling.me> <20151203095726.GA15428@lst.de>
 <566014BF.3080702@bjorling.me> <20151203102132.GA15905@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151203102132.GA15905@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, Keith Busch <keith.busch@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 12/03/2015 11:21 AM, Christoph Hellwig wrote:
> On Thu, Dec 03, 2015 at 11:09:03AM +0100, Matias Bj=F8rling wrote:
>> Similar to this?
>
> For the interface yes.  Now just get rid of using nvme_ns entirely -
> seems like you just want ns_id and lba_shift, and those should fit
> well into nvm_dev I think.
>

What is the reason to keep the nvme_ns internally to the nvme core?

We can definitely move ->nsid and the lba_shift into nvm_dev. Only thin=
g=20
I have is that it moves a small part of nvme logic into the lightnvm co=
re.
