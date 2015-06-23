From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: Tree for Jun 23
Date: Tue, 23 Jun 2015 10:33:37 -0500
Message-ID: <87twtyzbfy.fsf@x220.int.ebiederm.org>
References: <20150623181828.1269d960@canb.auug.org.au>
	<87twty66gp.fsf@x220.int.ebiederm.org>
	<20150623135943.GB9454@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:46068 "EHLO
	out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055AbbFWPjA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2015 11:39:00 -0400
In-Reply-To: <20150623135943.GB9454@kroah.com> (Greg Kroah-Hartman's message
	of "Tue, 23 Jun 2015 06:59:43 -0700")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Tue, Jun 23, 2015 at 05:53:58AM -0500, Eric W. Biederman wrote:
>> 
>> Stephen could you please drop the kdbus tree?
>
> What?  No, that's not how this works.  That's not how any of this
> works.

That is exactly how this works.  Unless there was a change in policy
that I missed linux-next is for code that is planned to be sent to Linus
in the coming merge window.  The purpose of linux-next is to
preemptively detect merge issues between trees.  As a bonus a the trees
also get a little bit of build and merge testing.

Frankly given how far kdbus has to go I was rather appalled when I
noticed that the code was sitting in linux-next.

>> There was some significant work that was identified last merge window
>> that has not yet been done, and who knows when it will be done.
>> Certainly the recent sd-bus API announcement strongly suggests that
>> there are no plans to perform such work.
>> 
>> Having the kdbus tree in linux-next with the implicit suggestion that a
>> pull request will be sent to Linus this merge window before the problems
>> are addressed and we will have to repeat the mess from last merge window
>> keeps me up at night.
>
> Code sitting in linux-next keeps you awake?  I think you need to
> exercise more so that you can sleep better :)

Having to use the most forceful language I know to tell people I respect
that their judgment is faulty is very unpleasant for me.

The code sitting in linux-next makes it appear that nothing has
substantively changed since the last merge window.  That we will have to
repeat the mess that happened last merge window.  That is not productive
for anyone.

>> So to avoid the appearance that the kdbus folks are continuing to
>> ignoring feedback can we please keep the kdbus tree out of linux-next
>> until it is ready to be merged?
>
> We are not ignoring _constructive_ feedback, please realize the
> difference.

I don't truly know what the plans are for kbus.   I do know that there
is the appearance that some of the constructive feedback has not been
acted upon.    I have yet to see a fast userspace dbus implementation for
comparison purposes or hear a rumor of one.  The action with publishing
sd-bus with non-optional kdbus support locks in the kdbus-ioctl API
which means that the ioctl numbers will now need to change if any kernel
api changes are required.   I know of at least one piece of criticism
that once acted upon will require changing the userspace api, and I
suspect several other pieces of constructive criticism will as well.

> First Andy does a preemptive NAK of a pull request that was never sent,
> and now you want to kick it out of linux-next for no valid reason.  If I
> was an insecure person, I'd think that there are some people in the
> kernel community who don't like me at the moment.

I was asking that the tree leave linux-next because it does not
represent code that is likely (or should at this point) be sent to Linus
this merge window.  Last I checked that was a valid reason to keep code
out of linux-next.

> This is just getting ridiculous.

This has been ridiculous for a long time.

There has been times in this process where ignoring constructive
feedback has been the norm.  There have been times in this process where
a word to the wise about technical issues has been the norm.  I have
little evidence that things are better.

All that I have evidence for, is that the conversations have gone silent
and some minor issues to kbus have been addressed.

The appearance is that the constructive feedback has been blown off and
that with kdbus sitting in linux-next you are preparing a pull request
to Linus this merge window.

So to remain the appearance of propriety, I am asking that kdbus be
removed from linux-next until the code is in a state where asking for
the code to be merged will not be controversial.

Eric
