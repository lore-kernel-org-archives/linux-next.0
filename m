From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: linux-next: manual merge of the edac-amd tree with the rr tree
Date: Thu, 6 Aug 2009 10:07:19 +0200
Message-ID: <20090806080719.GB13566@liondog.tnic>
References: <20090806175152.1e0b96cf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752704AbZHFIH1@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090806175152.1e0b96cf.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Borislav Petkov <borislav.petkov@amd.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Li Zefan <lizf@cn.fujitsu.com>, Rusty Russell <rusty@rustcorp.com.au>, Andreas Herrmann <andreas.herrmann3@amd.com>
List-Id: linux-next.vger.kernel.org

Hi,

On Thu, Aug 06, 2009 at 05:51:52PM +1000, Stephen Rothwell wrote:
> Hi Borislav,
> 
> Today's linux-next merge of the edac-amd tree got a conflict in
> arch/x86/kernel/smpboot.c between commit
> d39044d21e1a2d3713f1329ad22d23df5d20140b ("cpumask: use zalloc_cpumask_var
> () where possible") from the rr tree and commit
> a763af6587fbead6cee75ad3ae14709fa67e7dbb ("x86: provide CPU topology
> information for multi-node processors") from the edac-amd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

I guess this is the best solution for now. Andreas' latest patches went
out yesterday and they too contain the

alloc_cpumask_var
cpumask_clear

order. Which means, this fix will have to be applied then between the
tip and the rr trees after Ingo merges Andreas' stuff, so please hold on
to it until after the merge window.

Thanks.

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/x86/kernel/smpboot.c
> index 70bd79b,5428337..0000000
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@@ -1057,9 -1068,14 +1068,10 @@@ void __init native_smp_prepare_cpus(uns
>   #endif
>   	current_thread_info()->cpu = 0;  /* needed? */
>   	for_each_possible_cpu(i) {
>  -		alloc_cpumask_var(&per_cpu(cpu_sibling_map, i), GFP_KERNEL);
>  -		alloc_cpumask_var(&per_cpu(cpu_core_map, i), GFP_KERNEL);
>  -		alloc_cpumask_var(&per_cpu(cpu_node_map, i), GFP_KERNEL);
>  -		alloc_cpumask_var(&cpu_data(i).llc_shared_map, GFP_KERNEL);
>  -		cpumask_clear(per_cpu(cpu_core_map, i));
>  -		cpumask_clear(per_cpu(cpu_node_map, i));
>  -		cpumask_clear(per_cpu(cpu_sibling_map, i));
>  -		cpumask_clear(cpu_data(i).llc_shared_map);
>  +		zalloc_cpumask_var(&per_cpu(cpu_sibling_map, i), GFP_KERNEL);
>  +		zalloc_cpumask_var(&per_cpu(cpu_core_map, i), GFP_KERNEL);
> ++		zalloc_cpumask_var(&per_cpu(cpu_node_map, i), GFP_KERNEL);
>  +		zalloc_cpumask_var(&cpu_data(i).llc_shared_map, GFP_KERNEL);
>   	}
>   	set_cpu_sibling_map(0);
>   
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
Regards/Gruss,
    Boris.
