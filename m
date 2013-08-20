From: Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: Re: [PATCH V8 00/33] loop: Issue O_DIRECT aio using bio_vec
Date: Tue, 20 Aug 2013 14:13:15 -0500
Message-ID: <5213BFCB.3010503@oracle.com>
References: <1374774659-13121-1-git-send-email-dave.kleikamp@oracle.com> <20130820130056.GA9652@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130820130056.GA9652@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "Maxim V. Patlasov" <mpatlasov@parallels.com>, Zach Brown <zab@zabbo.net>, Linux-Next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen,
Would you be willing to pick up
git://github.com/kleikamp/linux-shaggy.git for-next
into linux-next?

There will be some unclean merges, and I can send you updated patches
created against your latest tree. I'm not exactly sure of your process
wrt cleaning up merges, but I guess they would help.

Thanks,
Shaggy

On 08/20/2013 08:00 AM, Christoph Hellwig wrote:
> As I've seen very few replies to this:  how do we ensure this gets
> picked up for the 3.12 merge window?  The series has been a reposted
> a few times without complaints or major changes, but the ball still
> doesn't seem to get rolling.
> 
> I'd really like to do some ecryptfs and scsi target work that is going
> to rely on this soon.
> 
