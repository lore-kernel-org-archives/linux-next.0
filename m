From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: manual merge of the crypto tree with the kbuild tree
Date: Tue, 11 Apr 2017 15:34:43 +0900
Message-ID: <CAK7LNASQ5qvYcy3TQ_meQDtSsjDDQn-TW_P9CRaENwP2ioZkQA@mail.gmail.com>
References: <20170411102119.102f4675@canb.auug.org.au> <20170411024215.GA10664@gondor.apana.org.au>
 <20170411150250.49996951@canb.auug.org.au> <20170411051228.GA10951@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170411051228.GA10951@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>
List-Id: linux-next.vger.kernel.org

Hi Herbert,


2017-04-11 14:12 GMT+09:00 Herbert Xu <herbert@gondor.apana.org.au>:
> On Tue, Apr 11, 2017 at 03:02:50PM +1000, Stephen Rothwell wrote:
>>
>> So basically we need CRYPTO_MAX_ALG_NAME to be 64 in the exported
>> header but 128 in the kernel header?  In which case the kbuild patch
>> needs to be changed not removed.  Or the merge resolution needs to be
>> cleverer.
>
> Actually the kbuild patch just needs to be reverted.  We should
> not export CRYPTO_MAX_ALG_NAME at all.  Each user-space interface
> that uses it already has its own limit and should not refer to the
> in-kernel value.



CRYPTO_MAX_ALG_NAME is referenced from
include/uapi/linux/cryptouser.h

If you exporting CRYPTO_MAX_ALG_NAME is wrong,
please move cryptouser.h out of the include/uapi directory.




-- 
Best Regards
Masahiro Yamada
