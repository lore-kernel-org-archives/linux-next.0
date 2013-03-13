From: Junio C Hamano <gitster@pobox.com>
Subject: Re: linux-next: unneeded merge in the security tree
Date: Tue, 12 Mar 2013 20:17:27 -0700
Message-ID: <7v38w056pk.fsf@alter.siamese.dyndns.org>
References: <7vtxog5msj.fsf@alter.siamese.dyndns.org>
 <20130313023026.GD16919@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130313023026.GD16919@thunk.org> (Theodore Ts'o's message of
 "Tue, 12 Mar 2013 22:30:26 -0400")
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Theodore Ts'o <tytso@mit.edu> writes:

> On Tue, Mar 12, 2013 at 02:30:04PM -0700, Junio C Hamano wrote:
>> Theodore Ts'o <tytso@mit.edu> writes:
>> 
>> > [remote "origin"]
>> > 	url = git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
>> > 	fetch = +refs/heads/master:refs/heads/master
>> > 	mergeoptions = --ff-only
>> >
>> 
>> Is there an escape hatch for that rare case?  IOW, how does a
>> submaintainer who configured the above to override --ff-only?
>
> Hmm, maybe we would need to add a --no-ff-only?  Or they could just
> do:
>
> 	git fetch origin
> 	git merge FETCH_HEAD

Hmm, neither feel quite nice.

I haven't heard any comments on my alternative proposal, by the
way.  Did the message get lost?
