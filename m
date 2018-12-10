From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the device-mapper tree with the block
 tree
Date: Sun, 9 Dec 2018 20:55:51 -0700
Message-ID: <1993882e-8af3-9e64-da82-195d0089d5e3@kernel.dk>
References: <20181210144322.11a94d25@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210144322.11a94d25@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 12/9/18 8:43 PM, Stephen Rothwell wrote:
> Hi all,
> 
> It appears that there are a series of shared patches between the block
> and device-mapper trees that are not the same commits.  I assume that the
> block tree has been rebased, while the device mapper tree that was based
> (or includes) part of the block tree has not bee rebased (yet).

Yep that's my fault, due to a stupid mistake I had to rebase the
block tree. Didn't realize that Mike's tree was based on it. Mike,
would it be a big issue for you to rebase the dm tree?

-- 
Jens Axboe
