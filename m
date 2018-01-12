From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Fri, 12 Jan 2018 11:45:42 +0100
Message-ID: <db1d75ed-521b-cbad-93e8-5c3a25ab2dfa@iogearbox.net>
References: <20180111115355.29c2f905@canb.auug.org.au>
 <20180111015853.2pmxtqlrsyxelqf6@ast-mbp>
 <20180111.221145.643386077098131140.davem@davemloft.net>
 <20180112042148.jsxb26fodw3fgneb@ast-mbp>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180112042148.jsxb26fodw3fgneb@ast-mbp>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, ast@kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 01/12/2018 05:21 AM, Alexei Starovoitov wrote:
> On Thu, Jan 11, 2018 at 10:11:45PM -0500, David Miller wrote:
>> From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
>> Date: Wed, 10 Jan 2018 17:58:54 -0800
>>
>>> On Thu, Jan 11, 2018 at 11:53:55AM +1100, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> After merging the net-next tree, today's linux-next build (x86_64
>>>> allmodconfig) failed like this:
>>>>
>>>> kernel/bpf/verifier.o: In function `bpf_check':
>>>> verifier.c:(.text+0xd86e): undefined reference to `bpf_patch_call_args'
>>>>
>>>> Caused by commit
>>>>
>>>>   1ea47e01ad6e ("bpf: add support for bpf_call to interpreter")
>>>>
>>>> interacting with commit
>>>>
>>>>   290af86629b2 ("bpf: introduce BPF_JIT_ALWAYS_ON config")
>>>>
>>>> from the bpf and net trees.
>>>>
>>>> I have just reverted commit 290af86629b2 for today.  A better solution
>>>> would be nice (lie fixing this in a merge between the net-next and net
>>>> trees).
>>>
>>> that's due to 'endif' from 290af86629b2 needs to be moved above
>>> bpf_patch_call_args() definition.
>>
>> That doesn't fix it, because then you'd need to expose
>> interpreters_args as well and obviously that can't be right.
>>
>> Instead, we should never call bpf_patch_call_args() when JIT always on
>> is enabled.  So if we fail to JIT the subprogs we should fail
>> immediately.
> 
> right, as I was trying to say one extra hunk would be needed for net-next.
> I was reading this patch:
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index a2b211262c25..ca80559c4ec3 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -5267,7 +5267,11 @@ static int fixup_call_args(struct bpf_verifier_env *env)
>                 depth = get_callee_stack_depth(env, insn, i);
>                 if (depth < 0)
>                         return depth;
> +#ifdef CONFIG_BPF_JIT_ALWAYS_ON
> +               return -ENOTSUPP;
> +#else
>                 bpf_patch_call_args(insn, depth);
> +#endif
>         }
>         return 0;
> 
> but below should be fine too.
> Will test it asap.
> 
>> This is the net --> net-next merge resolution I am about to use to fix
>> this:
>>
>> ...
>>  +static int fixup_call_args(struct bpf_verifier_env *env)
>>  +{
>>  +	struct bpf_prog *prog = env->prog;
>>  +	struct bpf_insn *insn = prog->insnsi;
>> - 	int i, depth;
>> ++	int i, depth, err;
>>  +
>> - 	if (env->prog->jit_requested)
>> - 		if (jit_subprogs(env) == 0)
>> ++	err = 0;

Looks fine to me. The only thing I was wondering was whether we should
set err = -ENOTSUPP here above, but actually that is unnecessary. Say,
if for some reason we would missed to set prog->jit_requested bit under
CONFIG_BPF_JIT_ALWAYS_ON, we would return 0 here even if we would have
calls in the prog. But that also means for bpf_prog_load() that right
after bpf_check() returned, we would go into bpf_prog_select_runtime()
since prog->bpf_func is still NULL at that point, and bpf_int_jit_compile()
from there wouldn't do anything either since prog->jit_requested was
not set in the first place, therefore we return with -ENOTSUPP from
there. So the resolution looks fine to me, we can leave it as is.

>> ++	if (env->prog->jit_requested) {
>> ++		err = jit_subprogs(env);
>> ++		if (err == 0)
>>  +			return 0;
>> - 
>> ++	}
>> ++#ifndef CONFIG_BPF_JIT_ALWAYS_ON
>>  +	for (i = 0; i < prog->len; i++, insn++) {
>>  +		if (insn->code != (BPF_JMP | BPF_CALL) ||
>>  +		    insn->src_reg != BPF_PSEUDO_CALL)
>>  +			continue;
>>  +		depth = get_callee_stack_depth(env, insn, i);
>>  +		if (depth < 0)
>>  +			return depth;
>>  +		bpf_patch_call_args(insn, depth);
>>  +	}
>> - 	return 0;
>> ++	err = 0;
>> ++#endif
>> ++	return err;
>>  +}
>>  +
>>   /* fixup insn->imm field of bpf_call instructions
>>    * and inline eligible helpers as explicit sequence of BPF instructions
>>    *
