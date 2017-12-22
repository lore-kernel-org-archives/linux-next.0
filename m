From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Fri, 22 Dec 2017 11:11:12 +1100
Message-ID: <20171222111112.2615460a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33187 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752863AbdLVALO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Dec 2017 19:11:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jann Horn <jannh@google.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  kernel/bpf/verifier.c

between commit:

  0c17d1d2c619 ("bpf: fix incorrect tracking of register size truncation")

from the net tree and commits:

  f4d7e40a5b71 ("bpf: introduce function calls (verification)")
  1ea47e01ad6e ("bpf: add support for bpf_call to interpreter")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc kernel/bpf/verifier.c
index 04b24876cd23,48b2901cf483..000000000000
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@@ -1072,29 -1425,54 +1430,77 @@@ static int check_ptr_alignment(struct b
  					   strict);
  }
  
 +/* truncate register to smaller size (in bytes)
 + * must be called with size < BPF_REG_SIZE
 + */
 +static void coerce_reg_to_size(struct bpf_reg_state *reg, int size)
 +{
 +	u64 mask;
 +
 +	/* clear high bits in bit representation */
 +	reg->var_off = tnum_cast(reg->var_off, size);
 +
 +	/* fix arithmetic bounds */
 +	mask = ((u64)1 << (size * 8)) - 1;
 +	if ((reg->umin_value & ~mask) == (reg->umax_value & ~mask)) {
 +		reg->umin_value &= mask;
 +		reg->umax_value &= mask;
 +	} else {
 +		reg->umin_value = 0;
 +		reg->umax_value = mask;
 +	}
 +	reg->smin_value = reg->umin_value;
 +	reg->smax_value = reg->umax_value;
 +}
 +
+ static int update_stack_depth(struct bpf_verifier_env *env,
+ 			      const struct bpf_func_state *func,
+ 			      int off)
+ {
+ 	u16 stack = env->subprog_stack_depth[func->subprogno], total = 0;
+ 	struct bpf_verifier_state *cur = env->cur_state;
+ 	int i;
+ 
+ 	if (stack >= -off)
+ 		return 0;
+ 
+ 	/* update known max for given subprogram */
+ 	env->subprog_stack_depth[func->subprogno] = -off;
+ 
+ 	/* compute the total for current call chain */
+ 	for (i = 0; i <= cur->curframe; i++) {
+ 		u32 depth = env->subprog_stack_depth[cur->frame[i]->subprogno];
+ 
+ 		/* round up to 32-bytes, since this is granularity
+ 		 * of interpreter stack sizes
+ 		 */
+ 		depth = round_up(depth, 32);
+ 		total += depth;
+ 	}
+ 
+ 	if (total > MAX_BPF_STACK) {
+ 		verbose(env, "combined stack size of %d calls is %d. Too large\n",
+ 			cur->curframe, total);
+ 		return -EACCES;
+ 	}
+ 	return 0;
+ }
+ 
+ static int get_callee_stack_depth(struct bpf_verifier_env *env,
+ 				  const struct bpf_insn *insn, int idx)
+ {
+ 	int start = idx + insn->imm + 1, subprog;
+ 
+ 	subprog = find_subprog(env, start);
+ 	if (subprog < 0) {
+ 		WARN_ONCE(1, "verifier bug. No program starts at insn %d\n",
+ 			  start);
+ 		return -EFAULT;
+ 	}
+ 	subprog++;
+ 	return env->subprog_stack_depth[subprog];
+ }
+ 
  /* check whether memory at (regno + off) is accessible for t = (read | write)
   * if t==write, value_regno is a register which value is stored into memory
   * if t==read, value_regno is a register which will receive the value from memory
@@@ -1302,15 -1678,14 +1704,15 @@@ static int check_stack_boundary(struct 
  	}
  
  	/* Only allow fixed-offset stack reads */
- 	if (!tnum_is_const(regs[regno].var_off)) {
+ 	if (!tnum_is_const(reg->var_off)) {
  		char tn_buf[48];
  
- 		tnum_strn(tn_buf, sizeof(tn_buf), regs[regno].var_off);
+ 		tnum_strn(tn_buf, sizeof(tn_buf), reg->var_off);
  		verbose(env, "invalid variable stack read R%d var_off=%s\n",
  			regno, tn_buf);
 +		return -EACCES;
  	}
- 	off = regs[regno].off + regs[regno].var_off.value;
+ 	off = reg->off + reg->var_off.value;
  	if (off >= 0 || off < -MAX_BPF_STACK || off + access_size > 0 ||
  	    access_size < 0 || (access_size == 0 && !zero_size_allowed)) {
  		verbose(env, "invalid stack type R%d off=%d access_size=%d\n",
@@@ -2294,9 -2758,12 +2828,11 @@@ static int adjust_scalar_min_max_vals(s
  static int adjust_reg_min_max_vals(struct bpf_verifier_env *env,
  				   struct bpf_insn *insn)
  {
- 	struct bpf_reg_state *regs = cur_regs(env), *dst_reg, *src_reg;
+ 	struct bpf_verifier_state *vstate = env->cur_state;
+ 	struct bpf_func_state *state = vstate->frame[vstate->curframe];
+ 	struct bpf_reg_state *regs = state->regs, *dst_reg, *src_reg;
  	struct bpf_reg_state *ptr_reg = NULL, off_reg = {0};
  	u8 opcode = BPF_OP(insn->code);
 -	int rc;
  
  	dst_reg = &regs[insn->dst_reg];
  	src_reg = NULL;
