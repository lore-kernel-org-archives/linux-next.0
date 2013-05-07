From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: linux-next: unable to fetch the watchdog tree
Date: Tue, 7 May 2013 22:29:50 +0200
Message-ID: <20130507202950.GS14155@spo001.leaseweb.com>
References: <20130507101246.1337bb2362b2f9fc202923fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130507101246.1337bb2362b2f9fc202923fc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> Trying to fetch the watchdog tree
> (git://www.linux-watchdog.org/linux-watchdog-next.git#master)
> pauses for a long time, and then produces this error:
> 
> fatal: read error: Connection reset by peer
> 
> I will continue to use what I previously fetched.

Thanks for pointing it out again. It restarted git-daemon. It should be fixed now.

Only thing I still need to do is catch up from some overloaded work weeks.

Kind regards,
Wim.
