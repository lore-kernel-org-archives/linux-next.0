From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the target-updates
 tree
Date: Thu, 8 Oct 2015 07:22:46 +1100
Message-ID: <20151008072246.00d423ea@canb.auug.org.au>
References: <20151007144932.3e68e0f7@canb.auug.org.au>
	<87bncaj23e.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87bncaj23e.fsf@ashishki-desk.ger.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Alexander,

On Wed, 07 Oct 2015 15:27:17 +0300 Alexander Shishkin <alexander.shishkin@linux.intel.com> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > Caused by commit
> >
> >   7bd1d4093c2f ("stm class: Introduce an abstraction for System Trace Module devices")
> >
> > from the char-misc tree interacting with commit
> >
> >   f71933438300 ("configfs: remove old API")
> >
> > I have reverted the target-updated commit for today.  If there is a
> > better resolution (and I assume that there is), please let me know.
> 
> I'm going to follow up to this email with a fix that updates stm class
> code to the new api, I'm not sure whos branch it should go to, because
> it only works with Christoph's configfs patches in the -next.

Well, I will add it as a merge resolution patch in linux-next (instead
of the current revert) but someone will have to remember to send it to
Linus when the latter of these two trees is merged by him.  Unless one
of these trees can merge the other (or a non rebasing subset) ...
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
