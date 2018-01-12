From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Thu, 11 Jan 2018 22:11:45 -0500 (EST)
Message-ID: <20180111.221145.643386077098131140.davem@davemloft.net>
References: <20180111115355.29c2f905@canb.auug.org.au>
        <20180111015853.2pmxtqlrsyxelqf6@ast-mbp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:48606 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932298AbeALDL7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Jan 2018 22:11:59 -0500
In-Reply-To: <20180111015853.2pmxtqlrsyxelqf6@ast-mbp>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: alexei.starovoitov@gmail.com
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, daniel@iogearbox.net, ast@kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 10 Jan 2018 17:58:54 -0800

> On Thu, Jan 11, 2018 at 11:53:55AM +1100, Stephen Rothwell wrote:
>> Hi all,
>> 
>> After merging the net-next tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>> 
>> kernel/bpf/verifier.o: In function `bpf_check':
>> verifier.c:(.text+0xd86e): undefined reference to `bpf_patch_call_args'
>> 
>> Caused by commit
>> 
>>   1ea47e01ad6e ("bpf: add support for bpf_call to interpreter")
>> 
>> interacting with commit
>> 
>>   290af86629b2 ("bpf: introduce BPF_JIT_ALWAYS_ON config")
>> 
>> from the bpf and net trees.
>> 
>> I have just reverted commit 290af86629b2 for today.  A better solution
>> would be nice (lie fixing this in a merge between the net-next and net
>> trees).
> 
> that's due to 'endif' from 290af86629b2 needs to be moved above
> bpf_patch_call_args() definition.

That doesn't fix it, because then you'd need to expose
interpreters_args as well and obviously that can't be right.

Instead, we should never call bpf_patch_call_args() when JIT always on
is enabled.  So if we fail to JIT the subprogs we should fail
immediately.

This is the net --> net-next merge resolution I am about to use to fix
this:

...
 +static int fixup_call_args(struct bpf_verifier_env *env)
 +{
 +	struct bpf_prog *prog = env->prog;
 +	struct bpf_insn *insn = prog->insnsi;
- 	int i, depth;
++	int i, depth, err;
 +
- 	if (env->prog->jit_requested)
- 		if (jit_subprogs(env) == 0)
++	err = 0;
++	if (env->prog->jit_requested) {
++		err = jit_subprogs(env);
++		if (err == 0)
 +			return 0;
- 
++	}
++#ifndef CONFIG_BPF_JIT_ALWAYS_ON
 +	for (i = 0; i < prog->len; i++, insn++) {
 +		if (insn->code != (BPF_JMP | BPF_CALL) ||
 +		    insn->src_reg != BPF_PSEUDO_CALL)
 +			continue;
 +		depth = get_callee_stack_depth(env, insn, i);
 +		if (depth < 0)
 +			return depth;
 +		bpf_patch_call_args(insn, depth);
 +	}
- 	return 0;
++	err = 0;
++#endif
++	return err;
 +}
 +
  /* fixup insn->imm field of bpf_call instructions
   * and inline eligible helpers as explicit sequence of BPF instructions
   *
