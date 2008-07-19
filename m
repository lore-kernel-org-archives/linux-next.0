From: "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>
Subject: Re: linux-next: Tree for July 17: early crash on x86-64
Date: Sat, 19 Jul 2008 20:42:05 +0200
Message-ID: <200807192042.06988.rjw@sisk.pl>
References: <20080718012842.690b8346.sfr@canb.auug.org.au> <a4423d670807180652y352e66lfe04d2b33d2ed176@mail.gmail.com> <20080719035231.GU28946@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080719035231.GU28946-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Content-Disposition: inline
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Smalley <sds-+05T5uksL2qpZYMLLGbcSA@public.gmane.org>, James Morris <jmorris-gx6/JNMH7DfYtjvyW6yDsg@public.gmane.org>, Eric Paris <eparis-FjpueFixGhCM4zKIHC2jIg@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Saturday, 19 of July 2008, Al Viro wrote:
> On Fri, Jul 18, 2008 at 05:52:23PM +0400, Alexander Beregalov wrote:
> > 2008/7/18 Rafael J. Wysocki <rjw-KKrjLPT3xs0@public.gmane.org>:
> > > This one crashes all of my x86-64 test boxes early during boot.
> > The same problem with next-20080718.
> > Unfortunatelly I do not have serial console on that host.
> 
> vfs-next/net-next conflict; apply the patch below on top of the merge.

That helped, thanks.

But next it ran into the BUG_ON() in line 883 of security/selinux/avc.c .
Disabling selinux made the kernel boot, finally.


> diff --git a/net/sysctl_net.c b/net/sysctl_net.c
> index b91a5de..2240a9e 100644
> --- a/net/sysctl_net.c
> +++ b/net/sysctl_net.c
> @@ -44,13 +44,6 @@ static struct ctl_table_root net_sysctl_root = {
>  	.lookup = net_ctl_header_lookup,
>  };
>  
> -static LIST_HEAD(net_sysctl_ro_tables);
> -static struct list_head *net_ctl_ro_header_lookup(struct ctl_table_root *root,
> -		struct nsproxy *namespaces)
> -{
> -	return &net_sysctl_ro_tables;
> -}
> -
>  static int net_ctl_ro_header_perms(struct ctl_table_root *root,
>  		struct nsproxy *namespaces, struct ctl_table *table)
>  {
> @@ -61,7 +54,6 @@ static int net_ctl_ro_header_perms(struct ctl_table_root *root,
>  }
>  
>  static struct ctl_table_root net_sysctl_ro_root = {
> -	.lookup = net_ctl_ro_header_lookup,
>  	.permissions = net_ctl_ro_header_perms,
>  };
>  
> @@ -89,6 +81,7 @@ static __init int sysctl_init(void)
>  	if (ret)
>  		goto out;
>  	register_sysctl_root(&net_sysctl_root);
> +	setup_sysctl_set(&net_sysctl_ro_root.default_set, NULL, NULL);
>  	register_sysctl_root(&net_sysctl_ro_root);
>  out:
>  	return ret;
> 
> 
