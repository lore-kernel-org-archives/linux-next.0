From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with the tip tree
Date: Mon, 14 Dec 2009 15:30:33 +1100
Message-ID: <20091214153033.6224eefa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756183AbZLNEam@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the percpu tree got a conflict in
arch/x86/kernel/cpu/intel_cacheinfo.c between commit
ebb682f522411abbe358059a256a8672ec0bd55b ("x86, AMD: Fix stale
cpuid4_info shared_map data in shared_cpu_map cpumasks") from the tip
tree and commit 0fe1e009541e925adc1748a605d8b66188e4b2ab ("percpu: make
percpu symbols in x86 unique") from the percpu tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kernel/cpu/intel_cacheinfo.c
index 63ada17,55d2ef3..0000000
--- a/arch/x86/kernel/cpu/intel_cacheinfo.c
+++ b/arch/x86/kernel/cpu/intel_cacheinfo.c
@@@ -511,15 -508,14 +511,15 @@@ static void __cpuinit cache_shared_cpu_
  	struct cpuinfo_x86 *c = &cpu_data(cpu);
  
  	if ((index == 3) && (c->x86_vendor == X86_VENDOR_AMD)) {
 -		struct cpuinfo_x86 *d;
 -		for_each_online_cpu(i) {
 +		for_each_cpu(i, c->llc_shared_map) {
- 			if (!per_cpu(cpuid4_info, i))
+ 			if (!per_cpu(ici_cpuid4_info, i))
  				continue;
 -			d = &cpu_data(i);
  			this_leaf = CPUID4_INFO_IDX(i, index);
 -			cpumask_copy(to_cpumask(this_leaf->shared_cpu_map),
 -				     d->llc_shared_map);
 +			for_each_cpu(sibling, c->llc_shared_map) {
 +				if (!cpu_online(sibling))
 +					continue;
 +				set_bit(sibling, this_leaf->shared_cpu_map);
 +			}
  		}
  		return;
  	}
