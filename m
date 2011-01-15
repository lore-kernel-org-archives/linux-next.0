From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: Tree for January 15 (Call Trace in fs/dcache.c +
 autofs4)
Date: Sat, 15 Jan 2011 07:57:23 +0000
Message-ID: <20110115075723.GJ19804@ZenIV.linux.org.uk>
References: <AANLkTik4JfjBEurjX4T3sAtGf9CPJvQYkV5aZWgE=XD1@mail.gmail.com>
 <AANLkTin0SUG3Q3aHVfBqCV8=iWThy3MTfG90ikMsrox9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:44761 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751180Ab1AOH50 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 15 Jan 2011 02:57:26 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTin0SUG3Q3aHVfBqCV8=iWThy3MTfG90ikMsrox9@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Sat, Jan 15, 2011 at 08:46:20AM +0100, Sedat Dilek wrote:

> Will try the patch from [1] as there was no feedback yet.
> 
> - Sedat -
> 
> [1] https://lkml.org/lkml/2011/1/12/394

There's also vfsmount refcounting breakage somewhere in automount series,
unfortunately caught only when redoing said refcounting on top of it [1] ;-/
I'm bisecting it right now, will post when it's done.

[1] with mnt{get,put}_long() variant the breakage is present, but not
immediately noticable.  With (local) rewrite to saner rules it became
visible, but I spent quite a while trying to find the bug in the most
obvious place - i.e. that rewrite.
