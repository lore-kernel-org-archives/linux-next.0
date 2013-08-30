From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Fri, 30 Aug 2013 10:38:25 -0700
Message-ID: <CA+55aFwfaW0zZJ5_5Yhyq7+wickG0A3MPzseZ922fy56dJNAAg@mail.gmail.com>
References: <20130830175509.39d7fbfd96a4e726ba739d26@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vb0-f51.google.com ([209.85.212.51]:61211 "EHLO
	mail-vb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753861Ab3H3Ri0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Aug 2013 13:38:26 -0400
In-Reply-To: <20130830175509.39d7fbfd96a4e726ba739d26@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin LaHaise <bcrl@kvack.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Waiman Long <Waiman.Long@hp.com>

On Fri, Aug 30, 2013 at 12:55 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> -                       aio_ring_file->f_path.dentry->d_count,
> +                       aio_ring_file->f_path.dentry->d_lockref.count,

This is wrong. If you really want the dentry count (which I doubt, I
don't see why this code would care _even_ just for a debug printout),
you should use

   d_count(aio_ring_file->f_dentry)

instead these days. That will get the count from the right place,
regardless of any lockref issues or anything else (and f_dentry may be
the "old" way to get the dentry, but it's still supported and unlikely
to go away. No point in writing out "f_path.dentry" unless you *want*
to be aware of the fact that f_path has both a dentry and a mnt member
- but most people really don't care about the mnt information).

            Linus
