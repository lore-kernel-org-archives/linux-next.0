From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 13 (x86_64: panic)
Date: Sat, 14 Jun 2008 16:15:56 -0700
Message-ID: <20080614161556.0329d03a.randy.dunlap@oracle.com>
References: <20080613232214.394fd6fd.sfr@canb.auug.org.au>
	<20080613155809.7699fc11.randy.dunlap@oracle.com>
	<20080614181646.d91dcbda.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:54751 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755567AbYFNXPz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 14 Jun 2008 19:15:55 -0400
In-Reply-To: <20080614181646.d91dcbda.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, 14 Jun 2008 18:16:46 +1000 Stephen Rothwell wrote:

> Hi Randy,
> 
> On Fri, 13 Jun 2008 15:58:09 -0700 Randy Dunlap <randy.dunlap@oracle.com> wrote:
> >
> > When booting linux-next-20080613, I'm seeing a panic (on x86_64):
> > 
> > 
> > Freeing unused kernel memory: 380k freed
> > Write protecting the kernel read-only data: 4616k
> > uhci_hcd: version magic '2.6.26-rc6 SMP mod_unload ' should be '2.6.26-rc6-next-20080613 SMP mod_unload '
> > ohci_hcd: version magic '2.6.26-rc6 SMP mod_unload ' should be '2.6.26-rc6-next-20080613 SMP mod_unload '
> > ehci_hcd: version magic '2.6.26-rc6 SMP mod_unload ' should be '2.6.26-rc6-next-20080613 SMP mod_unload '
> > cciss: version magic '2.6.26-rc6 SMP mod_unload ' should be '2.6.26-rc6-next-20080613 SMP mod_unload '
> 
> These look strange.  Are you sure you rebuilt and installed all your
> modules and removed any old ones lying around?

It's possibly (yet another) script problem.  I'll check it out.  Thanks.

---
~Randy
'"Daemon' is an old piece of jargon from the UNIX operating system,
where it referred to a piece of low-level utility software, a
fundamental part of the operating system."
