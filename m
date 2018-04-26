From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: manual merge of the bpf-next tree with the net-next
 tree
Date: Thu, 26 Apr 2018 09:56:21 +0200
Message-ID: <946a88a7-a12b-ab57-9f6a-17cf4f9aecfb@iogearbox.net>
References: <20180426104902.548c3fdb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426104902.548c3fdb@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>
List-Id: linux-next.vger.kernel.org

On 04/26/2018 02:49 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the bpf-next tree got a conflict in:
> 
>   tools/testing/selftests/bpf/.gitignore
> 
> between commit:
> 
>   0abf854d7cbb ("selftests: bpf: update .gitignore with missing generated files")
> 
> from the net-next tree and commit:
> 
>   b6fd9cf796e6 ("selftests: bpf: update .gitignore with missing file")
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
