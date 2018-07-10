From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: build warnings after merge of the rdma tree
Date: Mon, 9 Jul 2018 22:11:43 -0600
Message-ID: <20180710041143.GD17400@mellanox.com>
References: <20180710113342.605e53e8@canb.auug.org.au>
 <20180710034157.GA17400@mellanox.com>
 <20180710140512.53d67d40@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180710140512.53d67d40@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 10, 2018 at 02:05:12PM +1000, Stephen Rothwell wrote:
> Hi Jason,
> 
> On Mon, 9 Jul 2018 21:41:57 -0600 Jason Gunthorpe <jgg@mellanox.com> wrote:
> > 
> > What compiler is producing these? I got nothing from 0-day build
> > service or my local gcc-7..
> 
> The x86 compiler is a v7.3.1 cross compiler hosted on PowerPC LE and
> built from sources.

Curiouser and curiouser.. Mine is

gcc version 7.3.0 (Ubuntu 7.3.0-21ubuntu1~16.04) 

> > They are false positives and I guess we need to put the
> > uninitialized_var back that was hiding them.
> 
> Rats.  :-(

Indeed.. I dislike that macro.

Jason
