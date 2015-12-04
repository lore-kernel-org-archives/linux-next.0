From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Fri, 4 Dec 2015 13:16:21 +0100
Message-ID: <56618415.3010405@bjorling.me>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org>
 <20151202164527.GA31048@lst.de> <565F5D96.5050902@kernel.dk>
 <565FFFA5.6000003@bjorling.me> <20151203090638.GA14329@lst.de>
 <566010EE.6050806@bjorling.me> <20151203095726.GA15428@lst.de>
 <566014BF.3080702@bjorling.me> <20151203102132.GA15905@lst.de>
 <5660226B.5070800@bjorling.me> <20151203164259.GA14678@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35833 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752990AbbLDMQY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Dec 2015 07:16:24 -0500
Received: by wmuu63 with SMTP id u63so59571819wmu.0
        for <linux-next@vger.kernel.org>; Fri, 04 Dec 2015 04:16:23 -0800 (PST)
In-Reply-To: <20151203164259.GA14678@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, Keith Busch <keith.busch@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org



On 12/03/2015 05:42 PM, Christoph Hellwig wrote:
> On Thu, Dec 03, 2015 at 12:07:23PM +0100, Matias Bj=F8rling wrote:
>> What is the reason to keep the nvme_ns internally to the nvme core?
>>
>> We can definitely move ->nsid and the lba_shift into nvm_dev. Only t=
hing I
>> have is that it moves a small part of nvme logic into the lightnvm c=
ore.
>
> It's a structure specific to the NVM command set, and the block devic=
e
> use to implement it in Linux.  Similar to how you wouldn't use the SC=
SI
> disk driver data structures to implement the tape driver for example.
>

Granted. Taking a step back and see how it would look in the=20
specification. For that case, the identify geometry should properly=20
replace the identify namespace command and extend the controller=20
identify with a method to expose identify geometry structures. It falls=
=20
back to that we don't have the appropriate bits in the specification (a=
s=20
there isn't a vendor specific command set (CSS) place at the moment).=20
I'll rather not (and patches properly won't be accepted) push specific=20
meanings to reserved bits in the standard, which then is overruled by=20
vendor specific pci id's.

The NVMe and LightNVM still shares some common ground as I/O=20
submission/completion still follows normal I/O submissions. The=20
Submission/Completion sizes (SQES/CQES), ONCS bits, number of namespace=
s=20
could properly be either abstracted or duplicated in vendor specific bi=
ts.

I'll work on getting ->nsid, and lba_shift abstracted away. However, th=
e=20
best solution will be to get some bits in the spec and implement it=20
appropriately.
