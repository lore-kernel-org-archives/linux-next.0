From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 16
Date: Thu, 17 Jan 2019 13:35:24 -0800
Message-ID: <20190117213524.GA26237@roeck-us.net>
References: <20190116173838.042db659@canb.auug.org.au>
 <20190116203547.GA788@roeck-us.net>
 <20190117084902.GA20220@ming.t460p>
 <20190117103553.GB23565@ming.t460p>
 <20190117183254.GA17361@roeck-us.net>
 <10619062-9531-e843-1620-7518e27583f8@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10619062-9531-e843-1620-7518e27583f8@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

On Thu, Jan 17, 2019 at 11:34:01AM -0700, Jens Axboe wrote:
> On 1/17/19 11:32 AM, Guenter Roeck wrote:
> > On Thu, Jan 17, 2019 at 06:35:55PM +0800, Ming Lei wrote:
> >>>
> >>> Hi Guenter,
> >>>
> >>> Could you share me the .config?
> >>
> > Any 32 bit configuration from affected architectures should work.
> > 
> >> From your dmesg log, looks the test is run on i386, so please
> >> feel free to try the following patch:
> >>
> >> https://marc.info/?l=linux-kernel&m=154772088110800&w=2
> >>
> > Is this still relevant ? Today's image is fine.
> 
> The patches were pulled, I think Ming would still appreciate it if
> you could test the previous tree with that patch on top.
> 

next-20190116 with Ming's patch added and "sh: generate uapi header and
syscall table header files" reverted:

Qemu test results:
	total: 343 pass: 343 fail: 0

Note though that my tests do not run any block device stress tests.

Guenter
