From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [patch] cgroup fs: avoid switching ->d_op on live dentry
Date: Tue, 21 Dec 2010 18:56:29 +0100
Message-ID: <AANLkTimxJ_3y3QoJM3aQHP7xEH4NHmq9tYoTGt1kNMBH@mail.gmail.com>
References: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
	<AANLkTi=52p7CwsChj5BL+smnXzPtYzf1qE5A7h7o0V6X@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:52931 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752171Ab0LUR4a convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Dec 2010 12:56:30 -0500
In-Reply-To: <AANLkTi=52p7CwsChj5BL+smnXzPtYzf1qE5A7h7o0V6X@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@kernel.dk>
Cc: systemd-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, eparis@redhat.com

On Tue, Dec 21, 2010 at 4:28 PM, Sedat Dilek <sedat.dilek@googlemail.co=
m> wrote:
> What about using d_set_d_op() ?
>
> - Sedat -
>
> $ diff -Naur orig/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
> cgroup-fs-avoid-switching-d_op-on-live-dentry-v3.patch
> --- orig/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
> 2010-12-21 09:31:38.649601964 +0100
> +++ cgroup-fs-avoid-switching-d_op-on-live-dentry-v3.patch
> 2010-12-21 16:23:29.147497577 +0100
> @@ -21,6 +21,9 @@
> =C2=A0---
> =C2=A0One of the patches in my vfs scaling series tripped over this, =
comments?
>
> +v2: Refreshed to fit linux-next (next-20101220)
> +v3: Use d_set_d_op()
> +
> =C2=A0kernel/cgroup.c | =C2=A0 27 ++++++++++++++++++++++-----
> =C2=A01 file changed, 22 insertions(+), 5 deletions(-)
>
> @@ -68,7 +71,7 @@
>
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0if (dentry->d_name.len > NAME_MAX)
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PT=
R(-ENAMETOOLONG);
> -+ =C2=A0 =C2=A0 =C2=A0dentry->d_op =3D &cgroup_dentry_operations;
> ++ =C2=A0 =C2=A0 =C2=A0d_set_d_op(dentry, &cgroup_dentry_operations);
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0d_add(dentry, NULL);
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0return NULL;
> =C2=A0+}
> @@ -83,7 +86,7 @@
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inode->i_size =
=3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inode->i_fop =3D=
 &cgroup_file_operations;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -- =C2=A0 =C2=A0 =C2=A0dentry->d_op =3D &cgroup_dops;
> +- =C2=A0 =C2=A0 =C2=A0d_set_d_op(dentry, &cgroup_dops);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0d_instantiate(dentry, inode);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dget(dentry); =C2=A0 /* Extra count - pin =
the dentry in core */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>

v3 compiled and running (failed systemd services needs some
investigations, but that is another story).

BTW, I have enabled some cgroup debug options:

# grep -i cgroup /boot/config-$(uname -r)
CONFIG_CGROUPS=3Dy
CONFIG_CGROUP_DEBUG=3Dy
CONFIG_CGROUP_NS=3Dy
CONFIG_CGROUP_FREEZER=3Dy
CONFIG_CGROUP_DEVICE=3Dy
CONFIG_CGROUP_CPUACCT=3Dy
CONFIG_CGROUP_SCHED=3Dy
CONFIG_BLK_CGROUP=3Dy
CONFIG_DEBUG_BLK_CGROUP=3Dy
CONFIG_NET_CLS_CGROUP=3Dy

- Sedat -

P.S.:

# cat /proc/version
Linux version 2.6.37-rc6-686 (Debian
2.6.37~rc6-8~next20101221.dileks.2) (sedat.dilek@gmail.com) (gcc
version 4.5.2 (Debian 4.5.2-1) ) #1 SMP Tue Dec 21 18:25:45 CET 2010

# dmesg | egrep -i 'systemd|cgroup'
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Kernel command line:
BOOT_IMAGE=3D/boot/vmlinuz-2.6.37-rc6-686
root=3DUUID=3D1ceb69a7-ecf4-47e9-a231-b74e0f0a9b62 ro init=3D/bin/syste=
md
radeon.modeset=3D1 lapic 3
[    0.004574] Initializing cgroup subsys debug
[    0.004615] Initializing cgroup subsys ns
[    0.004651] ns_cgroup deprecated: consider using the
'clone_children' flag without the ns_cgroup.
[    0.004700] Initializing cgroup subsys cpuacct
[    0.004739] Initializing cgroup subsys devices
[    0.004775] Initializing cgroup subsys freezer
[    0.004810] Initializing cgroup subsys net_cls
[    0.004846] Initializing cgroup subsys blkio
[    4.111878] systemd[1]: systemd 15 running in system mode. (+PAM
-LIBWRAP -AUDIT +SELINUX +SYSVINIT -LIBCRYPTSETUP; debian)
[    4.241710] systemd[1]: Set hostname to <tbox>.
[    7.096444] systemd-logger[284]: Got error on stream: No such proces=
s
[    9.123292] systemd-fsck[499]: /dev/sda3: sauber, 128016/640848
Dateien, 1788184/2560359 Bl=C3=B6cke
[   15.411402] systemd[1]: ifupdown-clean.service: control process
exited, code=3Dexited status=3D209
[   15.420338] systemd[1]: Unit ifupdown-clean.service entered failed s=
tate.
[   15.420808] systemd[1]: mountoverflowtmp.service: control process
exited, code=3Dexited status=3D209
[   15.437782] systemd[1]: Unit mountoverflowtmp.service entered failed=
 state.
[   15.451162] systemd[1]: resolvconf.service: control process exited,
code=3Dexited status=3D209
[   15.470512] systemd[1]: Unit resolvconf.service entered failed state=
=2E
[   15.480271] systemd[1]: policykit.service: control process exited,
code=3Dexited status=3D209
[   15.500513] systemd[1]: Unit policykit.service entered failed state.
