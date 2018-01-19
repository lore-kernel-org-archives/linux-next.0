From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Fri, 19 Jan 2018 12:00:51 +1100
Message-ID: <20180119120051.30bd88ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  kernel/bpf/verifier.c

between commit:

  6f16101e6a8b ("bpf: mark dst unknown on inconsistent {s, u}bounds adjustments")

from the net tree and commit:

  f4d7e40a5b71 ("bpf: introduce function calls (verification)")

from the net-next tree.

I fixed it up (I just used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



-- 
Cheers,
Stephen Rothwell
