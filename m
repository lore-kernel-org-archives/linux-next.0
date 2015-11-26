From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 26 Nov 2015 01:16:14 +0100
Message-ID: <56564F4E.10509@iogearbox.net>
References: <20151126110105.60ec3ddc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www62.your-server.de ([213.133.104.62]:52752 "EHLO
	www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751355AbbKZAQX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2015 19:16:23 -0500
In-Reply-To: <20151126110105.60ec3ddc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/26/2015 01:01 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>    kernel/bpf/syscall.c
>
> between commit:
>
>    c9da161c6517 ("bpf: fix clearing on persistent program array maps")
>
> from the net tree and commit:
>
>    f99bf205dab0 ("bpf: add show_fdinfo handler for maps")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Seems fine, thanks!
