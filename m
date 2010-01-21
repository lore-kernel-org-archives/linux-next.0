From: Christoph Hellwig <hch@infradead.org>
Subject: Re: About ACL for IPC Object
Date: Thu, 21 Jan 2010 04:05:10 -0500
Message-ID: <20100121090510.GA908@infradead.org>
References: <6fb445941001200112o2934f805l4eb4f78000e9527e@mail.gmail.com> <6fb445941001200120m3aa5e944j54a6f645ce82d76f@mail.gmail.com> <4B57C3C3.9010606@schaufler-ca.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B57C3C3.9010606@schaufler-ca.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: zhou peng <ailvpeng25@gmail.com>, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Jan 20, 2010 at 07:02:27PM -0800, Casey Schaufler wrote:
> zhou peng wrote:
> > Hi all,
> >
> > There are ACL in file system, but why there are no ACL implementation
> > in IPC object, eg. shm, message queue, FIFO?
> >   
> 
> Most people haven't noticed that IPC objects are even there, much less
> that they have mode bits and not ACLs. Even when we were doing security
> evaluations on Unix boxes in the 1990's they were considered insufficiently
> interesting to justify the additional work to do ACLs.
> 
> If you really want ACLs on IPC objects it would make a dandy little
> project for a summer. I would be happy to review patches.

Or use the posix IPC mechanisms.  The Posix shared memory has ACL by
using tmpfs as the backing store, and we could add similar support to
Posix messages queues as they are also backed by a normal filesystem.

Adding this support to the old SYSV IPC mechanisms would be much harder
as they do not fit into the file backed model we use everywhere else at
all.

