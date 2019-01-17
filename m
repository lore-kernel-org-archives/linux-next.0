From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: Tree for Jan 16
Date: Thu, 17 Jan 2019 11:34:01 -0700
Message-ID: <10619062-9531-e843-1620-7518e27583f8@kernel.dk>
References: <20190116173838.042db659@canb.auug.org.au>
 <20190116203547.GA788@roeck-us.net> <20190117084902.GA20220@ming.t460p>
 <20190117103553.GB23565@ming.t460p> <20190117183254.GA17361@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117183254.GA17361@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Ming Lei <ming.lei@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

On 1/17/19 11:32 AM, Guenter Roeck wrote:
> On Thu, Jan 17, 2019 at 06:35:55PM +0800, Ming Lei wrote:
>>>
>>> Hi Guenter,
>>>
>>> Could you share me the .config?
>>
> Any 32 bit configuration from affected architectures should work.
> 
>> From your dmesg log, looks the test is run on i386, so please
>> feel free to try the following patch:
>>
>> https://marc.info/?l=linux-kernel&m=154772088110800&w=2
>>
> Is this still relevant ? Today's image is fine.

The patches were pulled, I think Ming would still appreciate it if
you could test the previous tree with that patch on top.

-- 
Jens Axboe
