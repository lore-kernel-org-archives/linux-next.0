From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: linux-next: question about the luto-misc tree
Date: Mon, 22 Dec 2014 11:16:56 -0800
Message-ID: <CALCETrXfc5SpjOUfRuj7d5Kzushjucw-njcGT+XW6L26c3BFyA@mail.gmail.com>
References: <20141214175747.2e6c506e@canb.auug.org.au> <CALCETrXu19aHhudTfPAr5PM05FR0xKBiSHgbubVhh6QUrHCADw@mail.gmail.com>
 <20141214120318.GA5310@linux.vnet.ibm.com> <CALCETrWsy5sxVTmjNu7t+o-QvEVY-csQHkP-PXT1aMFiXnzzhQ@mail.gmail.com>
 <20141214173715.GB5310@linux.vnet.ibm.com> <CALCETrWT7SLO3E+nV2g=QzJHAeWU4FBRENq=7OvoNDrHA7W0fg@mail.gmail.com>
 <20141214181744.GF5310@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141214181744.GF5310@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Dec 14, 2014 at 10:17 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Sun, Dec 14, 2014 at 09:41:04AM -0800, Andy Lutomirski wrote:
>> On Sun, Dec 14, 2014 at 9:37 AM, Paul E. McKenney
>> <paulmck@linux.vnet.ibm.com> wrote:
>> > On Sun, Dec 14, 2014 at 08:29:33AM -0800, Andy Lutomirski wrote:
>> >> On Sun, Dec 14, 2014 at 4:03 AM, Paul E. McKenney
>> >> <paulmck@linux.vnet.ibm.com> wrote:
>> >> > On Sat, Dec 13, 2014 at 11:26:36PM -0800, Andy Lutomirski wrote:
>> >> >> On Dec 13, 2014 10:58 PM, "Stephen Rothwell" <sfr@canb.auug.org.au> wrote:
>> >> >> >
>> >> >> > Hi Andy,
>> >> >> >
>> >> >> > The luto-misc tree seems to have a whole series of commits in it that
>> >> >> > have just bee removed from the rcu tree ...  You really have to be very
>> >> >> > careful if you base your work on a tree that is regularly rebased.
>> >> >>
>> >> >> Hmm.  They were there a couple days ago.  Paul, what should I do about
>> >> >> this?  I only need the one NMI nesting change for the stuff in
>> >> >> luto/next.
>> >> >>
>> >> >> > I also wonder if the other commits in that tree are destined for
>> >> >> > v3.19?  If they are for v3.20, then they should not be in linux-next
>> >> >> > until after v3.19-rc1 has been released.
>> >> >>
>> >> >> They're for 3.20.  I'll drop the whole series from the next branch for now.
>> >> >
>> >> > You mean the NMI nesting change below, correct?  One approach would be
>> >> > to include the branch rcu/dev from my -rcu tree.  Would that work for you?
>> >>
>> >> That would work.
>> >>
>> >> The problem is that, if you rebase again and I don't notice, then
>> >> it'll generate a pile of conflicts.  Is there someway that I can flag
>> >> my next tree as depending on a certain commi existing in another tree
>> >> so that the scripts that generate linux-next will ignore it if the
>> >> base commit goes away?
>> >
>> > The commits would still stick around because I keep date-encoded branches.
>> > But just to make things easier, I created a andy.2014.11.21a branch that
>> > points to the current commit and will stay there.  Please let me know how
>> > it goes.
>>
>> That's the same commit that's in rcu/dev and was in luto/next, I
>> think.  Is the issue just that you pulled the whole thing from
>> whichever linux-rcu branch is in -next, but I still had it, so it
>> caused a problem?
>
> I still have the commit.  All I did was move the rcu/next branch that
> Stephen pulls from.
>
>> In any case, I'll wait for 3.19-rc1 before re-adding any of this.
>
> That does sound simpler, as I will make this commit available to -next
> at that point.  ;-)
>

I'm re-adding the branch, since 3.19-rc1 is out, the change appears to
still exist as-is in your tree, and it merges cleanly and builds in
the latest -next for me.  Let me know if this will be problematic for
any reason.

Thanks,
Andy

>                                                         Thanx, Paul
>



-- 
Andy Lutomirski
AMA Capital Management, LLC
