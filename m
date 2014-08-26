From: Stephan Mueller <smueller@chronox.de>
Subject: Re: linux-next: build warnings after merge of the crypto tree
Date: Tue, 26 Aug 2014 09:00:25 +0200
Message-ID: <2854432.6G8zoS5xdJ@tauon>
References: <20140826161456.7ad100e3@canb.auug.org.au> <20140826063812.GA3555@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140826063812.GA3555@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Am Dienstag, 26. August 2014, 14:38:12 schrieb Herbert Xu:

Hi Herbert,

>On Tue, Aug 26, 2014 at 04:14:56PM +1000, Stephen Rothwell wrote:
>> Hi Herbert,
>> 
>> After merging the crypto tree, today's linux-next build (powerpc
>> ppc44x_defconfig, i386 defconfig and sparc defconfig) produced these
>> warnings:
>> 
>> In file included from crypto/testmgr.c:30:0:
>> include/crypto/drbg.h: In function 'drbg_max_addtl':
>> include/crypto/drbg.h:157:2: warning: left shift count >= width of
>> type> 
>>   return (1UL<<35);
>>   ^
>> 
>> include/crypto/drbg.h: In function 'drbg_max_requests':
>> include/crypto/drbg.h:163:2: warning: left shift count >= width of
>> type> 
>>   return (1UL<<48);
>>   ^
>> 
>> Introduced by commit 05c81ccd9087 ("crypto: drbg - remove
>> configuration of fixed values").  These are all 32 bit builds.
>
>Stephan, could you take a look at this?

I am on it. Thanks.
>
>Thanks,


Ciao
Stephan
