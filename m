From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: mmotm 2011-08-24-14-08 uploaded
Date: Wed, 24 Aug 2011 15:11:15 -0700
Message-ID: <20110824151115.9499019c.akpm@linux-foundation.org>
References: <201108242148.p7OLm1lt009191@imap1.linux-foundation.org>
	<20110824150433.70e140a6.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20110824150433.70e140a6.rdunlap@xenotime.net>
Sender: owner-linux-mm@kvack.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 24 Aug 2011 15:04:33 -0700
Randy Dunlap <rdunlap@xenotime.net> wrote:

> On Wed, 24 Aug 2011 14:09:05 -0700 akpm@linux-foundation.org wrote:
> 
> > The mm-of-the-moment snapshot 2011-08-24-14-08 has been uploaded to
> > 
> >    http://userweb.kernel.org/~akpm/mmotm/
> > 
> > It contains the following patches against 3.1-rc3:
> > (patches marked "*" will be included in linux-next)
> 
> Hi Andrew,
> 
> Am I supposed to apply this to linux-next?

Nope.  The full series is based on 3.1-rc3.  It includes origin.patch
which takes it up to current -linus.  And linux-next.patch which takes
it up to today's linux-next.

> I don't get a clean patch(1) against 3.1-rc3.

hm.  What broke?

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
