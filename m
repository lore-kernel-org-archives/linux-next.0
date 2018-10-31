From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [RFC] sunrpc: Fix flood of warnings from iov_iter_kvec in linux-next
Date: Wed, 31 Oct 2018 12:49:52 +0000
Message-ID: <8a65d1322e08b9590d18a53cd623f71b0fe559e8.1540989230.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Trond Myklebust <trond.myklebust@hammerspace.com>, David Howells <dhowells@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Since commit aa563d7bca6e ("iov_iter: Separate type from direction and
use accessor functions") the iov_iter_kvec and iov_iter_bvec functions
warn if the direction parameter contains anything other than READ/WRITE.

That commit also updated users of iov_iter_kvec/bvec but a new call was
added on a different branch by commit 277e4ab7d530 ("SUNRPC: Simplify
TCP receive code by switching to using iterators")

This causes a flood of warnings in linux-next like this:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 110 at ../lib/iov_iter.c:1082 iov_iter_kvec+0x4c/0x5c
Modules linked in:
CPU: 0 PID: 110 Comm: kworker/u3:2 Tainted: G        W         4.19.0-next-=
20181031 #157
Hardware name: Freescale i.MX6 SoloLite (Device Tree)
Workqueue: xprtiod xs_stream_data_receive_workfn
[<c0112908>] (unwind_backtrace) from [<c010d238>] (show_stack+0x10/0x14)
[<c010d238>] (show_stack) from [<c0b3894c>] (dump_stack+0xb0/0xe8)
[<c0b3894c>] (dump_stack) from [<c0126e14>] (__warn+0xe0/0x10c)
[<c0126e14>] (__warn) from [<c0126f54>] (warn_slowpath_null+0x3c/0x48)
[<c0126f54>] (warn_slowpath_null) from [<c04b225c>] (iov_iter_kvec+0x4c/0x5=
c)
[<c04b225c>] (iov_iter_kvec) from [<c0a2c650>] (xs_stream_data_receive_work=
fn+0x538/0x8e0)
[<c0a2c650>] (xs_stream_data_receive_workfn) from [<c014609c>] (process_one=
_work+0x2ac/0x6fc)
[<c014609c>] (process_one_work) from [<c014678c>] (worker_thread+0x2a0/0x57=
4)
[<c014678c>] (worker_thread) from [<c014c43c>] (kthread+0x134/0x14c)
[<c014c43c>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
Exception stack(0xec9fbfb0 to 0xec9fbff8)
bfa0:                                     00000000 00000000 00000000 000000=
00
bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
irq event stamp: 91225
hardirqs last  enabled at (91233): [<c0186630>] console_unlock+0x3e4/0x5d0
hardirqs last disabled at (91250): [<c01862c8>] console_unlock+0x7c/0x5d0
softirqs last  enabled at (91266): [<c0102500>] __do_softirq+0x360/0x524
softirqs last disabled at (91277): [<c012e66c>] irq_exit+0xf8/0x1a4
---[ end trace bc12311e869d672a ]---

This fix updates sunrpc code and make nfs boot cleanly.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 net/sunrpc/xprtsock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

You can treat this as a bug report; I did a brief search and didn't see
anyone else complain about this specific issue. Big ugly stacktrace was
included so that it hopefully shows up in searches.

Here is a mention of a different conflict between iov_iter and sunrpc:
	https://lkml.org/lkml/2018/10/29/64

diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 1b51e04d3566..ae77c71c1f64 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -359,20 +359,20 @@ xs_sock_recvmsg(struct socket *sock, struct msghdr *m=
sg, int flags, size_t seek)
=20
 static ssize_t
 xs_read_kvec(struct socket *sock, struct msghdr *msg, int flags,
 		struct kvec *kvec, size_t count, size_t seek)
 {
-	iov_iter_kvec(&msg->msg_iter, READ | ITER_KVEC, kvec, 1, count);
+	iov_iter_kvec(&msg->msg_iter, READ, kvec, 1, count);
 	return xs_sock_recvmsg(sock, msg, flags, seek);
 }
=20
 static ssize_t
 xs_read_bvec(struct socket *sock, struct msghdr *msg, int flags,
 		struct bio_vec *bvec, unsigned long nr, size_t count,
 		size_t seek)
 {
-	iov_iter_bvec(&msg->msg_iter, READ | ITER_BVEC, bvec, nr, count);
+	iov_iter_bvec(&msg->msg_iter, READ, bvec, nr, count);
 	return xs_sock_recvmsg(sock, msg, flags, seek);
 }
=20
 static ssize_t
 xs_read_discard(struct socket *sock, struct msghdr *msg, int flags,
--=20
2.17.1
