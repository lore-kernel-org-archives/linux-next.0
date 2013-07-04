From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: manual merge of the akpm tree with the kbuild tree
Date: Thu, 04 Jul 2013 11:07:04 +0200
Message-ID: <51D53B38.7040202@suse.cz>
References: <20130704143353.e695ca64b17705c842676870@canb.auug.org.au> <20130703214300.11d9223a.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38554 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752055Ab3GDJHI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jul 2013 05:07:08 -0400
In-Reply-To: <20130703214300.11d9223a.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yaakov Selkowitz <yselkowitz@users.sourceforge.net>, Daniel Tang <dt.tangr@gmail.com>

On 4.7.2013 06:43, Andrew Morton wrote:
> On Thu, 4 Jul 2013 14:33:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi Andrew,
>>
>> Today's linux-next merge of the akpm tree got conflicts in
>> tools/include/tools/be_byteshift.h and tools/include/tools/le_byteshift.h
>> between commit b35310627f39 ("tools/include: use stdint types for
>> user-space byteshift headers") from the kbuild tree and commit
>> "scripts/sortextable.c: fix building on non-Linux systems" from the
>> akpm tree.
>>
>> As fas as I can tell, these patches do the same thing except one uses
>> stdint.h and the other inttypes.h.  I just dropped the akpm tree patch.
> 
> Well OK, but new patches really shouldn't be popping up in the middle
> of the merge window like this.

Sorry for that.


> AFAICT Yaakov (re)sent this patch way back in April, so it should have
> been in -next for a long time.  Something has gone wrong here.

I only saw an email from June 26, I wasn't on the CC list of the
previous submissions.

Michal
