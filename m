From: Reinette Chatre <reinette.chatre@intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the vfs tree
Date: Thu, 21 Jun 2018 23:13:32 -0700
Message-ID: <e6a26908-67b2-e32e-06b5-d2e62acce305@intel.com>
References: <20180622115346.1e9cc433@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180622115346.1e9cc433@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

All,

On 6/21/2018 6:53 PM, Stephen Rothwell wrote:
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
> 
> between commit:
> 
>   58e4e43911f8 ("kernfs, sysfs, cgroup, intel_rdt: Support fs_context")
> 
> from the vfs tree and commit:
> 
>   a3dbd01e6c9d ("x86/intel_rdt: Create character device exposing pseudo-loc=
> ked region")
> 
> from the tip tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> --
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
> index 38a54f56ff40,7b4a09d81a30..000000000000
> --- a/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
> +++ b/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
> @@@ -1270,9 -1861,16 +1842,15 @@@ static int rdt_get_tree(struct fs_conte
>   		rdtgroup_default.mon.mon_data_kn = kn_mondata;
>   	}
>  
> + 	ret = rdt_pseudo_lock_init();
> + 	if (ret) {
> + 		dentry = ERR_PTR(ret);
> + 		goto out_mondata;
> + 	}
> +
>  -	dentry = kernfs_mount(fs_type, flags, rdt_root,
>  -			      RDTGROUP_SUPER_MAGIC, NULL);
>  -	if (IS_ERR(dentry))
>  +	ret = kernfs_get_tree(fc);
>  +	if (ret < 0)
> - 		goto out_mondata;
> + 		goto out_psl;
>  
>   	if (rdt_alloc_capable)
>   		static_branch_enable_cpuslocked(&rdt_alloc_enable_key);


>> + 	ret = rdt_pseudo_lock_init();
>> + 	if (ret) {
>> + 		dentry = ERR_PTR(ret);
>
> Actually I have removed the above line as well.

I am the contributor of the pseudo-locking related code that caused the
conflict.

Stephen, thank you very much for proceeding with the merge and fixing it
up. I copied your later fix addition to this email and combined they
look good. I did some basic smoke testing of the merged code and it works.

Thomas and David, please let me know what I can do from my side to help
with this.

As summary, with the above changes combined the merge can be done using:

->8-
diff --cc arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
index 7b4a09d81a30,38a54f56ff40..caa2754f8948
--- a/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
+++ b/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
@@@ -1861,16 -1270,9 +1842,13 @@@ static int rdt_get_tree(struct fs_conte
  		rdtgroup_default.mon.mon_data_kn = kn_mondata;
  	}

 +	ret = rdt_pseudo_lock_init();
- 	if (ret) {
- 		dentry = ERR_PTR(ret);
++	if (ret)
 +		goto out_mondata;
- 	}
 +
- 	dentry = kernfs_mount(fs_type, flags, rdt_root,
- 			      RDTGROUP_SUPER_MAGIC, NULL);
- 	if (IS_ERR(dentry))
+ 	ret = kernfs_get_tree(fc);
+ 	if (ret < 0)
 -		goto out_mondata;
 +		goto out_psl;

  	if (rdt_alloc_capable)
  		static_branch_enable_cpuslocked(&rdt_alloc_enable_key);

Reinette
