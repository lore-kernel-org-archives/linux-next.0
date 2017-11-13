From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the net-next tree
Date: Mon, 13 Nov 2017 17:00:15 +1100
Message-ID: <20171113170015.23e0e259@canb.auug.org.au>
References: <20171030205547.pvd23ahq7xgahlke@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41077 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751308AbdKMGAR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 01:00:17 -0500
In-Reply-To: <20171030205547.pvd23ahq7xgahlke@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

On Mon, 30 Oct 2017 20:55:47 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   net/ipv4/tcp_output.c
> 
> between commit:
> 
>   6aa7de059173a ("locking/atomics: COCCINELLE/treewide: Convert trivial ACCESS_ONCE() patterns to READ_ONCE()/WRITE_ONCE()")
> 
> in the tip tree and some change in the net-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc net/ipv4/tcp_output.c
> index a69a34f57330,48531da1aba6..000000000000
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@@ -1978,7 -1908,7 +1978,7 @@@ static bool tcp_tso_should_defer(struc
>   	if ((skb != tcp_write_queue_tail(sk)) && (limit >= skb->len))
>   		goto send_now;
>   
> - 	win_divisor = ACCESS_ONCE(sock_net(sk)->ipv4.sysctl_tcp_tso_win_divisor);
>  -	win_divisor = READ_ONCE(sysctl_tcp_tso_win_divisor);
> ++	win_divisor = READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_tso_win_divisor);
>   	if (win_divisor) {
>   		u32 chunk = min(tp->snd_wnd, tp->snd_cwnd * tp->mss_cache);
>   

Just a reminder that this conflict still exists.

-- 
Cheers,
Stephen Rothwell
