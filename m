From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rdma-fixes
 tree
Date: Thu, 08 Mar 2018 09:52:10 -0800
Message-ID: <1520531530.11634.18.camel@perches.com>
References: <20180308164058.2ad5a158@canb.auug.org.au>
         <20180308161845.GC6773@mellanox.com> <1520527178.11634.9.camel@perches.com>
         <20180308170317.GE6773@mellanox.com>
         <1520529792.11634.12.camel@perches.com>
         <20180308174444.GG6773@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308174444.GG6773@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Whitcroft <apw@canonical.com>, Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Thu, 2018-03-08 at 10:44 -0700, Jason Gunthorpe wrote:
> I only ask becuase I keep seeing these reports from Stephen and
> usuaully by the time it gets to him it requires a disruptive rebase to
> fix..

If it's a part of a series, it will always require a rebase.

Generally, I think it's a small and relatively unlikely
problem for checkpatch to bother with as there's already
a reporting mechanism in-place.
