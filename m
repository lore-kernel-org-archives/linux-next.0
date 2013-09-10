From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with Linus' tree
Date: Tue, 10 Sep 2013 15:44:00 -0700
Message-ID: <20130910154400.75bb3328fbb9eaa937715652@linux-foundation.org>
References: <20130910143807.4c32d548e08d2184061f52cb@canb.auug.org.au>
	<20130910152753.662599171456233c5f91edb4@linux-foundation.org>
	<CA+55aFwiK+=7N3EDoX+s8dVCoraba9bCPrgqHgsMKppogEFBnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:40199 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420Ab3IJWoB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Sep 2013 18:44:01 -0400
In-Reply-To: <CA+55aFwiK+=7N3EDoX+s8dVCoraba9bCPrgqHgsMKppogEFBnw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Chinner <dchinner@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>

On Tue, 10 Sep 2013 15:35:04 -0700 Linus Torvalds <torvalds@linux-foundation.org> wrote:

> So I'd (once again) suggest you base your pile of patches on the
> previous stable kernel, and that linux-next take it *first* rather
> than take it last.

That's what we're now doing.  But this particular patchset was
different because it's changing multiple subsystems, several of which
are concurrently being changed in an uncoordinated fashion.
