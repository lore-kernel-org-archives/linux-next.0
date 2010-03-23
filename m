From: Christoph Hellwig <hch@infradead.org>
Subject: Re: About ACL for IPC Object
Date: Tue, 23 Mar 2010 07:55:13 -0400
Message-ID: <20100323115513.GA7751@infradead.org>
References: <6fb445941001200112o2934f805l4eb4f78000e9527e@mail.gmail.com> <6fb445941001200120m3aa5e944j54a6f645ce82d76f@mail.gmail.com> <4B57C3C3.9010606@schaufler-ca.com> <6fb445941003230201r656d0363k6ed6853c3edc826b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6fb445941003230201r656d0363k6ed6853c3edc826b@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zhou peng <ailvpeng25@gmail.com>
Cc: Casey Schaufler <casey@schaufler-ca.com>, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Mar 23, 2010 at 05:01:31PM +0800, zhou peng wrote:
> Hi,
> 
> I have added ACL support to POSIX msg queue on linux kernel 2.6.32.
> Casey Schaufler, would you or anyone like review the patch for me please?
> The patch is attached.

There is quite a lot of boilerplate code in the patch.  You might want
to take a look at fs/generic_acl.c and how mm/shmem.c uses it to get
away with a lot less code.
