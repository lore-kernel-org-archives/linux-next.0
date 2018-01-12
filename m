From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Fri, 12 Jan 2018 08:43:25 -0800
Message-ID: <20180112164324.oiifyfdioeohl3lt@ast-mbp.dhcp.thefacebook.com>
References: <20180111115355.29c2f905@canb.auug.org.au>
 <20180111015853.2pmxtqlrsyxelqf6@ast-mbp>
 <20180111.221145.643386077098131140.davem@davemloft.net>
 <20180112042148.jsxb26fodw3fgneb@ast-mbp>
 <db1d75ed-521b-cbad-93e8-5c3a25ab2dfa@iogearbox.net>
 <20180112155609.utnakkerdbtbj7ne@ast-mbp.dhcp.thefacebook.com>
 <94b98645-581b-7824-f116-2467d1987347@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:46897 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934027AbeALQna (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Jan 2018 11:43:30 -0500
Content-Disposition: inline
In-Reply-To: <94b98645-581b-7824-f116-2467d1987347@iogearbox.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: David Miller <davem@davemloft.net>, sfr@canb.auug.org.au, netdev@vger.kernel.org, ast@kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 12, 2018 at 05:21:54PM +0100, Daniel Borkmann wrote:
> On 01/12/2018 04:56 PM, Alexei Starovoitov wrote:
> > On Fri, Jan 12, 2018 at 11:45:42AM +0100, Daniel Borkmann wrote:
> >> On 01/12/2018 05:21 AM, Alexei Starovoitov wrote:
> >>> On Thu, Jan 11, 2018 at 10:11:45PM -0500, David Miller wrote:
> >>>> From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> >>>> Date: Wed, 10 Jan 2018 17:58:54 -0800
> >>>>
> >>>>> On Thu, Jan 11, 2018 at 11:53:55AM +1100, Stephen Rothwell wrote:
> >>>>>> Hi all,
> >>>>>>
> >>>>>> After merging the net-next tree, today's linux-next build (x86_64
> >>>>>> allmodconfig) failed like this:
> >>>>>>
> >>>>>> kernel/bpf/verifier.o: In function `bpf_check':
> >>>>>> verifier.c:(.text+0xd86e): undefined reference to `bpf_patch_call_args'
> >>>>>>
> >>>>>> Caused by commit
> >>>>>>
> >>>>>>   1ea47e01ad6e ("bpf: add support for bpf_call to interpreter")
> >>>>>>
> >>>>>> interacting with commit
> >>>>>>
> >>>>>>   290af86629b2 ("bpf: introduce BPF_JIT_ALWAYS_ON config")
> >>>>>>
> >>>>>> from the bpf and net trees.
> >>>>>>
> >>>>>> I have just reverted commit 290af86629b2 for today.  A better solution
> >>>>>> would be nice (lie fixing this in a merge between the net-next and net
> >>>>>> trees).
> >>>>>
> >>>>> that's due to 'endif' from 290af86629b2 needs to be moved above
> >>>>> bpf_patch_call_args() definition.
> >>>>
> >>>> That doesn't fix it, because then you'd need to expose
> >>>> interpreters_args as well and obviously that can't be right.
> >>>>
> >>>> Instead, we should never call bpf_patch_call_args() when JIT always on
> >>>> is enabled.  So if we fail to JIT the subprogs we should fail
> >>>> immediately.
> >>>
> >>> right, as I was trying to say one extra hunk would be needed for net-next.
> >>> I was reading this patch:
> >>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> >>> index a2b211262c25..ca80559c4ec3 100644
> >>> --- a/kernel/bpf/verifier.c
> >>> +++ b/kernel/bpf/verifier.c
> >>> @@ -5267,7 +5267,11 @@ static int fixup_call_args(struct bpf_verifier_env *env)
> >>>                 depth = get_callee_stack_depth(env, insn, i);
> >>>                 if (depth < 0)
> >>>                         return depth;
> >>> +#ifdef CONFIG_BPF_JIT_ALWAYS_ON
> >>> +               return -ENOTSUPP;
> >>> +#else
> >>>                 bpf_patch_call_args(insn, depth);
> >>> +#endif
> >>>         }
> >>>         return 0;
> >>>
> >>> but below should be fine too.
> >>> Will test it asap.
> >>>
> >>>> This is the net --> net-next merge resolution I am about to use to fix
> >>>> this:
> >>>>
> >>>> ...
> >>>>  +static int fixup_call_args(struct bpf_verifier_env *env)
> >>>>  +{
> >>>>  +	struct bpf_prog *prog = env->prog;
> >>>>  +	struct bpf_insn *insn = prog->insnsi;
> >>>> - 	int i, depth;
> >>>> ++	int i, depth, err;
> >>>>  +
> >>>> - 	if (env->prog->jit_requested)
> >>>> - 		if (jit_subprogs(env) == 0)
> >>>> ++	err = 0;
> >>
> >> Looks fine to me. The only thing I was wondering was whether we should
> >> set err = -ENOTSUPP here above, but actually that is unnecessary. Say,
> >> if for some reason we would missed to set prog->jit_requested bit under
> >> CONFIG_BPF_JIT_ALWAYS_ON, we would return 0 here even if we would have
> >> calls in the prog. But that also means for bpf_prog_load() that right
> >> after bpf_check() returned, we would go into bpf_prog_select_runtime()
> >> since prog->bpf_func is still NULL at that point, and bpf_int_jit_compile()
> >> from there wouldn't do anything either since prog->jit_requested was
> >> not set in the first place, therefore we return with -ENOTSUPP from
> >> there. So the resolution looks fine to me, we can leave it as is.
> > 
> > jit_subprogs() can fail, so err = -ENOTSUPP is necessary.
> 
> But if jit_subprogs() fails, then the err is propagated at the end of
> the function (the 'return err' I mean).

right.
Also, since we do:
fp->jit_requested = ebpf_jit_enabled();
and
static inline bool ebpf_jit_enabled(void)
{
   return bpf_jit_enable && bpf_jit_is_ebpf();
}
and JIT_ALWAYS_ON depends on CONFIG_HAVE_EBPF_JIT
we should be good.
