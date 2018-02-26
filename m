From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Mon, 26 Feb 2018 10:03:49 +0100
Message-ID: <0df3cf32-9f64-b0f0-3a1c-00c1ab52c939@iogearbox.net>
References: <20180226114147.2ab5c647@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180226114147.2ab5c647@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 02/26/2018 01:41 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the bpf-next tree got a conflict in:
> 
>   tools/testing/selftests/bpf/test_verifier.c
> 
> between commit:
> 
>   ca36960211eb ("bpf: allow xadd only on aligned memory")
> 
> from the bpf tree and commit:
> 
>   23d191a82c13 ("bpf: add various jit test cases")
> 
> from the bpf-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good, thanks!
