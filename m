From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 15 Aug 2016 09:51:59 +0200
Message-ID: <57B1749F.8040100@iogearbox.net>
References: <20160815103503.2ff7aa58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www62.your-server.de ([213.133.104.62]:51665 "EHLO
	www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751386AbcHOHwH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Aug 2016 03:52:07 -0400
In-Reply-To: <20160815103503.2ff7aa58@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sargun Dhillon <sargun@sargun.me>

On 08/15/2016 02:35 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>    kernel/bpf/verifier.c
>
> between commit:
>
>    747ea55e4f78 ("bpf: fix bpf_skb_in_cgroup helper naming")
>
> from the net tree and commit:
>
>    60d20f9195b2 ("bpf: Add bpf_current_task_under_cgroup helper")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Looks good to me, thanks!
