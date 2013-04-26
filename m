From: Sedat Dilek <sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: Tree for Apr 26 [ bluetooth on suspend/resume ]
Date: Fri, 26 Apr 2013 19:30:46 +0200
Message-ID: <CA+icZUVCmFeh3Xna37VJDDzvZ34sYJ_Dser7i5rRzGLhMTi5-Q@mail.gmail.com>
Reply-To: sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux PM List <linux-pm-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 26, 2013 at 10:03 AM, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wrote:
> Hi all,
>
> Changes since 20130424:
>
> Removed tree: ppc-temp (remerged into powerpc)
>
> The net-next tree gained conflicts against the net and pci trees and a
> build failure for which I applied a merge fix patch.
>
> The omap_dss2 tree gained a build failure so I used the version from
> next-20130424.
>
> The trivial tree gained a conflict against the arm tree.
>
> The staging tree still had its build failure for which I applied a
> supplied patch.
>
> The arm-soc tree gained a conflict against the spi-mb tree.
>
> The renesas tree gained a conflict against the input tree.
>

[ CC linux-bluetooth + linux-pm folks ]

I see the following:

[  176.667799] PM: Syncing filesystems ... done.
[  176.670014] PM: Preparing system for mem sleep
[  176.670422] Freezing user space processes ...
[  196.656719] Freezing of tasks failed after 20.00 seconds (1 tasks
refusing to freeze, wq_busy=0):
[  196.656728] bluetoothd      D ffffffff8180d8c0     0  1012    863 0x00000004
[  196.656731]  ffff88008fdb3cc8 0000000000000046 ffff8800926530d0
0000020000000000
[  196.656735]  ffff88008feca200 ffff88008fdb3fd8 ffff88008fdb3fd8
ffff88008fdb3fd8
[  196.656738]  ffff880119f78300 ffff88008feca200 ffff88008fdb3cf8
ffff880095281950
[  196.656741] Call Trace:
[  196.656749]  [<ffffffff816cfc99>] schedule+0x29/0x70
[  196.656752]  [<ffffffff816cff9e>] schedule_preempt_disabled+0xe/0x10
[  196.656754]  [<ffffffff816ce075>] __mutex_lock_slowpath+0x125/0x2f0
[  196.656757]  [<ffffffff816ce25e>] mutex_lock+0x1e/0x40
[  196.656773]  [<ffffffffa016f8b1>] hci_dev_open+0x51/0x2e0 [bluetooth]
[  196.656780]  [<ffffffffa0182752>] hci_sock_ioctl+0x1f2/0x3f0 [bluetooth]
[  196.656783]  [<ffffffff815c6050>] sock_do_ioctl+0x30/0x70
[  196.656786]  [<ffffffff815c75f9>] sock_ioctl+0x79/0x2f0
[  196.656790]  [<ffffffff811a8046>] do_vfs_ioctl+0x96/0x560
[  196.656794]  [<ffffffff811a85a1>] SyS_ioctl+0x91/0xb0
[  196.656797]  [<ffffffff816d989d>] system_call_fastpath+0x1a/0x1f
[  196.656811]
[  196.656812] Restarting tasks ... done.
