From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 18 Sep 2018 10:44:06 +0200
Message-ID: <93982e9d-dc78-6423-bb9b-c5773d98e244@iogearbox.net>
References: <20180918101107.74d8689a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180918101107.74d8689a@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vakul Garg <vakul.garg@nxp.com>
List-Id: linux-next.vger.kernel.org

On 09/18/2018 02:11 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   tools/testing/selftests/net/tls.c
> 
> between commit:
> 
>   50c6b58a814d ("tls: fix currently broken MSG_PEEK behavior")
> 
> from the net tree and commit:
> 
>   c2ad647c6442 ("selftests/tls: Add test for recv(PEEK) spanning across multiple records")
> 
> from the net-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The test from 50c6b58a814d supersedes the one from c2ad647c6442 so the
recv_peek_large_buf_mult_recs could be removed; latter was also not working
correctly due to this bug.

Thanks,
Daniel
