From: Bojan Smojver <bojan@rexursive.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (suspend tree related)
Date: Thu, 09 Sep 2010 13:13:56 +1000
Message-ID: <1284002036.2614.39.camel@shrek.rexursive.com>
References: <20100909125838.6c82edc4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100909125838.6c82edc4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 2010-09-09 at 12:58 +1000, Stephen Rothwell wrote:
> Caused by commit 2b2609c19ff19361360552786bd252ef40dfe5ce ("PM /
> Hibernate: Compress hibernation image with LZO").
> 
> See Rule 1 in Documentation/SubmitChecklist.  There is a missing
> include of linux/vmalloc.h. 

Thanks. I see I succeeded - first patch broke the build - yay! ;-)

Rafael,

Can you please add vmalloc.h to the thingy. I don't have commit access,
obviously.

-- 
Bojan
