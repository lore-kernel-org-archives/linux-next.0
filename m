From: "Serge E. Hallyn" <serue@us.ibm.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Thu, 13 Nov 2008 08:46:31 -0600
Message-ID: <20081113144631.GB9773@us.ibm.com>
References: <20081113162404.e8d64523.sfr@canb.auug.org.au> <23452.1226579584@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e32.co.us.ibm.com ([32.97.110.150]:50446 "EHLO
	e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751064AbYKMOql (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Nov 2008 09:46:41 -0500
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com [9.17.195.227])
	by e32.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mADEjWSS016301
	for <linux-next@vger.kernel.org>; Thu, 13 Nov 2008 07:45:32 -0700
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mADEkWDs056834
	for <linux-next@vger.kernel.org>; Thu, 13 Nov 2008 07:46:34 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mADEk3IG030020
	for <linux-next@vger.kernel.org>; Thu, 13 Nov 2008 07:46:03 -0700
Content-Disposition: inline
In-Reply-To: <23452.1226579584@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org

Quoting David Howells (dhowells@redhat.com):
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > 
> > Today's linux-next merge of the creds tree got conflicts against the
> > security-testing tree (besides the two I tried to fix up).
> > 
> > I have dropped it again for today.
> > 
> > I think the only way forward is for you and James to come to some
> > arrangement.  Probably this will involve James merging your tree into his
> > and me removing creds as a separate tree from linux-next.
> 
> We have come to an arrangement.  I'm fixing up my patches so that James can
> just stack them on top of his tree.  After that, you'll get them via James.

Please let me know when you have those - if they are done today, then
I'll try to port the userns patch tomorrow morning.  Otherwise, I'm
on vacation next week, and while I usually try to sneak in some lkml
reading, my wife has threatened to hide my laptop.

-serge
