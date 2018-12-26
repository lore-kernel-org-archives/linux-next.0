From: Harsh Jain <harsh@chelsio.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the crypto tree
Date: Wed, 26 Dec 2018 15:18:17 +0530
Message-ID: <3bb5d08e-27c3-a088-6584-6f42e241c1a1@chelsio.com>
References: <20181223231304.1654cf1d@canb.auug.org.au>
 <20181223123011.qxwfkoib6zadd2rn@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181223123011.qxwfkoib6zadd2rn@gondor.apana.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Atul Gupta <atul.gupta@chelsio.com>
List-Id: linux-next.vger.kernel.org


On 23-12-2018 18:00, Herbert Xu wrote:
> On Sun, Dec 23, 2018 at 11:13:04PM +1100, Stephen Rothwell wrote:
>> Hi Herbert,
>>
>> Commit
>>
>>   6501ab5ed4d9 ("crypto: chelsio - Reset counters on cxgb4 Detach")
>>
>> is missing a Signed-off-by from its author.
> Hi Stephen:
>
> I believe the issue here is not a missing sign-off from the author,
> but rather that the author was incorrectly set to Harsh who sent
> the email rather than Atul.
>
> Harsh, please add a From header to the patch description in future
> so that the Author field is set correctly.
oops, Will take care next time. Thanks.
>
> Cheers,
