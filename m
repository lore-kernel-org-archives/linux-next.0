From: Eric Paris <eparis@redhat.com>
Subject: Re: linux-next: manual merge of the ext3 tree with the cifs tree
Date: Wed, 25 Nov 2009 10:23:03 -0500
Message-ID: <1259162583.4683.46.camel@dhcp231-106.rdu.redhat.com>
References: <20091125140626.2b71fb0a.sfr@canb.auug.org.au>
	 <20091125085006.GB549@quack.suse.cz>
	 <20091125200444.cab8f918.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:14006 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752553AbZKYPX2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Nov 2009 10:23:28 -0500
In-Reply-To: <20091125200444.cab8f918.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Steve French <sfrench@us.ibm.com>, Jeff Layton <jlayton@redhat.com>

On Wed, 2009-11-25 at 20:04 +1100, Stephen Rothwell wrote:

> I have just noticed that I get the same conflict between the cifs tree
> and the fsnotify tree (hi Eric!) which has also included that patch from
> Christoph.  Again, not a big problem.

I was doing my development against linux-next.  After I posted them and
decided to commit them to my -next tree I realized they didn't commit
due to hch's patch.  So I cherry picked hch's patch and decided I
wouldn't ask linus to pull until after the hch patch went in (I did it
for some things in the net-next tree as well as I recall)

What's the best way?  To handle this?  do you prefer to just carry the
conflict fix?  should we cherry pick things and fix it ourselves?  I
guess my method breaks down if the tree in question doesn't eventually
go to linus like it should.....

-Eric
