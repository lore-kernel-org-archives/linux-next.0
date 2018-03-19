From: Harsh Jain <harsh@chelsio.com>
Subject: Re: linux-next: build warning after merge of the crypto tree
Date: Mon, 19 Mar 2018 11:14:14 +0530
Message-ID: <dbcf6dc6-919c-1b7e-5a6c-c4181fd29c40@chelsio.com>
References: <20180319120433.24cc4be1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180319120433.24cc4be1@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On 19-03-2018 06:34, Stephen Rothwell wrote:
> Hi Herbert,
>
> After merging the crypto tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> In file included from drivers/crypto/chelsio/chcr_ipsec.c:66:0:
> drivers/crypto/chelsio/chcr_crypto.h:343:12: warning: 'chcr_ahash_continue' declared 'static' but never defined [-Wunused-function]
>  static int chcr_ahash_continue(struct ahash_request *req);
>             ^~~~~~~~~~~~~~~~~~~
>
> Introduced by commit
>
>   5110e65536f3 ("crypto: chelsio -Split Hash requests for large scatter gather list")
>
Hi Stephen/Herbert,

I will submit the fix to cryptodev tree.

Thanks & Regards
Harsh Jain
