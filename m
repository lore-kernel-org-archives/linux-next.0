From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: ext4 tree build failure
Date: Wed, 17 Jun 2009 07:16:30 +0300
Message-ID: <4A386E1E.7080808@cs.helsinki.fi>
References: <20090616144413.50e975f9.sfr@canb.auug.org.au> <20090616203034.GB14788@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:41783 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805AbZFQEU7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Jun 2009 00:20:59 -0400
In-Reply-To: <20090616203034.GB14788@mit.edu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Tso <tytso@mit.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph

Hi Ted,

Theodore Tso wrote:
> On Tue, Jun 16, 2009 at 02:44:13PM +1000, Stephen Rothwell wrote:
>> Hi Ted,
>>
>> Today's linux-next build (powerpc ppc64_defconfig) failed like this after
>> the slab tree was merged:
>>
>> In file included from fs/jbd2/checkpoint.c:26:
>> include/trace/events/jbd2.h:11: error: expected ')' before '(' token
>> include/trace/events/jbd2.h:31: error: expected ')' before '(' token
> 
> Hmm... I wonder why the slab tree would be messing with tracing
> include files.
> 
> Which slab tree is it?  Is it Pekka's?
> 
>       git://git.kernel.org/pub/scm/linux/kernel/git/penberg/slab-2.6.git

Yup, that's it. I looked at this yesterday but didn't see anything 
suspicious. I don't think I have any patches that mess with any tracing 
include files. The only major change there should be the new default 
SLQB allocator. Perhaps ext4 is simply missing some includes that are 
pulled by SLUB but not SLQB?

			Pekka
