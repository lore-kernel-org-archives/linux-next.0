From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 10:45:37 -0800
Message-ID: <20150205184537.GJ5370@linux.vnet.ibm.com>
References: <20150205005716.GS5370@linux.vnet.ibm.com>
 <CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com>
 <20150205015144.GT5370@linux.vnet.ibm.com>
 <CA+icZUUHBh-voBUfYEwajL7upnj3SJC47zJN-WnRW_7tnEnQsA@mail.gmail.com>
 <54D3186F.7030500@sr71.net>
 <20150205130343.6ac0eda9@gandalf.local.home>
 <20150205130802.289a8be0@gandalf.local.home>
 <54D3B253.3050000@sr71.net>
 <20150205183412.GI5370@linux.vnet.ibm.com>
 <54D3B7F5.9070209@sr71.net>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54D3B7F5.9070209@sr71.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave@sr71.net>
Cc: Steven Rostedt <rostedt@goodmis.org>, sedat.dilek@gmail.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 05, 2015 at 10:35:33AM -0800, Dave Hansen wrote:
> On 02/05/2015 10:34 AM, Paul E. McKenney wrote:
> >> >                               Did I actually need to be
> >> > onlining/offlining CPUs to hit the splat that Sedat was reporting?
> > Yep, you do need to offline at least one CPU to hit that splat.
> 
> Heh, do we need a debugging mode that will randomly offline/online CPUs? :)

For that, kernel/rcu/rcutorture.c and kernel/locking/locktorture.c
are your friends.  ;-)

The problem is that I only run RCU-relevant combinations of Kconfigs,
which means that I missed the ones that Sedat used to find this problem.
So I guess it is a good thing that others run -next testing.

							Thanx, Paul
