From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the tip tree with the vfs tree
Date: Fri, 22 Jun 2018 08:56:07 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1806220855090.1591@nanos.tec.linutronix.de>
References: <20180622115346.1e9cc433@canb.auug.org.au> <e6a26908-67b2-e32e-06b5-d2e62acce305@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e6a26908-67b2-e32e-06b5-d2e62acce305@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

On Thu, 21 Jun 2018, Reinette Chatre wrote:
> I am the contributor of the pseudo-locking related code that caused the
> conflict.
> 
> Stephen, thank you very much for proceeding with the merge and fixing it
> up. I copied your later fix addition to this email and combined they
> look good. I did some basic smoke testing of the merged code and it works.
> 
> Thomas and David, please let me know what I can do from my side to help
> with this.

I'll have a look later today.

> 
> As summary, with the above changes combined the merge can be done using:
> 
> ->8-
> diff --cc arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
> index 7b4a09d81a30,38a54f56ff40..caa2754f8948
> --- a/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
> +++ b/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
> @@@ -1861,16 -1270,9 +1842,13 @@@ static int rdt_get_tree(struct fs_conte
>   		rdtgroup_default.mon.mon_data_kn = kn_mondata;
>   	}
> 
>  +	ret = rdt_pseudo_lock_init();
> - 	if (ret) {
> - 		dentry = ERR_PTR(ret);
> ++	if (ret)
>  +		goto out_mondata;
> - 	}
>  +
> - 	dentry = kernfs_mount(fs_type, flags, rdt_root,
> - 			      RDTGROUP_SUPER_MAGIC, NULL);
> - 	if (IS_ERR(dentry))
> + 	ret = kernfs_get_tree(fc);
> + 	if (ret < 0)
>  -		goto out_mondata;
>  +		goto out_psl;
> 
>   	if (rdt_alloc_capable)
>   		static_branch_enable_cpuslocked(&rdt_alloc_enable_key);
> 
> Reinette
> 
> 
