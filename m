From: Dmitry Kasatkin <d.kasatkin@samsung.com>
Subject: Re: linux-next: manual merge of the security tree with the  tree
Date: Tue, 29 Oct 2013 10:37:05 +0200
Message-ID: <526F73B1.6030607@samsung.com>
References: <20131028184740.ee58871cc5bd149901cbdf03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20131028184740.ee58871cc5bd149901cbdf03@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Herbert Xu <herbert@gondor.apana.org.au>
List-Id: linux-next.vger.kernel.org

On 28/10/13 09:47, Stephen Rothwell wrote:
> Hi James,
>
> Today's linux-next merge of the security tree got a conflict in
> crypto/Makefile between commit a62b01cd6cc1 ("crypto: create generic
> version of ablk_helper") from the crypto tree and commit ee08997fee16
> ("crypto: provide single place for hash algo information") from the
> security tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
Hello,

Thanks!

- Dmitry
