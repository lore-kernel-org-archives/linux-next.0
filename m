From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Tue, 18 Dec 2018 04:10:02 +0000
Message-ID: <20181218041001.GU2217@ZenIV.linux.org.uk>
References: <20181218144858.58d8d1f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181218144858.58d8d1f8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Moore <paul@paul-moore.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 18, 2018 at 02:48:58PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the selinux tree got a conflict in:
> 
>   security/selinux/hooks.c
> 
> between commit:
> 
>   2b8073b14c19 ("LSM: split ->sb_set_mnt_opts() out of ->sb_kern_mount()")
> 
> from the vfs tree and commit:
> 
>   2cbdcb882f97 ("selinux: always allow mounting submounts")
> 
> from the selinux tree.
> 
> I fixed it up (I used the vfs tree version, plus added the following
> patch but I am not sure if it is correct as the latter patch only affected
> selinux) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.
 
> -	if (!(fc->sb_flags & MS_KERNMOUNT)) {
> +	if (!(fc->sb_flags & (MS_KERNMOUNT | MS_SUBMOUNT))) {

It is correct, but the long-term fix is to lift the conditional part out
of vfs_get_tree() into the callers (as discussed a couple of weeks ago).
I have it in a local branch, need to ripple it into the current main series...
