From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] block: fix an warning of calling blk_rq_aligned()
Date: Thu, 16 Sep 2010 08:23:00 +0200
Message-ID: <4C91B7C4.6030802@kernel.dk>
References: <20100916133005.56baad7e.sfr@canb.auug.org.au> <1284609357-3076-1-git-send-email-namhyung@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1284609357-3076-1-git-send-email-namhyung@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Namhyung Kim <namhyung@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 2010-09-16 05:55, Namhyung Kim wrote:
> 2nd argument of blk_rq_aligned() has changed to 'unsigned long' by
> previous commit 'block: fix an address space warning in blk-map.c'.
> According to that change, its caller has to be modified. This also
> removes address space warnings from sparse.

Thanks, in the future please ensure that you have all{yes,mod}config
tested patches you submit.

-- 
Jens Axboe
