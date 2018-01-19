From: Harsh Jain <harsh@chelsio.com>
Subject: Re: linux-next: build warning after merge of the crypto tree
Date: Fri, 19 Jan 2018 09:51:43 +0530
Message-ID: <2a629f26-de6b-803e-a07b-4cfec3b59d13@chelsio.com>
References: <20180119124926.1c22bb19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180119124926.1c22bb19@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Herbert,

It's an indentation issue. Seems checkpatch and default compile options does not report this warning.

How would you like to take the fix. Should I sent whole series again with fix or only indentation patch.


On 19-01-2018 07:19, Stephen Rothwell wrote:
> Hi Herbert,
>
> After merging the crypto tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/crypto/chelsio/chcr_algo.c: In function 'create_authenc_wr':
> drivers/crypto/chelsio/chcr_algo.c:2113:2: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
>   if (error)
>   ^~
> drivers/crypto/chelsio/chcr_algo.c:2115:3: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
>    dnents = sg_nents_xlen(req->dst, assoclen, CHCR_DST_SG_SIZE, 0);
>    ^~~~~~
>
> Introduced by commit
>
>   e1a018e607a3 ("crypto: chelsio - Remove dst sg size zero check")
>
