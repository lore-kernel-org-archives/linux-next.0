From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: sparc tree build failure
Date: Mon, 28 Jul 2008 13:16:58 +0200
Message-ID: <20080728111658.GA30539@uranus.ravnborg.org>
References: <20080728163808.55efadb1.sfr@canb.auug.org.au> <20080728082114.GA11366@uranus.ravnborg.org> <20080728201214.c775f127.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:29135 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754022AbYG1LQW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 07:16:22 -0400
Content-Disposition: inline
In-Reply-To: <20080728201214.c775f127.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

On Mon, Jul 28, 2008 at 08:12:14PM +1000, Stephen Rothwell wrote:
> Hi Sam,
> 
> On Mon, 28 Jul 2008 10:21:14 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > I cannot reproduce it here...
> > Can you try to delete rm -rf usr/include/ and build again.
> 
> These builds always start with a completely empty object directory.
> 
> > If it continue to happen then try to send me a "make V=1" output.
> 
> Its happened every build since 20080723 ... but I will try to get a V=1
> build.
OK - then it is the old breakage.
I had to break headers_check for a while when merging
the header files for sparc and sparc64.
This is now done and patches are in davem's sparc-next and
a pull request are sent to Linus.

So expect this breakage to be fixed next time you pull (assuming
you pull in sparc-next or Linus pulls in from davem).

Sorry for the hassle it has gving you - but I could not work out
a way that avoided the breakage.

	Sam
