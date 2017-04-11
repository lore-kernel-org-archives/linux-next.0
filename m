From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the kbuild
 tree
Date: Tue, 11 Apr 2017 15:02:50 +1000
Message-ID: <20170411150250.49996951@canb.auug.org.au>
References: <20170411102119.102f4675@canb.auug.org.au>
        <20170411024215.GA10664@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170411024215.GA10664@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>
List-Id: linux-next.vger.kernel.org

Hi Herbert,

On Tue, 11 Apr 2017 10:42:15 +0800 Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> Actually the patch in the kbuild tree should be reverted because
> we have now increased the in-kernel length limit and this must not
> be directly exposed to user-space or it'll break compatibility.

So basically we need CRYPTO_MAX_ALG_NAME to be 64 in the exported
header but 128 in the kernel header?  In which case the kbuild patch
needs to be changed not removed.  Or the merge resolution needs to be
cleverer.

-- 
Cheers,
Stephen Rothwell
