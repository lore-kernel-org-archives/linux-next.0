From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: unable to fetch the watchdog tree
Date: Mon, 5 Dec 2016 09:39:34 +1100
Message-ID: <20161205093934.4d5449fa@canb.auug.org.au>
References: <20161114093426.2000ff4c@canb.auug.org.au>
        <20161114152615.GA16294@spo001.leaseweb.nl>
        <20161122094919.2a7365e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38613 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751230AbcLDWka (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 4 Dec 2016 17:40:30 -0500
In-Reply-To: <20161122094919.2a7365e5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wim Van Sebroeck <wim@iguana.be>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Wim,

On Tue, 22 Nov 2016 09:49:19 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Mon, 14 Nov 2016 16:26:16 +0100 Wim Van Sebroeck <wim@iguana.be> wrote:
> >
> > This has been fixed. Thanks for notifying me about it.
> >   
> > > For the past few days (nearly a week, sorry) fetching the watchdog tree
> > > (git://www.linux-watchdog.org/linux-watchdog-next.git#master) has
> > > resulted in a hung connection.  
> 
> It's happening again :-(

And again.  Have you considered moving your tree somewhere more
reliable like kernel.org?

-- 
Cheers,
Stephen Rothwell
