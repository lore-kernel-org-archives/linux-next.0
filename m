From: Yonghong Song <yhs@fb.com>
Subject: Re: linux-next: manual merge of the net-next tree with the bpf tree
Date: Tue, 31 Jul 2018 21:23:46 -0700
Message-ID: <1774afa4-5b21-61f1-e921-4102a1950771@fb.com>
References: <20180801113508.54323706@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801113508.54323706@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Okash Khawaja <osk@fb.com>
List-Id: linux-next.vger.kernel.org



On 7/31/18 6:35 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>    tools/bpf/bpftool/map.c
> 
> between commit:
> 
>    573b3aa69406 ("tools/bpftool: fix a percpu_array map dump problem")
> 
> from the bpf tree and commit:
> 
>    2d3feca8c44f ("bpf: btf: print map dump and lookup with btf info")
> 
> from the net-next tree.

The merge looks good to me. Thanks!

> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
