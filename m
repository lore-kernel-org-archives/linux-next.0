From: Pavel Machek <pavel@suse.cz>
Subject: Re: [PATCH 1/1] ring-buffer: buffer record on/off switch
Date: Wed, 12 Nov 2008 13:51:50 +0100
Message-ID: <20081112125149.GA13192@ucw.cz>
References: <20081111200601.147669239@goodmis.org> <20081111201034.315528609@goodmis.org> <20081111125645.4f7a5827.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gprs189-60.eurotel.cz ([160.218.189.60]:54410 "EHLO UNKNOWN"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751911AbYKLMwN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 07:52:13 -0500
Content-Disposition: inline
In-Reply-To: <20081111125645.4f7a5827.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, mingo@elte.hu, tglx@linutronix.de, torvalds@linux-foundation.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, srostedt@redhat.com

On Tue 2008-11-11 12:56:45, Andrew Morton wrote:
> On Tue, 11 Nov 2008 15:06:02 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > +static struct file_operations rb_simple_fops = {
> 
> should be const...
> 
> Probably it isn't worth fixing.  Someone(tm) should do period sweeps -
> 10% of our file_operationses aren't const.

checkptch rule? struct file_operations .* = { -> needs const?

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
