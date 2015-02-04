From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Wed, 4 Feb 2015 17:06:45 +0100
Message-ID: <CA+icZUXrSSeFakX4w5nARo3eh35-p2JwKE5kw4KuuFQkv7dMOg@mail.gmail.com>
References: <20150204193535.58f132c5@canb.auug.org.au>
	<CA+icZUXkMv+RYoHLN-BQSrYti8FUjqWih2XsARY4hDAP=2v1Yw@mail.gmail.com>
	<54D237D9.4070209@kernel.dk>
	<CA+icZUXh3jdiF1SbJx4aRzYf2fjq_CErQ5drdQRK36ath0A-SA@mail.gmail.com>
	<54D23B58.9000703@kernel.dk>
	<CA+icZUWeO03=kYT1MZ3p8ZZaUTv-MxzSjL3gjuq1-q-Qm5WYpA@mail.gmail.com>
	<yq1zj8tactc.fsf@sermon.lab.mkp.net>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yq1zj8tactc.fsf@sermon.lab.mkp.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 4, 2015 at 4:58 PM, Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>>>>>> "Sedat" == Sedat Dilek <sedat.dilek@gmail.com> writes:
>
>>>>>> I am seeing the following in my logs several times...
>>>>>>
>>>>>> Feb 4 02:53:13 fambox kernel: [15507.397482] blk_update_request:
>>>>>> I/O error, dev loop0, sector 21261344 Feb 4 02:53:13 fambox
>>>>>> kernel: [15507.397531] loop0: DISCARD failed.  Manually zeroing.
>
> Sedat> What's the plan... s/pr_warn/pr_debug ?
>
> The rationale here is that we'd like to log (once) if discard or write
> same fail on a given device.
>
> In SCSI we disable these commands if they get failed by the storage. But
> it looks like loop keeps advertising discard support after a failure.
>
> Is your loop device encrypted? Do you know why the discard is failing?
>

No, but I am here on a so-called WUBI installation which triggered
some bugs being an exotic installation.
My Ubuntu/precise is a 18GiB image laying on my Win7 partition (/dev/sda2).

How can I check or debug the discard failing?

- Sedat -

P.S.: Some diagnostics

$ LC_ALL=C df -T
Filesystem     Type     1K-blocks      Used Available Use% Mounted on
rootfs         rootfs    17753424  15663216   1165332  94% /
udev           devtmpfs   1959324         4   1959320   1% /dev
tmpfs          tmpfs       393888       904    392984   1% /run
/dev/sda2      fuseblk  465546236 161295260 304250976  35% /host
/dev/loop0     ext4      17753424  15663216   1165332  94% /
none           tmpfs         5120         4      5116   1% /run/lock
none           tmpfs      1969428       176   1969252   1% /run/shm

$ cat /etc/fstab
# /etc/fstab: static file system information.

# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).

# <file system>                 <mount point>   <type>  <options>
         <dump>  <pass>
proc                            /proc           proc
nodev,noexec,nosuid     0       0
/host/ubuntu/disks/root.disk    /               ext4
loop,errors=remount-ro  0       1
/host/ubuntu/disks/swap.disk    none            swap    loop,sw
         0       0

$ LC_ALL=C sudo fdisk -l /dev/sda
[sudo] password for wearefam:

Disk /dev/sda: 500.1 GB, 500107862016 bytes
255 heads, 63 sectors/track, 60801 cylinders, total 976773168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disk identifier: 0xcb9885ab

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048      206847      102400    7  HPFS/NTFS/exFAT
/dev/sda2          206848   931299327   465546240    7  HPFS/NTFS/exFAT
/dev/sda3       931299328   976773119    22736896   27  Hidden NTFS WinRE

$ cat /proc/cmdline
BOOT_IMAGE=/boot/vmlinuz-3.13.0-45-generic root=UUID=001AADA61AAD9964
loop=/ubuntu/disks/root.disk ro
