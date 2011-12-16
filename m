From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: build failure after merge of the target-merge tree
Date: Thu, 15 Dec 2011 22:12:43 -0800
Message-ID: <1324015963.28227.3.camel@haakon2.linux-iscsi.org>
References: <20111215132902.d0a90a93696702e09b0c60bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <target-devel-owner@vger.kernel.org>
In-Reply-To: <20111215132902.d0a90a93696702e09b0c60bf@canb.auug.org.au>
Sender: target-devel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>, Christoph Hellwig <hch@infradead.org>, target-devel <target-devel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 2011-12-15 at 13:29 +1100, Stephen Rothwell wrote:
> Hi Nicholas,
> 
> After merging the target-merge tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/infiniband/ulp/srpt/ib_srpt.c:48:39: fatal error: target/target_core_device.h: No such file or directory
> 
> Caused by commit e0d85e515640 ("ib_srpt: Initial SRP Target merge for
> v3.2-rc1") interacting with commit c4795fb20edf ("target: header
> reshuffle, part2") from the target-updates tree which removed
> include/target/target_core_device.h.
> 
> I tried to figure out what set of include files is now needed, but
> couldn't easily, so I have dropped the target-merge tree for today.
> 

Hi Steven,

My apologies for the extra breakage.  for-next-merge has been rebased to
for-next, and now includes the proper v3.3 include/target/ headers in
ib_srpt.

Thanks!

--nab
