From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Mon, 14 May 2018 08:31:44 -0600
Message-ID: <bbd3fc2b-2125-1e73-fc2f-dc992dba1dee@kernel.dk>
References: <20180514125139.459a058d@canb.auug.org.au>
 <20180514082951.GA20978@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180514082951.GA20978@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 5/14/18 2:29 AM, Christoph Hellwig wrote:
> On Mon, May 14, 2018 at 12:51:39PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the block tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
> 
> The look entirely correct, but oddly enough my compiler did not bother
> to warn.

Applied, thanks.

-- 
Jens Axboe
