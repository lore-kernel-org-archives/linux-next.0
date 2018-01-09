From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the bpf tree
Date: Tue, 9 Jan 2018 11:21:25 +1100
Message-ID: <20180109112125.78277253@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45685 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753850AbeAIAV2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Jan 2018 19:21:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  tools/testing/selftests/bpf/test_align.c

between commit:

  2b36047e7889 ("selftests/bpf: fix test_align")

from the bpf tree and commit:

  6a28b446b7d2 ("selftests/bpf: adjust test_align expected output")

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

diff --cc tools/testing/selftests/bpf/test_align.c
index 471bbbdb94db,fe916d29e166..000000000000
--- a/tools/testing/selftests/bpf/test_align.c
+++ b/tools/testing/selftests/bpf/test_align.c
@@@ -473,8 -473,28 +473,8 @@@ static struct bpf_align_test tests[] = 
  		.prog_type = BPF_PROG_TYPE_SCHED_CLS,
  		.result = REJECT,
  		.matches = {
- 			{4, "R5=pkt(id=0,off=0,r=0,imm=0)"},
+ 			{4, "R5_w=pkt(id=0,off=0,r=0,imm=0)"},
 -			/* ptr & 0x40 == either 0 or 0x40 */
 -			{5, "R5_w=inv(id=0,umax_value=64,var_off=(0x0; 0x40))"},
 -			/* ptr << 2 == unknown, (4n) */
 -			{7, "R5_w=inv(id=0,smax_value=9223372036854775804,umax_value=18446744073709551612,var_off=(0x0; 0xfffffffffffffffc))"},
 -			/* (4n) + 14 == (4n+2).  We blow our bounds, because
 -			 * the add could overflow.
 -			 */
 -			{8, "R5=inv(id=0,var_off=(0x2; 0xfffffffffffffffc))"},
 -			/* Checked s>=0 */
 -			{10, "R5=inv(id=0,umin_value=2,umax_value=9223372036854775806,var_off=(0x2; 0x7ffffffffffffffc))"},
 -			/* packet pointer + nonnegative (4n+2) */
 -			{12, "R6_w=pkt(id=1,off=0,r=0,umin_value=2,umax_value=9223372036854775806,var_off=(0x2; 0x7ffffffffffffffc))"},
 -			{14, "R4=pkt(id=1,off=4,r=0,umin_value=2,umax_value=9223372036854775806,var_off=(0x2; 0x7ffffffffffffffc))"},
 -			/* NET_IP_ALIGN + (4n+2) == (4n), alignment is fine.
 -			 * We checked the bounds, but it might have been able
 -			 * to overflow if the packet pointer started in the
 -			 * upper half of the address space.
 -			 * So we did not get a 'range' on R6, and the access
 -			 * attempt will fail.
 -			 */
 -			{16, "R6=pkt(id=1,off=0,r=0,umin_value=2,umax_value=9223372036854775806,var_off=(0x2; 0x7ffffffffffffffc))"},
 +			/* R5 bitwise operator &= on pointer prohibited */
  		}
  	},
  	{
