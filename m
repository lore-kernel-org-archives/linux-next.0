From: David Howells <dhowells@redhat.com>
Subject: Re: [RFC] sunrpc: Fix flood of warnings from iov_iter_kvec in linux-next
Date: Wed, 31 Oct 2018 14:31:43 +0000
Message-ID: <23290.1540996303@warthog.procyon.org.uk>
References: <8a65d1322e08b9590d18a53cd623f71b0fe559e8.1540989230.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8a65d1322e08b9590d18a53cd623f71b0fe559e8.1540989230.git.leonard.crestez@nxp.com>
Content-ID: <23289.1540996303.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: dhowells@redhat.com, Trond Myklebust <trond.myklebust@hammerspace.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "J. Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Leonard Crestez <leonard.crestez@nxp.com> wrote:

> Since commit aa563d7bca6e ("iov_iter: Separate type from direction and
> use accessor functions") the iov_iter_kvec and iov_iter_bvec functions
> warn if the direction parameter contains anything other than READ/WRITE.
> 
> That commit also updated users of iov_iter_kvec/bvec but a new call was
> added on a different branch by commit 277e4ab7d530 ("SUNRPC: Simplify
> TCP receive code by switching to using iterators")
> 
> This causes a flood of warnings in linux-next like this:
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 110 at ../lib/iov_iter.c:1082 iov_iter_kvec+0x4c/0x5c
> Modules linked in:
> CPU: 0 PID: 110 Comm: kworker/u3:2 Tainted: G        W         4.19.0-next-20181031 #157
> Hardware name: Freescale i.MX6 SoloLite (Device Tree)
> Workqueue: xprtiod xs_stream_data_receive_workfn
> [<c0112908>] (unwind_backtrace) from [<c010d238>] (show_stack+0x10/0x14)
> [<c010d238>] (show_stack) from [<c0b3894c>] (dump_stack+0xb0/0xe8)
> [<c0b3894c>] (dump_stack) from [<c0126e14>] (__warn+0xe0/0x10c)
> [<c0126e14>] (__warn) from [<c0126f54>] (warn_slowpath_null+0x3c/0x48)
> [<c0126f54>] (warn_slowpath_null) from [<c04b225c>] (iov_iter_kvec+0x4c/0x5c)
> [<c04b225c>] (iov_iter_kvec) from [<c0a2c650>] (xs_stream_data_receive_workfn+0x538/0x8e0)
> [<c0a2c650>] (xs_stream_data_receive_workfn) from [<c014609c>] (process_one_work+0x2ac/0x6fc)
> [<c014609c>] (process_one_work) from [<c014678c>] (worker_thread+0x2a0/0x574)
> [<c014678c>] (worker_thread) from [<c014c43c>] (kthread+0x134/0x14c)
> [<c014c43c>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> Exception stack(0xec9fbfb0 to 0xec9fbff8)
> bfa0:                                     00000000 00000000 00000000 00000000
> bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> irq event stamp: 91225
> hardirqs last  enabled at (91233): [<c0186630>] console_unlock+0x3e4/0x5d0
> hardirqs last disabled at (91250): [<c01862c8>] console_unlock+0x7c/0x5d0
> softirqs last  enabled at (91266): [<c0102500>] __do_softirq+0x360/0x524
> softirqs last disabled at (91277): [<c012e66c>] irq_exit+0xf8/0x1a4
> ---[ end trace bc12311e869d672a ]---
> 
> This fix updates sunrpc code and make nfs boot cleanly.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Reviewed-by: David Howells <dhowells@redhat.com>
