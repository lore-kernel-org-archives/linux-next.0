From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: manual merge of the net-next tree with the bpf tree
Date: Mon, 8 Jan 2018 16:29:16 -0800
Message-ID: <20180109002914.447kcn4xqrkdtqql@ast-mbp>
References: <20180109112125.78277253@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:37757 "EHLO
        mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754002AbeAIA3T (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Jan 2018 19:29:19 -0500
Content-Disposition: inline
In-Reply-To: <20180109112125.78277253@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jan 09, 2018 at 11:21:25AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   tools/testing/selftests/bpf/test_align.c
> 
> between commit:
> 
>   2b36047e7889 ("selftests/bpf: fix test_align")
> 
> from the bpf tree and commit:
> 
>   6a28b446b7d2 ("selftests/bpf: adjust test_align expected output")
> 
> from the net-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc tools/testing/selftests/bpf/test_align.c
> index 471bbbdb94db,fe916d29e166..000000000000
> --- a/tools/testing/selftests/bpf/test_align.c
> +++ b/tools/testing/selftests/bpf/test_align.c
> @@@ -473,8 -473,28 +473,8 @@@ static struct bpf_align_test tests[] = 
>   		.prog_type = BPF_PROG_TYPE_SCHED_CLS,
>   		.result = REJECT,
>   		.matches = {
> - 			{4, "R5=pkt(id=0,off=0,r=0,imm=0)"},
> + 			{4, "R5_w=pkt(id=0,off=0,r=0,imm=0)"},

thanks. That's correct resolution.
