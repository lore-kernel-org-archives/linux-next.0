From: Jens Axboe <jaxboe@fusionio.com>
Subject: Re: linux-next: manual merge of the s390 tree with Linus' tree
Date: Fri, 20 May 2011 20:43:03 +0200
Message-ID: <4DD6B637.3060509@fusionio.com>
References: <20110519103539.aa1b5094.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110519103539.aa1b5094.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

On 2011-05-19 02:35, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the s390 tree got a conflict in
> drivers/s390/char/tape_block.c between commit 9fd097b14918 ("block:
> unexport DISK_EVENT_MEDIA_CHANGE for legacy/fringe drivers") from Linus'
> tree and commit 263fa17de50e ("[S390] Remove tape block device driver")
> from the s390 tree.
> 
> The latter just removes the file updated by the former.  So I did that.

That works, thanks. The other fixup you are carrying should be gone now,
I had to pull in 2.6.39 final to resolve other conflicts.

-- 
Jens Axboe
