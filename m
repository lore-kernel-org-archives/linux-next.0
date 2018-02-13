From: Junio C Hamano <gitster@pobox.com>
Subject: Re: linux-next: unnecessary merge in the v4l-dvb tree
Date: Tue, 13 Feb 2018 09:18:03 -0800
Message-ID: <xmqqmv0crepg.fsf@gitster-ct.c.googlers.com>
References: <20180213080036.3bf3a908@canb.auug.org.au>
        <CA+55aFwM0vy+pw-Xv=gA19ULMwAXNPhdO3qR5A3hkMrZKJFNSQ@mail.gmail.com>
        <CA+55aFzxsNxgKD1uGZQCiib+=+wCMSa0=B+Ye3Zi-u6kpz8Vrg@mail.gmail.com>
        <xmqqfu65sx20.fsf@gitster-ct.c.googlers.com>
        <CA+55aFwTp8gg70sHXqOgR01Liv5c8nnfUP0yTdwpkh-rg+2EMA@mail.gmail.com>
        <xmqqzi4drczv.fsf@gitster-ct.c.googlers.com>
        <20180212222157.0a3bd472@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212222157.0a3bd472@vento.lan> (Mauro Carvalho Chehab's
        message of "Mon, 12 Feb 2018 22:21:57 -0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Mauro Carvalho Chehab <mchehab@osg.samsung.com> writes:

> Yes, that's my pain. I don't want ff only when pulling from others,
> only when pulling from upstream tree.
>
>> 
>> We may want per-remote equivalent for it, i.e. e.g.
>> 
>> 	[pull]
>> 		ff=false ;# good default for collecting contributions
>> 
>> 	[remote "torvalds"] 
>> 		pullFF = only ;# good default for catching up
>> 
>> or something like that, perhaps?
>
>
> Yeah, something like that works. Please notice, however, that what I
> usually do is:
>
> 	$ git remote update torvalds
> 	$ git merge <tag>
> 	  (or git pull . <tag>)
>
> So, for the above to work, it should store somehow the remote from
> where a tag came from.

That makes me wonder if another heuristic I floated earlier is more
appropriate.  When merging a tag object T, if refs/tags/T exists and
it is that tag object, then an updated "merge" would default to "--ff";
otherwise, it would keep the current default of creating a merge even
when we could fast-forward, in order to record that tag T in the
resulting history.

Of course, end users can use command line options to override such
heuristics anyway, but if the behaviour based on the new heuristic
is easy to explain and understand, and covers majority of the use
cases without command line override, then we might not even need a
new configuration mechanism like remove.torvalds.pullFF mentioned
above.
