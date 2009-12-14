From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the md-current tree with Linus' tree
Date: Mon, 14 Dec 2009 11:27:26 +0100
Message-ID: <200912141127.27019.arnd@arndb.de>
References: <20091214102428.f50557a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757114AbZLNMJc@vger.kernel.org>
In-Reply-To: <20091214102428.f50557a0.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Neil Brown <neilb@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Monday 14 December 2009, Stephen Rothwell wrote:
> index 278020d,ad485ba..0000000
> --- a/fs/compat_ioctl.c
> +++ b/fs/compat_ioctl.c
> @@@ -979,29 -1912,22 +979,11 @@@ COMPATIBLE_IOCTL(FIGETBSZ
>   /* 'X' - originally XFS but some now in the VFS */
>   COMPATIBLE_IOCTL(FIFREEZE)
>   COMPATIBLE_IOCTL(FITHAW)
> - /* RAID */
> - COMPATIBLE_IOCTL(RAID_VERSION)
> - COMPATIBLE_IOCTL(GET_ARRAY_INFO)
> - COMPATIBLE_IOCTL(GET_DISK_INFO)
> - COMPATIBLE_IOCTL(PRINT_RAID_DEBUG)
> - COMPATIBLE_IOCTL(RAID_AUTORUN)
> - COMPATIBLE_IOCTL(CLEAR_ARRAY)
> - COMPATIBLE_IOCTL(ADD_NEW_DISK)
> - COMPATIBLE_IOCTL(SET_ARRAY_INFO)
> - COMPATIBLE_IOCTL(SET_DISK_INFO)
> - COMPATIBLE_IOCTL(WRITE_RAID_INFO)
> - COMPATIBLE_IOCTL(UNPROTECT_ARRAY)
> - COMPATIBLE_IOCTL(PROTECT_ARRAY)
> - COMPATIBLE_IOCTL(RUN_ARRAY)
> - COMPATIBLE_IOCTL(STOP_ARRAY)
> - COMPATIBLE_IOCTL(STOP_ARRAY_RO)
> - COMPATIBLE_IOCTL(RESTART_ARRAY_RW)
> - COMPATIBLE_IOCTL(GET_BITMAP_FILE)
>  -/* Big K */
>  -COMPATIBLE_IOCTL(PIO_FONT)
>  -COMPATIBLE_IOCTL(GIO_FONT)
>  -COMPATIBLE_IOCTL(PIO_CMAP)
>  -COMPATIBLE_IOCTL(GIO_CMAP)
>  -ULONG_IOCTL(KDSIGACCEPT)
>   COMPATIBLE_IOCTL(KDGETKEYCODE)
>   COMPATIBLE_IOCTL(KDSETKEYCODE)
>  -ULONG_IOCTL(KIOCSOUND)
>  -ULONG_IOCTL(KDMKTONE)
>   COMPATIBLE_IOCTL(KDGKBTYPE)
>  -ULONG_IOCTL(KDSETMODE)
>   COMPATIBLE_IOCTL(KDGETMODE)
>  -ULONG_IOCTL(KDSKBMODE)
>   COMPATIBLE_IOCTL(KDGKBMODE)
>  -ULONG_IOCTL(KDSKBMETA)
>   COMPATIBLE_IOCTL(KDGKBMETA)
>   COMPATIBLE_IOCTL(KDGKBENT)
>   COMPATIBLE_IOCTL(KDSKBENT)

This merge is incomplete, because the patch that I made for Neil
removes the handling for HOT_REMOVE_DISK, HOT_ADD_DISK,
SET_DISK_FAULTY and SET_BITMAP_FILE from fs/compat_ioctl.c
along with the others above, while my other patch that Linus
merged moves them into the switch statement in do_ioctl_trans.

Neil, still have  a tree where I track patches to fs/compat_ioctl.c
that have not yet been merged. If you just keep the half in your
own files and drop the ones in fs/compat_ioctl.c, I'll submit that
next time. You can also adapt the patch again to the new contents
and remove the four above to save me that work.

I didn't want to remove them from fs/compat_ioctl.c before they
got added to md.c, in order to keep bisection correct.

	Arnd
