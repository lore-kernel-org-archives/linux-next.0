From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [BISECT] NFSv4 root boot failures on next (Merge remote-tracking
 branch 'vfs/for-next)
Date: Tue, 30 Oct 2018 09:49:18 +0100
Message-ID: <CAJKOXPe2r22KURddxHDas_NVPdEETnzLEAtbQY3h=tjpF=KinQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@zeniv.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, "J. Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

Since yesterdays next, all my boards booting from NFS root (NFSv4)
experience infinite warnings:

[ 210.199561] ------------[ cut here ]------------
[ 210.204169] WARNING: CPU: 1 PID: 191 at ../lib/iov_iter.c:1082
iov_iter_kvec+0x54/0x5c
[ 210.212048] Modules linked in:
[ 210.215094] CPU: 1 PID: 191 Comm: kworker/u9:1 Tainted: G W
4.19.0-next-20181029 #2
[ 210.224031] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[ 210.230097] Workqueue: xprtiod xs_stream_data_receive_workfn
[ 210.235745] [<c01122c8>] (unwind_backtrace) from [<c010e034>]
(show_stack+0x10/0x14)
[ 210.243475] [<c010e034>] (show_stack) from [<c0a5d3c0>] (dump_stack+0x98/0xc4)
[ 210.250675] [<c0a5d3c0>] (dump_stack) from [<c0126d90>] (__warn+0x10c/0x124)
[ 210.257701] [<c0126d90>] (__warn) from [<c0126ec0>]
(warn_slowpath_null+0x40/0x48)
[ 210.265256] [<c0126ec0>] (warn_slowpath_null) from [<c0481380>]
(iov_iter_kvec+0x54/0x5c)
[ 210.273422] [<c0481380>] (iov_iter_kvec) from [<c0934dd0>]
(xs_stream_data_receive+0x374/0xa20)
[ 210.282105] [<c0934dd0>] (xs_stream_data_receive) from [<c0146b3c>]
(process_one_work+0x230/0x794)
[ 210.291044] [<c0146b3c>] (process_one_work) from [<c01470d0>]
(worker_thread+0x30/0x508)
[ 210.299113] [<c01470d0>] (worker_thread) from [<c014d9e4>]
(kthread+0x138/0x168)
[ 210.306490] [<c014d9e4>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
[ 210.313689] Exception stack(0xedad5fb0 to 0xedad5ff8)
[ 210.318709] 5fa0: 00000000 00000000 00000000 00000000
[ 210.326886] 5fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 210.335047] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[ 210.341737] irq event stamp: 259629
[ 210.345130] hardirqs last enabled at (259647): [<c0192c4c>]
console_unlock+0x47c/0x658
[ 210.353102] hardirqs last disabled at (259654): [<c0192894>]
console_unlock+0xc4/0x658
[ 210.361034] softirqs last enabled at (259670): [<c0102618>]
__do_softirq+0x4f0/0x5e4
[ 210.368887] softirqs last disabled at (259681): [<c012ef90>]
irq_exit+0x160/0x16c
[ 210.376303] ---[ end trace fc7bc7f30b280153 ]---

Full console log:
https://krzk.eu/#/builders/25/builds/891/steps/12/logs/serial0

Bisect pointed to:
first bad commit: [3ed975a4b424d84cb50cc76e17fe0b5ab4f16b14] Merge
remote-tracking branch 'vfs/for-next'

Some more details:
1. Arch ARM Linux
2. exynos_defconfig
  - All my Odroid boards (ARMv7, Exynos)
3. Custom VF50 defconfig
  - Toradex Colibri VF50 on Iris board
    ARMv7, UP, Cortext-A5, NXP VF500, 128 MB RAM, 128 MB NAND
    Systemd: v232
4. All boards boot from TFTP with NFS root (NFSv4)

Let me know if you need any more information or help in debugging.

Best regards,
Krzysztof
