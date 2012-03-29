From: "J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] nfsd: only register cld pipe notifier when
 CONFIG_NFSD_V4 is enabled
Date: Thu, 29 Mar 2012 07:47:55 -0400
Message-ID: <20120329114755.GC16938@fieldses.org>
References: <1333021311-8774-1-git-send-email-jlayton@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333021311-8774-1-git-send-email-jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Layton <jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Trond.Myklebust-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Thu, Mar 29, 2012 at 07:41:51AM -0400, Jeff Layton wrote:
> Otherwise, we get a warning or error similar to this when building with
> CONFIG_NFSD_V4 disabled:
> 
>     ERROR: "nfsd4_cld_block" [fs/nfsd/nfsd.ko] undefined!
> 
> Fix this by wrapping the calls to rpc_pipefs_notifier_register and
> ..._unregister in another function and providing no-op replacements
> when CONFIG_NFSD_V4 is disabled.

Thanks to you and Paul, applying.--b.

> 
> Reported-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> Signed-off-by: Jeff Layton <jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  fs/nfsd/netns.h       |   10 +++++++++-
>  fs/nfsd/nfs4recover.c |   12 ++++++++++++
>  fs/nfsd/nfsctl.c      |    6 +++---
>  3 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
> index 66eac33..e87ba91 100644
> --- a/fs/nfsd/netns.h
> +++ b/fs/nfsd/netns.h
> @@ -31,5 +31,13 @@ struct nfsd_net {
>  };
>  
>  extern int nfsd_net_id;
> -extern struct notifier_block nfsd4_cld_block;
> +
> +#if IS_ENABLED(CONFIG_NFSD_V4)
> +extern int register_cld_notifier(void);
> +extern void unregister_cld_notifier(void);
> +#else /* IS_ENABLED(CONFIG_NFSD_V4) */
> +#define register_cld_notifier() 0
> +#define unregister_cld_notifier() do { } while(0)
> +#endif /* IS_ENABLED(CONFIG_NFSD_V4) */
> +
>  #endif /* __NFSD_NETNS_H__ */
> diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
> index eaaf948..4767429 100644
> --- a/fs/nfsd/nfs4recover.c
> +++ b/fs/nfsd/nfs4recover.c
> @@ -1032,3 +1032,15 @@ rpc_pipefs_event(struct notifier_block *nb, unsigned long event, void *ptr)
>  struct notifier_block nfsd4_cld_block = {
>  	.notifier_call = rpc_pipefs_event,
>  };
> +
> +int
> +register_cld_notifier(void)
> +{
> +	return rpc_pipefs_notifier_register(&nfsd4_cld_block);
> +}
> +
> +void
> +unregister_cld_notifier(void)
> +{
> +	rpc_pipefs_notifier_unregister(&nfsd4_cld_block);
> +}
> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
> index dee6c1b..2c53be6 100644
> --- a/fs/nfsd/nfsctl.c
> +++ b/fs/nfsd/nfsctl.c
> @@ -1137,7 +1137,7 @@ static int __init init_nfsd(void)
>  	int retval;
>  	printk(KERN_INFO "Installing knfsd (copyright (C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).\n");
>  
> -	retval = rpc_pipefs_notifier_register(&nfsd4_cld_block);
> +	retval = register_cld_notifier();
>  	if (retval)
>  		return retval;
>  	retval = register_pernet_subsys(&nfsd_net_ops);
> @@ -1186,7 +1186,7 @@ out_free_slabs:
>  out_unregister_pernet:
>  	unregister_pernet_subsys(&nfsd_net_ops);
>  out_unregister_notifier:
> -	rpc_pipefs_notifier_unregister(&nfsd4_cld_block);
> +	unregister_cld_notifier();
>  	return retval;
>  }
>  
> @@ -1203,7 +1203,7 @@ static void __exit exit_nfsd(void)
>  	nfsd_fault_inject_cleanup();
>  	unregister_filesystem(&nfsd_fs_type);
>  	unregister_pernet_subsys(&nfsd_net_ops);
> -	rpc_pipefs_notifier_unregister(&nfsd4_cld_block);
> +	unregister_cld_notifier();
>  }
>  
>  MODULE_AUTHOR("Olaf Kirch <okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org>");
> -- 
> 1.7.7.6
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
