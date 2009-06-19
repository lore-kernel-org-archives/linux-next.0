From: Tejun Heo <tj@kernel.org>
Subject: Re: Can you please pull percpu#for-next into linux-next?
Date: Fri, 19 Jun 2009 12:44:28 +0900
Message-ID: <4A3B099C.7090406@kernel.org>
References: <4A3AFAA3.4080607@kernel.org> <20090619132328.95ee96bc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:39545 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751133AbZFSDpR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Jun 2009 23:45:17 -0400
In-Reply-To: <20090619132328.95ee96bc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>Ingo Molnar <mingo@elte.hu>, Christoph Lameter <cl@linux-foundation.org>

Hello,

Stephen Rothwell wrote:
> Hi Tejun,
> 
> On Fri, 19 Jun 2009 11:40:35 +0900 Tejun Heo <tj@kernel.org> wrote:
>> What do I need to do to get a tree pulled into linux-next rounds?  The
>> tree in question is
> 
> You need to ask. :-)

:-)

>>   git://git.kernel.org/pub/scm/linux/kernel/git/tj/percpu.git for-next
>>   http://git.kernel.org/?p=linux/kernel/git/tj/percpu.git;a=shortlog;h=for-next
> 
> You also need to give me the name(s) of people to inform about any issues
> I have with the tree (defaults to you).

Me, Rusty Russell, Christoph Lameter and Ingo Molnar should do.

>> and contains percpu related changes scheduled for the next (2.6.32)
>> merge window.  The tree touches a lot of archs and percpu users so
>> it'll probably cause some headache during the devel cycle.
> 
> Since it is for 2.6.32, I will only add it after 2.6.31-rc1 is released.

Alright.

> What I tell everyone: all patches/commits in the tree/series must
> have been:
> 
> 	posted to a relevant mailing list
> 	reviewed
> 	unit tested
> 	destined for the next merge window (or the current release)
> 
> *before* they are included.  The linux-next tree is for integration
> testing and to lower the impact of conflicts between subsystems in the
> next merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

Yeap, will keep it that way.

>> Also, is there some guide I can read about linux-next?
> 
> There is a web site which is mostly useful:
> http://linux.f-seidel.de/linux-next/pmwiki/

Thanks.

-- 
tejun
