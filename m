From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Subject: Re: [PATCH 0/2] Tentative fix for the divide-by-zero on
 score/paris/..
Date: Wed, 15 Apr 2015 18:49:43 +0200
Message-ID: <20150415164943.GF5947@chrystal.uk.oracle.com>
References: <20150414165000.GA19434@roeck-us.net>
 <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
 <552E6722.1080507@roeck-us.net>
 <20150415134637.GB5947@chrystal.uk.oracle.com>
 <20150415153150.GA1149@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150415153150.GA1149@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>, lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 15, 2015 at 08:31:50AM -0700, Guenter Roeck wrote:
> On Wed, Apr 15, 2015 at 03:46:37PM +0200, Quentin Casasnovas wrote:
> > > 
> > > While I agree that those should get fixed (if they are real problems,
> > > especially the ones for parisc and mn10300), I don't think it is
> > > a good idea to fail the build because of it.
> > 
> > That's a tough one..  I think it's pretty bad in general to have some
> > crufts in the ex_table referencing non-executable sections.  Note that it
> > will not make the build fail if the relocation _seems_ legit (jump to an
> > executable section even though it's not part of the white-list) but in
> > those cases, something really does look wrong and could potentially have a
> > security impact so I thought the build failure was a good thing to do.
> > 
> 
> Guess we have a different philosophy; mine is "do no harm".
> 

Well I certainly did not intend to break any other architectures and do no
harm.  Breaking the build early in case of security issue sounds like the
opposite of doing harm to me :)  And it lead to you fixing a potential
unprivileged denial-of-service IIUC your score patch.

I am really sorry that it broke the build because of bugs in modpost
though.

> 
> > Regarding the others, if you've compiled them with debug information, you
> > should be able to do some addr2line magic incantation to find the offending
> > code.  I've also added scripts/check_extable.sh which you might be able to
> > use to get more details about the failures (or simply use the same logic in
> > there to know where those maybe-wrong-relocations are coming from).
> > 
> > I'm surprised/concerned that some sections appear to have no name though
> > (indicating yet another bug in my modpost changes?).. If you can share the
> > object files then I can have a look (and possibly help with the addr2line
> > incantation).
> >
> 
> I don't really have time to do that; please keep in mind that I am not getting
> paid for this and do it in my free time. Both the parisc and mn10300 (am33)
> tool chains are available from kernel.org; it should be straightforward to 
> install them and see yourself what is going on. Unlike score I did not find
> the problem in those architectures with code inspection.
> 

Sorry Guenter, it's just that you proposed your help earlier and as you had
the environment already configured I completely abused you!  Thanks for the
report and testing.

I've had a look at parisc and I think I understand what happens.  Unlike on
x86_64 where all relocations in __ex_table are internal, parisc can have
relocations in __ex_table to unresolved symbols, and the build system runs
modpost on those temporary objects, which the code does not handle well
since it was expecting a relocation to a section internal to the object.

I have a fix ready but will do more testing on other architectures before
sending it (I suspect it is the same issue).

Quentin
