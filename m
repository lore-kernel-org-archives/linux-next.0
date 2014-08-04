From: Alexei Starovoitov <ast@plumgrid.com>
Subject: Re: linux-next: manual merge of the security tree with the net-next tree
Date: Sun, 3 Aug 2014 23:30:35 -0700
Message-ID: <CAMEtUuxgmUB=MLMjLBpjmb7nQ6nPE2spkmgFVoXDu5Fq6cFYyw@mail.gmail.com>
References: <20140804162633.2d2e8604@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:46628 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751053AbaHDGah (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Aug 2014 02:30:37 -0400
Received: by mail-wi0-f177.google.com with SMTP id ho1so4359464wib.10
        for <linux-next@vger.kernel.org>; Sun, 03 Aug 2014 23:30:35 -0700 (PDT)
In-Reply-To: <20140804162633.2d2e8604@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, David Miller <davem@davemloft.net>, Network Development <netdev@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>

On Sun, Aug 3, 2014 at 11:26 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi James,
>
> Today's linux-next merge of the security tree got a conflict in
> kernel/seccomp.c between commit 7ae457c1e5b4 ("net: filter: split
> 'struct sk_filter' into socket and bpf parts") from the net-next tree
> and commits c8bee430dc52 ("seccomp: split filter prep from check and
> apply") and 3ba2530cc06e ("seccomp: allow mode setting across threads")
> from the security tree.
>
> I fixed it up (I hope - see below) and can carry the fix as necessary
> (no action is required).

Looks correct. Thanks.
Will double check during merge window.
