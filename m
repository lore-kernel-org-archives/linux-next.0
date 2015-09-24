From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Sep 24 (netup_unidvb & if)
Date: Thu, 24 Sep 2015 17:05:55 -0400
Message-ID: <20150924170555.621c83ea@gandalf.local.home>
References: <20150924145335.2674d15d@canb.auug.org.au>
	<5604388C.2040604@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5604388C.2040604@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>
List-Id: linux-next.vger.kernel.org

On Thu, 24 Sep 2015 10:53:16 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 09/23/15 21:53, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20150923:
> > 
> 
> on x86_64:
> 
> 

Compiles fine for me, and I enabled:

 CONFIG_PROFILE_ALL_BRANCHES=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_ANALOG_TV_SUPPORT=y

which looks like it should give the problem you have.

What config did you use, and maybe it's a gcc version problem?

-- Steve
