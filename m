From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: linux-next: Signed-off-by missing for commits in the vfs tree
Date: Thu, 20 Dec 2018 21:05:44 +0000
Message-ID: <20181220210543.GX2217@ZenIV.linux.org.uk>
References: <20181221074522.0b0c986c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181221074522.0b0c986c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

On Fri, Dec 21, 2018 at 07:45:22AM +1100, Stephen Rothwell wrote:
> Hi Al,
> 
> Commits
> 
>   e6cf4b0ddae8 ("teach vfs_get_tree() to handle subtype, switch do_new_mount() to it")
>   a5df92eef26f ("new helper: vfs_create_mount()")
>   84b9446c0cb2 ("mount_fs: suppress MAC on MS_SUBMOUNT as well as MS_KERNMOUNT")
>   6df9e604628d ("smack: rewrite smack_sb_eat_lsm_opts()")
>   a4fdf6490284 ("smack: get rid of match_token()")
>   b2130173efae ("smack: take the guts of smack_parse_opts_str() into a new helper")
>   324240b27f48 ("LSM: new method: ->sb_add_mnt_opt()")
>   8a2bfb0f835a ("selinux: rewrite selinux_sb_eat_lsm_opts()")
>   3cec2907c913 ("selinux: regularize Opt_... names a bit")
>   b0ab2db616c0 ("selinux: switch away from match_token()")
>   cbe9d96f42ba ("selinux: new helper - selinux_add_opt()")
>   2790a639b456 ("LSM: bury struct security_mnt_opts")
>   205b9b7a392a ("smack: switch to private smack_mnt_opts")
>   179a64d445e2 ("selinux: switch to private struct selinux_mnt_opts")
>   cb662518822e ("LSM: hide struct security_mnt_opts from any generic code")
>   6c63bb2d5323 ("selinux: kill selinux_sb_get_mnt_opts()")
>   e03db7f5411c ("LSM: turn sb_eat_lsm_opts() into a method")
>   dc0dadb3c3d7 ("nfs_remount(): don't leak, don't ignore LSM options quietly")
>   363540f775fb ("btrfs: sanitize security_mnt_opts use")
>   8f08fcb05ba6 ("selinux; don't open-code a loop in sb_finish_set_opts()")
>   144da0858c5e ("LSM: split ->sb_set_mnt_opts() out of ->sb_kern_mount()")
>   be917e5b8736 ("new helper: security_sb_eat_lsm_opts()")
>   580a8bcb268b ("LSM: lift extracting and parsing LSM options into the caller of ->sb_remount()")
>   cf891373b60a ("LSM: lift parsing LSM options into the caller of ->sb_kern_mount()")
>   d02fc3452738 ("smack: make smack_parse_opts_str() clean up on failure")
>   17f3b556a3e3 ("selinux: expand superblock_doinit() calls")
> 
> are missing a Signed-off-by from their committers.

What the...  Oh, I see - that's David adding his reviewed-by and somehow
losing my S-o-b in process...  *grumble*

Will be fixed in tomorrow push.
