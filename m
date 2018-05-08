From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: manual merge of the bpf-next tree with the s390 tree
Date: Tue, 8 May 2018 10:19:54 +0200
Message-ID: <06ca5230-bce9-626e-02e3-3083b23a2600@iogearbox.net>
References: <20180508102638.1e19b7f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180508102638.1e19b7f2@canb.auug.org.au>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 05/08/2018 02:26 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the bpf-next tree got a conflict in:
> 
>   arch/s390/net/bpf_jit.S
> 
> between commit:
> 
>   de5cb6eb514e ("s390: use expoline thunks in the BPF JIT")
> 
> from the s390 tree and commit:
> 
>   e1cf4befa297 ("bpf, s390x: remove ld_abs/ld_ind")
> 
> from the bpf-next tree.
> 
> I fixed it up (I just removed the file as the latter does) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Yep, sounds good, thanks!
