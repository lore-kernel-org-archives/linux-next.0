From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Tue, 10 Jul 2018 08:22:47 -0600
Message-ID: <3f0359a5-6733-f9d3-a616-d27ce430c904@kernel.dk>
References: <20180620132911.5f6ab464@canb.auug.org.au>
 <20180710173114.17ee69ad@canb.auug.org.au>
 <280ebbdf-fafb-1744-f517-815a30e682bb@kernel.dk>
 <1531232063.4963.8.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531232063.4963.8.camel@HansenPartnership.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

On 7/10/18 8:14 AM, James Bottomley wrote:
> On Tue, 2018-07-10 at 08:09 -0600, Jens Axboe wrote:
>> On 7/10/18 1:31 AM, Stephen Rothwell wrote:
> [...]
>>> I am still seeing these warnings ...
>>
>> Martin queued up the forward declaration patch for this one, not sure
>> why it isn't showing up in the scsi tree yet.
> 
> All the trees are fully up to date ... which commit is it?

It's a patch from Arnd, I don't know what commit id it is. But
Martin replied a few days ago that it was applied. I don't have
the email handy, though.

-- 
Jens Axboe
