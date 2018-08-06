From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
Date: Sun, 5 Aug 2018 19:16:56 -0600
Message-ID: <91bc0348-fbb4-168b-2946-5163a204819b@kernel.dk>
References: <20180806075112.6253d2da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180806075112.6253d2da@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 8/5/18 3:51 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> Commit
> 
>   290a40cb336c ("nvme: don't enable AEN if not supported")
> 
> is missing a Signed-off-by from its committer.

It's because I'm an idiot and cherry picked the commit. Not only is
it missing the SOB, but it'll also show up twice if pulled. I'll likely
just have to rebase to get rid of this, and then pull in the right
-rc instead... Will do that tomorrow.

-- 
Jens Axboe
