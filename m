From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Thu, 26 Apr 2018 09:57:06 +0200
Message-ID: <57a9e2f1-fb96-a6f9-246b-19b84cca1992@iogearbox.net>
References: <20180426105313.792db06a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180426105313.792db06a@canb.auug.org.au>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>
List-Id: linux-next.vger.kernel.org

On 04/26/2018 02:53 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the bpf-next tree got a conflict in:
> 
>   samples/sockmap/Makefile
> 
> between commit:
> 
>   4dfe1bb95235 ("bpf: sockmap sample use clang flag, -target bpf")
> 
> from the bpf tree and commit:
> 
>   2e04eb1dd1ca ("bpf: sockmap, remove samples program")
> 
> from the bpf-next tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

That's correct as well, thank you!
