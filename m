From: Joe Perches <joe@perches.com>
Subject: Re: [RFC PATCH -next] Fix printk_once build errors due to
 __read_mostly
Date: Wed, 30 Oct 2013 15:58:36 -0700
Message-ID: <1383173916.9435.53.camel@joe-AO722>
References: <1383128301-20231-1-git-send-email-james.hogan@imgtec.com>
	 <20131030134839.8bdf70cc68d1bf0beb1fb63a@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0114.hostedemail.com ([216.40.44.114]:50194 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751510Ab3J3W6l (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Oct 2013 18:58:41 -0400
In-Reply-To: <20131030134839.8bdf70cc68d1bf0beb1fb63a@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-metag@vger.kernel.org

On Wed, 2013-10-30 at 13:48 -0700, Andrew Morton wrote:
> On Wed, 30 Oct 2013 10:18:21 +0000 James Hogan <james.hogan@imgtec.com> wrote:
[]
> > Note that this actually adds a recursive include, since <linux/cache.h>
> > includes <linux/kernel.h>, which includes <linux/printk.h>. The actual
> > dependencies are all in macros so it doesn't actually seem to result in
> > any build failures, but it's clearly less than ideal.
> 
> Yitch.

Yeah.

There are about ~700 files in the tree that use __read_mostly.
Only about ~25 of those actually #include <linux/cache.h>

I did a script that adds the #include, but 700 files is a _lot_.

For today's next:

$ git grep -w --name-only __read_mostly | \
  xargs grep -P -l "^\s*#\s*include\s+<linux/cache.h>" | wc -l
28

$ git grep -w --name-only __read_mostly | \
  xargs grep -P -L "^\s*#\s*include\s+<linux/cache.h>" | wc -l
716

Untangling that crud is nasty.
