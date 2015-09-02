From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the block tree with the xfs tree
Date: Wed, 2 Sep 2015 23:37:29 +1000
Message-ID: <20150902233729.4e824342@canb.auug.org.au>
References: <20150902121649.7a686b6c@canb.auug.org.au>
	<C57DF728-E46C-433C-AA9D-209557D795E2@filmlight.ltd.uk>
	<20150902230342.125e23ce@canb.auug.org.au>
	<1441200891.17400.1277.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441200891.17400.1277.camel@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Willcocks <roger@filmlight.ltd.uk>
Cc: Jens Axboe <axboe@kernel.dk>, David Jeffery <djeffery@redhat.com>, linux-kernel@vger.kernel.org, xfs@oss.sgi.com, Ben Myers <bpm@sgi.com>, linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Roger,

On Wed, 02 Sep 2015 14:34:51 +0100 Roger Willcocks <roger@filmlight.ltd.uk> wrote:
>
> Huh, now I've had my coffee, that extra check doesn't add anything.
> (There's no harm done in assigning zero to io_error if it's already
> zero.) Apologies for the noise.

That's OK, my excuse is being to far at the other end of the day ...

I actually now remember thinking the same thing at the time I did it :-)
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
