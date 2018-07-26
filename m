From: "Steve Wise" <swise@opengridcomputing.com>
Subject: RE: linux-next: build failure after merge of the block tree
Date: Thu, 26 Jul 2018 12:59:35 -0500
Message-ID: <00b801d4250a$69e2a9f0$3da7fdd0$@opengridcomputing.com>
References: <20180726145624.13a604ed@canb.auug.org.au> <20180726084833.GA23310@lst.de> <a65a6023-a527-b9c6-0d78-a175d47f55cf@kernel.dk> <20180726175643.GA10765@lst.de>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726175643.GA10765@lst.de>
Content-Language: en-us
Sender: linux-kernel-owner@vger.kernel.org
To: 'Christoph Hellwig' <hch@lst.de>, 'Jens Axboe' <axboe@kernel.dk>
Cc: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Doug Ledford' <dledford@redhat.com>, 'Jason Gunthorpe' <jgg@mellanox.com>, 'Linux-Next Mailing List' <linux-next@vger.kernel.org>, 'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: Christoph Hellwig <hch@lst.de>
> Sent: Thursday, July 26, 2018 12:57 PM
> To: Jens Axboe <axboe@kernel.dk>
> Cc: Christoph Hellwig <hch@lst.de>; Stephen Rothwell
> <sfr@canb.auug.org.au>; Doug Ledford <dledford@redhat.com>; Jason
> Gunthorpe <jgg@mellanox.com>; Linux-Next Mailing List <linux-
> next@vger.kernel.org>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; Steve Wise <swise@opengridcomputing.com>
> Subject: Re: linux-next: build failure after merge of the block tree
> 
> On Thu, Jul 26, 2018 at 10:48:21AM -0700, Jens Axboe wrote:
> > >>  	inline_page_count = num_pages(port->inline_data_size);
> > >>  	inline_sge_count = max(cm_id->device->attrs.max_sge_rd,
> > >> -				cm_id->device->attrs.max_sge) - 1;
> > >> +				cm_id->device->attrs.max_send_sge) -
1;
> > >
> > > This should be max_recv_sge.
> >
> > Why do we even have this conflicts to begin with?
> 
> Because the nvme code added a new user of max_sges while the RDMA tree
> split it into two separate fields.  We discussed this a while ago when
> the issue came up.

See: https://www.spinics.net/lists/linux-rdma/msg66208.html 

Steve.
